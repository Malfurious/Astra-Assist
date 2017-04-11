#--------------------------------------------
# Declare Global Variables and Functions here
#--------------------------------------------


#Sample function that provides the location of the script
$roomwatermark = "DSC 251"
$datewatermark = "YYYY-MM-DD"
$timewatermark = "HH:MM:AM"
function Get-ScriptDirectory
{
<#
	.SYNOPSIS
		Get-ScriptDirectory returns the proper location of the script.

	.OUTPUTS
		System.String
	
	.NOTES
		Returns the correct path within a packaged executable.
#>
	[OutputType([string])]
	param ()
	if ($null -ne $hostinvocation)
	{
		Split-Path $hostinvocation.MyCommand.path
	}
	else
	{
		Split-Path $script:MyInvocation.MyCommand.Path
	}
}

#Sample variable that provides the location of the script
[string]$ScriptDirectory = Get-ScriptDirectory

function Convert-Minutes ($time)
{
	#Takes in time as raw Minutes (Ex. 770 Would have the function return 12:50 PM)
	[int]$time = $time
	If ($time -ne 0)
	{
		$seconds = ($time * 60)
		$hours = 0
		$minutes = 0
		While ($seconds -ge 60)
		{
			$seconds = ($seconds - 60)
			$minutes++
			IF ($minutes -eq 60)
			{
				$hours++
				$minutes = 0
			}
		}
		If ($hours -ge "12")
		{
			$afternoon = "PM"
			IF ($hours -ne "12")
			{
				$hours = $hours - 12
			}
		}
		elseif ($hours -eq 0)
		{
			$hours = 12
			$afternoon = "AM"
		}
		Else { $afternoon = "AM" }
		$hours = $hours.ToString()
		$minutes = $minutes.ToString()
		If ($minutes.Length -eq 1)
		{
			$minutes = "0" + $minutes
		}
		$rtime = $hours + ":" + $minutes + " " + $afternoon
		Return $rtime
	}
	Else
	{
		$rtime = "12:00 AM"
		Return $rtime
	}
}

function Get-CurrentTime
{
	#Uses the builtin PS cmdlet Get-Date to return the Current Time in Raw Minutes. (Ex. 12:50 PM would return 770 Minutes)
	[string]$syst = Get-Date -Format o
	$year = $syst.Substring(0,10)
	[int]$hours = $syst.Substring(11, 2)
	[int]$mins = $syst.Substring(14, 2)
	$time = @("Date","Minutes")
	$minutes = ($hours * 60) + $mins
	$time[1] = $minutes
	$time[0] = $year
	Return $time
}



function Convert-ToMinutes ($data)
{
	#Takes in Time data in "12:50 PM" Format, and returns Raw Minutes
	$d = ($data -split " ").Split(':')
	If ($d[2] -eq "PM")
	{
		$hours = [int]$d[0] + 12
	}
	Else
	{
		$hours = [int]$d[0]
	}
	$minutes = [int]$d[1] + ($hours * 60)
	Return $minutes
}

function Get-RoomAvailability ($events, $currenttime)
{
	#Takes in the $events data from the Get-TodaysActivities function, and the $currenttime in Raw Minutes
	#Returns an array, where the first cell is either "Yes" or "No", indicating if the room is available.
	#The second value in the array is only filled if there are still scheduled events after the current time was found.
	#The second value is the Start Time of the next event if the Room is available, or the End Time of the Current Event if not.
	$eventbackup = $events
	$times = @()
	For ($i = 0; $i -le $eventbackup.Length; $i++)	#This For loop reconfigures the event data to a better format.
	{
		If ($i -ne $eventbackup.Length)
		{
			$item = New-Object PSObject
			$item | Add-Member -Type NoteProperty -Name 'Times' -Value (Convert-ToMinutes $eventbackup.StartTime[$i])
			$item | Add-Member -Type NoteProperty -Name 'Position' -Value "Start"
			$item | Add-Member -Type NoteProperty -Name 'EventName' -Value $eventbackup.EventName[$i]
			$item | Add-Member -Type NoteProperty -Name 'CurrentTime' -Value 'No'
			$times += $item
			$item = New-Object PSObject
			$item | Add-Member -Type NoteProperty -Name 'Times' -Value (Convert-ToMinutes $eventbackup.EndTime[$i])
			$item | Add-Member -Type NoteProperty -Name 'Position' -Value "End"
			$item | Add-Member -Type NoteProperty -Name 'EventName' -Value $eventbackup.EventName[$i]
			$item | Add-Member -Type NoteProperty -Name 'CurrentTime' -Value 'No'
			$times += $item
		}
		Else
		{
			$item = New-Object PSObject
			$item | Add-Member -Type NoteProperty -Name 'Times' -Value ([int]$currenttime)
			$item | Add-Member -Type NoteProperty -Name 'Position' -Value "Current"
			$item | Add-Member -Type NoteProperty -Name 'EventName' -Value $eventbackup.EventName[$i]
			$item | Add-Member -Type NoteProperty -Name 'CurrentTime' -Value 'Yes'
			$times += $item
		}
	}
	$sortedtimes = $times | Sort-Object @{ Expression = { $_.Times }; Ascending = $true }	#Sorts the Times
	$ava = @()
	For ($i = 0; $i -lt $sortedtimes.Length; $i++)		#This For loop goes through the sorted time list, and sets the array to be returned from the function.
	{
		If ($sortedtimes.CurrentTime[$i] -eq "Yes")
		{
			If ($sortedtimes.Position[$i + 1] -eq "Start")
			{
				$ava += "Yes"
				$ava += (Convert-Minutes $sortedtimes.Times[$i + 1])
			}
			elseif ($sortedtimes.Position[$i + 1] -eq "End")
			{
				$ava += "No"
				$ava += (Convert-Minutes $sortedtimes.Times[$i + 1])
			}
			Else
			{
				$ava += "Yes"
			}
		}
	}
	Return $ava
}


function Get-LocationID ($buildingcode, $roomnumber)
{
	#This function takes in the Buildingcode (Ex. DSC) and Room Number. 
	#It then locates the LocationID for the specified Room in the CarthageData file and Returns it.
	$bnode = $packages | Select-Xml -Xpath "//Building"
	$locid = $bnode | Select-Object -ExpandProperty "node" | Where-Object { $_.Code -eq $buildingcode } | Select-Object -ExpandProperty ChildNodes | Where-Object { $_.Number -eq $roomnumber } | Select LocationID
	$loc = $locid.LocationID
	Return $loc
}

function Get-TodaysActivities ($loc, $date)
{
	$cookieurl = "https://astra.carthage.edu/Astra/Portal/GuestPortal.aspx"
	$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
	$ckreq = Invoke-WebRequest -Uri $cookieurl -SessionVariable websession
	$cookies = $websession.Cookies.GetCookies($cookieurl)
	$session.Cookies.Add($cookies)
	$baseurl = "http://astra.carthage.edu/Astra/~api/calendar/calendarList?action=get&view=json&fields=SectionMeetInstanceByActivityId.SectionMeeting.PrimaryInstructor.Person.FirstName,SectionMeetInstanceByActivityId.SectionMeeting.PrimaryInstructor.Person.LastName,ActivityName,StartMinute,EndMinute&filter="
	$filters = "(((StartDate%3E%3D%22" + $date + "%22)%26%26(EndDate%3C%3D%22" + $date + "%22))%26%26(LocationId%20in%20(%22" + $loc + "%22)))"
	$bi = $baseurl + $filters
	$results = Invoke-WebRequest -URI $bi -WebSession $session | ConvertFrom-Json
	$info = @()
	If ($results.data -ne $null)
	{
		For ($i = 0; $i -lt $results.data.length; $i++)
		{
			[array]$dat = ($results.data[$i] -split "'n" | ? { $_ }).Trim()
			If ($dat.Length -eq $results.data[$i].Length)
			{
				$item = New-Object PSObject
				$item | Add-Member -type NoteProperty -Name 'EventName' -Value $dat[2]
				$item | Add-Member -type NoteProperty -Name 'InstructorName' -Value ($dat[0] + " " + $dat[1])
				$item | Add-Member -type NoteProperty -Name 'StartTime' -Value ([int]$dat[3])
				$item | Add-Member -type NoteProperty -Name 'EndTime' -Value ([int]$dat[4])
				$info += $item
			}
			Else
			{
				$item = New-Object PSObject
				$item | Add-Member -type NoteProperty -Name 'EventName' -Value $dat[0]
				$item | Add-Member -type NoteProperty -Name 'InstructorName' -Value ("Not Available")
				$item | Add-Member -type NoteProperty -Name 'StartTime' -Value ([int]$dat[1])
				$item | Add-Member -type NoteProperty -Name 'EndTime' -Value ([int]$dat[2])
				$info += $item
			}
		}
		$info2 = $info | Sort-Object @{ Expression = { $_.StartTime }; Ascending = $true }
		$infofinal = @()
		For ($i = 0; $i -lt $info.Length; $i++)
		{
			$item = New-Object PSObject
			$item | Add-Member -type NoteProperty -Name 'EventName' -Value $info2.EventName[$i]
			$item | Add-Member -type NoteProperty -Name 'InstructorName' -Value $info2.InstructorName[$i]
			$item | Add-Member -type NoteProperty -Name 'StartTime' -Value (Convert-Minutes $info2.StartTime[$i])
			$item | Add-Member -type NoteProperty -Name 'EndTime' -Value (Convert-Minutes $info2.EndTime[$i])
			$infofinal += $item
		}
		Return $infofinal
	}
	Else
	{
		$noevents = "NoEvents"
		Return $noevents
	}
}

function Update-ComboBox
{
<#
	.SYNOPSIS
		This functions helps you load items into a ComboBox.
	
	.DESCRIPTION
		Use this function to dynamically load items into the ComboBox control.
	
	.PARAMETER ComboBox
		The ComboBox control you want to add items to.
	
	.PARAMETER Items
		The object or objects you wish to load into the ComboBox's Items collection.
	
	.PARAMETER DisplayMember
		Indicates the property to display for the items in this control.
	
	.PARAMETER Append
		Adds the item(s) to the ComboBox without clearing the Items collection.
	
	.EXAMPLE
		Update-ComboBox $combobox1 "Red", "White", "Blue"
	
	.EXAMPLE
		Update-ComboBox $combobox1 "Red" -Append
		Update-ComboBox $combobox1 "White" -Append
		Update-ComboBox $combobox1 "Blue" -Append
	
	.EXAMPLE
		Update-ComboBox $combobox1 (Get-Process) "ProcessName"
	
	.NOTES
		Additional information about the function.
#>
	
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNull()]
		[System.Windows.Forms.ComboBox]$ComboBox,
		[Parameter(Mandatory = $true)]
		[ValidateNotNull()]
		$Items,
		[Parameter(Mandatory = $false)]
		[string]$DisplayMember,
		[switch]$Append
	)
	
	if (-not $Append)
	{
		$ComboBox.Items.Clear()
	}
	
	if ($Items -is [Object[]])
	{
		$ComboBox.Items.AddRange($Items)
	}
	elseif ($Items -is [System.Collections.IEnumerable])
	{
		$ComboBox.BeginUpdate()
		foreach ($obj in $Items)
		{
			$ComboBox.Items.Add($obj)
		}
		$ComboBox.EndUpdate()
	}
	else
	{
		$ComboBox.Items.Add($Items)
	}
	
	$ComboBox.DisplayMember = $DisplayMember
}

function Error-CheckDateTime ($date, $alternatetime)
{
	[System.Collections.ArrayList]$time = $alternatetime -split ":"
	If ($time[0].Length -lt 2)
	{
		$timeone = $time[0]
		$time[0] = "0" + $timeone
	}
	If ($time[2] -eq $null)
	{
		$subtime = $time[1] -split " "
		If ($subtime[1] -eq $null)
		{
			$junk = $time.Add(($subtime.Substring(2, 2)).ToUpper())
			$time[1] = ($subtime.Substring(0, 2))
		}
		Else
		{
			$junk = $time.Add(($subtime[1]).ToUpper())
			$time[1] = $subtime[0]
		}
	}
	IF ($time[2] -eq "PM" -and $time[0] -lt "12")
	{
		$hours = [int]($time[0]) + 12
	}
	elseif ($time[2] -eq "PM" -and $time[0] -eq "12")
	{
		$hours = [int]($time[0])
	}
	else { $hours = [int]($time[0]) }
	$minutes = [int]($time[1])
	$currenttime = ($hours * 60) + $minutes
	[System.Collections.ArrayList]$datetest = $date -split ($date.Substring(4, 1))
	If ($datetest[1].Length -lt 2)
	{
		$datetest[1] = "0" + $datetest[1]
	}
	elseif ($datetest[2].Length -lt 2)
	{
		$datetest[2] = "0" + $datetest[2]
	}
	$date = $datetest[0] + "-" + $datetest[1] + "-" + $datetest[2]
	$realdate = $date + "T00%3A00%3A00"
	$results = @("date","time")
	$results[0] = $realdate
	$results[1] = $currenttime
	Return $results
}

function Get-RoomCardActs ($startdate, $enddate, $bldcd, $selbld)
{
	$cookieurl = "https://astra.carthage.edu/Astra/Portal/GuestPortal.aspx"
	$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
	$ckreq = Invoke-WebRequest -Uri $cookieurl -SessionVariable websession
	$cookies = $websession.Cookies.GetCookies($cookieurl)
	$session.Cookies.Add($cookies)
	$baseurl = "http://astra.carthage.edu/Astra/~api/calendar/calendarList?action=get&view=json&fields=SectionMeetInstanceByActivityId.SectionMeeting.PrimaryInstructor.Person.FirstName,SectionMeetInstanceByActivityId.SectionMeeting.PrimaryInstructor.Person.LastName,ActivityName,StartDate,EndDate,StartMinute,EndMinute,BuildingCode,RoomNumber&filter="
	If ($bldcd.Length -gt 10)
	{
		$filters = "(((StartDate%3E%3D%22" + $startdate + "%22)%26%26(EndDate%3C%3D%22" + $enddate + "%22))%26%26(LocationId%20in%20(%22" + $bldcd + "%22)))"
	}
	Else
	{
		$filters = "(((StartDate%3E%3D%22" + $startdate + "%22)%26%26(EndDate%3C%3D%22" + $enddate + "%22))%26%26(BuildingCode%20in%20(%22" + $bldcd + "%22)))"
	}
	$bi = $baseurl + $filters
	$results = Invoke-WebRequest -URI $bi -WebSession $session | ConvertFrom-Json
	If ($results.Data -ne $null)
	{
		$info = @()
		For ($i = 0; $i -lt $results.data.length; $i++)
		{
			$dat = ($results.data[$i] -split "'n" | ? { $_ }).Trim()
			If ($dat.Length -eq $results.data[$i].Length)
			{
				$item = New-Object PSObject
				$item | Add-Member -type NoteProperty -Name 'InstructorName' -Value ($dat[0] + " " + $dat[1])
				$item | Add-Member -type NoteProperty -Name 'EventName' -Value $dat[2]
				$item | Add-Member -type NoteProperty -Name 'StartTime' -Value ([int]$dat[5])
				$item | Add-Member -type NoteProperty -Name 'EndTime' -Value ([int]$dat[6])
				$item | Add-Member -type NoteProperty -Name 'EventDate' -Value ([datetime]$dat[3]).DayOfWeek
				$item | Add-Member -type NoteProperty -Name 'RoomName' -Value ($dat[7] + $dat[8])
				$info += $item
			}
			Else
			{
				$item = New-Object PSObject
				$item | Add-Member -type NoteProperty -Name 'InstructorName' -Value ("Not Available")
				$item | Add-Member -type NoteProperty -Name 'EventName' -Value $dat[0]
				$item | Add-Member -type NoteProperty -Name 'StartTime' -Value ([int]$dat[3])
				$item | Add-Member -type NoteProperty -Name 'EndTime' -Value ([int]$dat[4])
				$item | Add-Member -type NoteProperty -Name 'EventDate' -Value ([datetime]$dat[1]).DayOfWeek
				$item | Add-Member -type NoteProperty -Name 'RoomName' -Value ($dat[5] + $dat[6])
				$info += $item
			}
		}
		$roomlist = $info.RoomName | Sort-Object | Get-Unique -asString
		$infobackup = $info
		$info = @()
		$daysofweek = @("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
		Foreach ($room in $roomlist)
		{
			Foreach ($day in $daysofweek)
			{
				$info += $infobackup | Sort-Object @{ Expression = { $_.RoomName }; Ascending = $true } | Where-Object { $_.RoomName -eq $room } | Sort-Object @{ Expression = { $_.EventDate }; Ascending = $true } | Where-Object { $_.EventDate -eq $day } | Sort-Object @{ Expression = { $_.StartTime }; Ascending = $true }
			}
		}
		$infofinal = @()
		For ($i = 0; $i -lt $info.Length; $i++)
		{
			$item = New-Object PSObject
			$item | Add-Member -type NoteProperty -Name 'InstructorName' -Value $info.InstructorName[$i]
			$item | Add-Member -type NoteProperty -Name 'EventName' -Value $info.EventName[$i]
			$item | Add-Member -type NoteProperty -Name 'StartTime' -Value (Convert-Minutes $info.StartTime[$i])
			$item | Add-Member -type NoteProperty -Name 'EndTime' -Value (Convert-Minutes $info.EndTime[$i])
			$item | Add-Member -type NoteProperty -Name 'EventDate' -Value $info.EventDate[$i]
			$item | Add-Member -type NoteProperty -Name 'RoomName' -Value $info.RoomName[$i]
			$item | Add-Member -type NoteProperty -Name 'BuildingName' -Value $selbld
			$infofinal += $item
		}
		Return $infofinal
	}
	Else
	{
		$noevents = "NoEvents"
		Return $noevents
	}
}

function Update-Check
{
	$res = Test-Path ((Get-ScriptDirectory) + "\UpdateCheck.txt")
	If ($res -eq $true)
	{
		[int]$upchkcnt = Get-Content ((Get-ScriptDirectory) + "\UpdateCheck.txt")
	}
	If ($upchkcnt -eq $null -or $upchkcnt -ge 5)
	{
		Remove-Item -Path ((Get-ScriptDirectory) + "\UpdateCheck.txt") -Force
		$exepath = Get-ScriptDirectory
		$exepath = $exepath + "\Astra Assist.exe"
		$iv = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($exepath).FileVersion
		If ($iv.Length -gt 5)
		{
			$iv = $iv.SubString(0, 5)
		}
		$baseurl = "https://sheets.googleapis.com/v4/spreadsheets/1ewVNrW141HMNX3wxPej2MF4sLZE_HswCQSktnzjsAvA/values/A2:B2?key=AIzaSyD_-tGA6eLf4zRi1c8HnafMhcPksa2XV-E"
		$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
		$results = Invoke-WebRequest -URI $baseurl -WebSession $session
		[array]$dat = $results.Content | ConvertFrom-Json | Foreach-Object { $_.Values }
		$cv = $dat[0]
		$cvlink = $dat[1]
		If ($cv -gt $iv)
		{
			$wshell = New-Object -ComObject Wscript.Shell
			$btclicked3 = $wshell.Popup("Notice: There is a newer version of Astra Assist available!
	    Installed Version: " + $iv + "
	    Update Version: " + $cv + "
	    Click 'Yes' below if you would like to Update now. Or click 'No' if you do not.", 0, "New Version Detected", 0x4)
			If ($btclicked3 -eq "6")
			{
				$dpath = $env:USERPROFILE
				$dpath = $dpath + "\Setup_AstraAssist.msi"
				Invoke-WebRequest -Uri $cvlink -OutFile $dpath
				$scriptblock = 'Start-Process ("$env:USERPROFILE" + "\Setup_AstraAssist.msi") -Wait; Remove-Item -Path ("$env:USERPROFILE" + "\AAUpdate.ps1") -Force; Remove-Item -Path ("$env:USERPROFILE" + "\Setup_AstraAssist.msi") -Force;Start-Process ("C:\Program Files (x86)\Carthage College\Astra Assist\Astra Assist.exe")'
				$scriptblock | Out-File ("$env:USERPROFILE" + "\AAUpdate.ps1")
				Start-Process powershell -Argumentlist "cd $env:USERPROFILE;&./AAUpdate.ps1" -WindowStyle Hidden
				$formAstraAssist.Close()
			}
			Else
			{
				$up = 1
				$up | Out-File ((Get-ScriptDirectory) + "\UpdateCheck.txt")
			}
		}
	}
	Else
	{
		$upchkcnt = $upchkcnt + 1
		$upchkcnt | Out-File ((Get-ScriptDirectory) + "\UpdateCheck.txt")
	}
}

function Event-Request ($room)
{
	If ($room -eq "Academic")
	{
		$url = "https://astra.carthage.edu/Astra/events/EventReqForm.aspx?id=7fc3ce0e-16c0-41b1-965c-27cf0308c9f4&returnURL=#viewmode%3Dedit"
	}
	Elseif ($room -eq "TWC")
	{
		$url = "https://astra.carthage.edu/Astra/events/EventReqForm.aspx?id=31268914-8f5f-4eeb-bf14-81aa44d3a034&returnURL=#viewmode%3Dedit"
	}
	Elseif ($room -eq "HL")
	{
		$url = "https://astra.carthage.edu/Astra/events/EventReqForm.aspx?id=e820e441-db2b-42bb-aeab-d07199537204&returnURL=#viewmode%3Dedit"
	}
	Elseif ($room -eq "Chapel")
	{
		$url = "https://astra.carthage.edu/Astra/events/EventReqForm.aspx?id=6d0d12de-96aa-499f-b9e3-e914bf82641d&returnURL=#viewmode%3Dedit"
	}
	Elseif ($room -eq "TARC")
	{
		$url = "https://astra.carthage.edu/Astra/events/EventReqForm.aspx?id=21ed4b05-5bce-4d0e-8ba6-c53be93a9b43&returnURL=#viewmode%3Dedit"
	}
	If ((Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice').ProgId -eq "ChromeHTML")
	{
		Start-Process chrome.exe -ArgumentList @('-incognito', $url)
	}
	Elseif ((Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice').ProgId -eq "OperaStable")
	{
		Start-Process opera -ArgumentList @('--private', $url)
	}
	Else
	{
		Start-Process iexplore.exe -ArgumentList @('-private', $url)
	}
}

function Get-InstructorData ($id)
{
	$datestring = Get-Date -Format o
	$datework = Get-Date
	$day = $datework.DayOfWeek
	If ($day -eq "Sunday")
	{
		$st = -6; $en = 0
	}
	Elseif ($day -eq "Monday")
	{
		$st = 0; $en = 6
	}
	Elseif ($day -eq "Tuesday")
	{
		$st = -1; $en = 5
	}
	Elseif ($day -eq "Wednesday")
	{
		$st = -2; $en = 4
	}
	Elseif ($day -eq "Thursday")
	{
		$st = -3; $en = 3
	}
	Elseif ($day -eq "Friday")
	{
		$st = -4; $en = 2
	}
	Elseif ($day -eq "Saturday")
	{
		$st = -5; $en = 1
	}
	$startdate = ((((Get-Date).AddDays($st)).GetDateTimeFormats('s') | Out-String).SubString(0, 10) + "T00%3A00%3A00")
	$enddate = ((((Get-Date).AddDays($en)).GetDateTimeFormats('s') | Out-String).SubString(0, 10) + "T00%3A00%3A00")
	$cookieurl = "https://astra.carthage.edu/Astra/Portal/GuestPortal.aspx"
	$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
	$ckreq = Invoke-WebRequest -Uri $cookieurl -SessionVariable websession
	$cookies = $websession.Cookies.GetCookies($cookieurl)
	$session.Cookies.Add($cookies)
	$baseurl = "http://astra.carthage.edu/Astra/~api/calendar/calendarList?action=get&view=json&fields=BuildingCode,RoomNumber,ActivityName,StartDate,EndDate,StartMinute,EndMinute&filter="
	$filters = "(((StartDate%3E%3D%22" + $startdate + "%22)%26%26(EndDate%3C%3D%22" + $enddate + "%22))%26%26(SectionMeetInstanceByActivityId.SectionMeeting.PrimaryInstructorId%20in%20(%22" + $id + "%22)))"
	$bi = $baseurl + $filters
	$results = Invoke-WebRequest -URI $bi -WebSession $session | ConvertFrom-Json
	$info = @()
	If ($results.Data -ne $null)
	{
		For ($i = 0; $i -lt $results.data.length; $i++)
		{
			$dat = ($results.data[$i] -split "'n" | ? { $_ }).Trim()
			$item = New-Object PSObject
			$item | Add-Member -type NoteProperty -Name 'EventName' -Value $dat[2]
			$item | Add-Member -type NoteProperty -Name 'StartTime' -Value ([int]$dat[5])
			$item | Add-Member -type NoteProperty -Name 'EndTime' -Value ([int]$dat[6])
			$item | Add-Member -type NoteProperty -Name 'RoomName' -Value ($dat[0] + $dat[1])
			$item | Add-Member -type NoteProperty -Name 'EventDate' -Value ([datetime]$dat[3]).DayOfWeek
			$info += $item
		}
		$daysofweek = @("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
		$infobackup = $info
		$info = @()
		Foreach ($day in $daysofweek)
		{
			$info += $infobackup | Sort-Object @{ Expression = { $_.EventDate }; Ascending = $true } | Where-Object { $_.EventDate -eq $day } | Sort-Object @{ Expression = { $_.StartTime }; Ascending = $true }
		}
		$infofinal = @()
		For ($i = 0; $i -lt $info.Length; $i++)
		{
			$item = New-Object PSObject
			$item | Add-Member -type NoteProperty -Name 'EventName' -Value $info.EventName[$i]
			$item | Add-Member -type NoteProperty -Name 'StartTime' -Value (Convert-Minutes $info.StartTime[$i])
			$item | Add-Member -type NoteProperty -Name 'EndTime' -Value (Convert-Minutes $info.EndTime[$i])
			$item | Add-Member -type NoteProperty -Name 'RoomName' -Value $info.RoomName[$i]
			$item | Add-Member -type NoteProperty -Name 'EventDate' -Value $info.EventDate[$i]
			$infofinal += $item
		}
		Return $infofinal
	}
	Else
	{
		$noevents = "NoEvents"
		Return $noevents
	}
}

function Gen-WeekPeriods
{
	$datestring = Get-Date -Format o
	$datework = Get-Date
	$day = $datework.DayOfWeek
	If ($day -eq "Sunday")
	{
		$st = -6; $en = 0
	}
	Elseif ($day -eq "Monday")
	{
		$st = 0; $en = 6
	}
	Elseif ($day -eq "Tuesday")
	{
		$st = -1; $en = 5
	}
	Elseif ($day -eq "Wednesday")
	{
		$st = -2; $en = 4
	}
	Elseif ($day -eq "Thursday")
	{
		$st = -3; $en = 3
	}
	Elseif ($day -eq "Friday")
	{
		$st = -4; $en = 2
	}
	Elseif ($day -eq "Saturday")
	{
		$st = -5; $en = 1
	}
	$weeklist = @()
	$wks = $st
	$wke = $en
	For ($i = 0; $i -le 12; $i++)
	{
		$item = New-Object PSObject
		$item | Add-Member -Type NoteProperty -Name 'WeekStart' -Value (($datework.AddDays($wks)).Date | Out-String).SubString(0, ((($datework.AddDays($wks)).Date | Out-String).Length - 18))
		$item | Add-Member -Type NoteProperty -Name 'WeekEnd' -Value (($datework.AddDays($wke)).Date | Out-String).SubString(0, ((($datework.AddDays($wke)).Date | Out-String).Length - 18))
		$item | Add-Member -Type NoteProperty -Name 'WeekList' -Value ((($datework.AddDays($wks)).Date | Out-String).SubString(0, ((($datework.AddDays($wks)).Date | Out-String).Length - 18)) + " To " + (($datework.AddDays($wke)).Date | Out-String).SubString(0, ((($datework.AddDays($wke)).Date | Out-String).Length - 18)))
		$weeklist += $item
		$wks = $wks + 7
		$wke = $wke + 7
	}
	Return $weeklist
}

function Create-RoomCards ($data, $dates, $fpath)
{
	
	$startdate = $dates[0]
	$enddate = $dates[1]
	$selbld = ($data.BuildingName[0]).ToString()
	$fmtdta = @()
	For ($i = 0; $i -lt $data.Length; $i++)
	{
		$times = $data.StartTime[$i].ToString() + " - " + $data.EndTime[$i].ToString()
		$item = New-Object PSObject
		
		$item | Add-Member -Type NoteProperty -Name 'Times' -Value $times
		
		$item | Add-Member -Type NoteProperty -Name 'Event Name' -Value $data.EventName[$i]
		
		$item | Add-Member -Type NoteProperty -Name 'Instructor/Contact' -Value $data.InstructorName[$i]
		
		$item | Add-Member -Type NoteProperty -Name 'Day' -Value $data.EventDate[$i]
		
		$item | Add-Member -Type NoteProperty -Name 'RoomName' -Value $data.RoomName[$i]
		
		$fmtdta += $item
		
	}
	
	
	
	$a = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<style>

 body {

 	font-family: sans-serif; 

 }

 h1 {

 	margin-bottom: 1px;

 	text-align: center; 

 }

 h3 {

 	text-align: center; 

 }

 table {

	border-style: 0px solid black; 

	border-collapse: collapse;

	width: 100%;

	page-break-inside: avoid; 

 }

 tr {

 	border-bottom: 1px solid black; 

 }

 td {

 	padding: 5px; 

 }

 tr:nth-child(even) { 

 	background-color: rgba(233,233,233,1); 

 }

 tr th {

 	background-color: rgba(148,198,241,.75); 

 }

 tr th h3 {

 	background-color: white;

 	text-align: left;

 	margin: 5px;

 	padding-top: 15px;

 }

 tr th:only-child { 

 	background-color: white;

 }

 tr th:nth-child(odd) { 

	width: 25%;

	}

 tr th:nth-child(even) {

 	width: 50%;

 }

 .pagebreak {

 	page-break-before: always;

 }

</style>

</head><body>'
	
	$roomlist = $data.RoomName | Sort-Object | Get-Unique -asString
	
	$daysofweek = @("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
	
	Foreach ($room in $roomlist)
	{
		
		$rmn = $room.SubString(($bldcd.Length), ($room.Length - ($bldcd.Length)))
		
		$a += '<h1>' + $selbld + " " + $rmn + '</h1>'
		
		$a += '<h3>All Activities from ' + $startdate + " to " + $enddate + '</h3>'
		
		$temp1 = $fmtdta | Where-Object { $_.RoomName -eq $room } | Select "Times", "Event Name", "Instructor/Contact", "Day"
		
		Foreach ($day in $daysofweek)
		{
			
			If (($temp1 | Where-Object { $_.Day -eq $day }) -ne $null)
			{
				
				$a += '<table>'
				
				$a += '<tr><th colspan="3"><h3>' + $day + '</h3></th></tr>'
				
				$a += '<tr><th>Times</th><th>Event Name</th><th>Instructor/Contact</th></tr>

'
				
				[array]$temp2 = $temp1 | Where-Object { $_.Day -eq $day } | Select "Times", "Event Name", "Instructor/Contact"
				
				For ($i = 0; $i -lt $temp2.Length; $i++)
				{
					
					If ($temp2.Length -ne 1)
					{
						
						$time = $temp2.Times[$i]
						
						$actname = $temp2."Event Name"[$i]
						
						$instname = $temp2."Instructor/Contact"[$i]
						
						$a += '<tr><td>' + $time + '</td><td>' + $actname + '</td><td>' + $instname + '</td></tr>

'
						
					}
					
					Else
					{
						
						$time = $temp2.Times
						
						$actname = $temp2."Event Name"
						
						$instname = $temp2."Instructor/Contact"
						
						$a += '<tr><td>' + $time + '</td><td>' + $actname + '</td><td>' + $instname + '</td></tr>

'
						
					}
					
				}
				
				$a += '</table>'
				
			}
			
		}
		
		$a += '<div class="pagebreak"></div>

'
		
	}
	
	$a += '	</body></html>'
	
	$a | Out-File $fpath
	
}