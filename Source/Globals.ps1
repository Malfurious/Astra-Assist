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
	Else { $afternoon = "AM" }
	$hours = $hours.ToString()
	$minutes = $minutes.ToString()
	If ($minutes.Length -eq 1)
	{
		$minutes = $minutes + "0"	
	}
	$time = $hours + ":" + $minutes + " " + $afternoon
	Return $time
}

function Get-CurrentTime
{
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



function Get-RoomAvailability ($sectiontime, $currenttime)
{
	$i = 0
	$nextclass = @("Available", "Approaching Class", "Start Time", "End Time", "Index")
	$nextclass[0] = "None"
	$nextclass[1] = "None"
	$nextclass[2] = "0"
	$nextclass[3] = "0"
	$nextclass[4] = "0"
	$times = $sectiontime.Length
	$frames = $sectiontime.Length /2
	For ($i = 0; $i -le ($times - 1); $i++)
	{
		If ($currenttime -ge $sectiontime[$i])
		{
			If ($currenttime -eq $sectiontime[$i])
			{
				If ($i -eq ($times - 2))
				{
					$nextclass[0] = "False"
					$nextclass[1] = "False"
					$nextclass[2] = "0"
					$nextclass[3] = [int]($sectiontime[$i + 1])
					$nextclass[4] = ($i)
					$i = $times
				}
				elseif ($i -eq ($times - 1))
				{
					$nextclass[0] = "True"
					$nextclass[1] = "False"
					$nextclass[2] = "0"
					$nextclass[3] = "0"
					$nextclass[4] = ($i)
					$i = $times
				}
				elseif ($i % 2 -eq 0)
				{
					$nextclass[0] = "False"
					$nextclass[1] = "True"
					$nextclass[2] = [int]($sectiontime[$i + 3])
					$nextclass[3] = [int]($sectiontime[$i + 2])
					$nextclass[4] = ($i)
					$i = $times
				}
				elseif ($i % 2 -eq 1)
				{
					$nextclass[0] = "True"
					$nextclass[1] = "True"
					$nextclass[2] = [int]($sectiontime[$i + 1])
					$nextclass[3] = [int]($sectiontime[$i + 2])
					$nextclass[4] = ($i)
					$i = $times
				}
			}
		}
		elseif ($currenttime -lt $sectiontime[$i])
		{
			If ($i -eq ($times - 2))
			{
				$nextclass[0] = "True"
				$nextclass[1] = "True"
				$nextclass[2] = [int]($sectiontime[$i])
				$nextclass[3] = [int]($sectiontime[$i + 1])
				$nextclass[4] = ($i)
				$i = $times
			}
			elseif ($i -eq ($times - 1))
			{
				$nextclass[0] = "False"
				$nextclass[1] = "False"
				$nextclass[2] = "0"
				$nextclass[3] = [int]($sectiontime[$i])
				$nextclass[4] = ($i)
				$i = $times
			}
			elseif ($i % 2 -eq 0)
			{
				$nextclass[0] = "True"
				$nextclass[1] = "True"
				$nextclass[2] = [int]($sectiontime[$i])
				$nextclass[3] = [int]($sectiontime[$i + 1])
				$nextclass[4] = ($i)
				$i = $times
			}
			elseif ($i % 2 -eq 1)
			{
				$nextclass[0] = "False"
				$nextclass[1] = "True"
				$nextclass[2] = [int]($sectiontime[$i + 1])
				$nextclass[3] = [int]($sectiontime[$i])
				$nextclass[4] = ($i)
				$i = $times
			}
		}
	}
	Return $nextclass
}


function Get-LocationID ($buildingcode, $roomnumber)
{
	$xmlpath = Get-ScriptDirectory
	$xmlpath = $xmlpath + "\CarthageData.dat"
	[xml]$packages = Get-Content -Path $xmlpath
	$bnode = $packages | Select-Xml -Xpath "//Building"
	$locid = $bnode | Select-Object -ExpandProperty "node" | Where-Object { $_.Code -eq $buildingcode } | Select-Object -ExpandProperty ChildNodes | Where-Object { $_.Number -eq $roomnumber } | Select LocationID
	$loc = $locid.LocationID
	Return $loc
}

function Get-TodaysActivities ($loc, $date)
{
	$sectionmeetings = @()
	$cookieurl = "https://astra.carthage.edu/Astra/Portal/GuestPortal.aspx"
	$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
	$ckreq = Invoke-WebRequest -Uri $cookieurl -SessionVariable websession
	$cookies = $websession.Cookies.GetCookies($cookieurl)
	$session.Cookies.Add($cookies)
	$baseurl = "http://astra.carthage.edu/Astra/~api/calendar/calendarList?fields=SectionMeetInstanceByActivityId.SectionMeeting.PrimaryInstructor.Person.FirstName,SectionMeetInstanceByActivityId.SectionMeeting.PrimaryInstructor.Person.LastName,ActivityName,StartDate,EndDate,StartMinute,EndMinute,LocationId&filter="
	$filters = "(((StartDate%3E%3D%22" + $date + "%22)%26%26(EndDate%3C%3D%22" + $date + "%22))%26%26(LocationId%20in%20(%22" + $locid + "%22)))"
	$bi = $baseurl + $filters
	$results = Invoke-WebRequest -URI $bi -WebSession $session
	$act = @()
	$acts = $results.Content
	$dur = $acts.Length
	For ($i = 0; $i -lt $dur; $i++)
	{
		If ($acts[$i] -eq "[")
		{
			If ($acts[$i + 1] -eq "[")
			{
				$st = ($i + 1)
			}
			Else
			{
				$st = $i
			}
		}
		Elseif ($acts[$i] -eq "]")
		{
			If ($acts[$i + 1] -eq "]")
			{
				$en = ($i - $st) + 1
				$act += $acts.Substring($st, $en)
				$i = ($i + 1)
			}
			Else
			{
				$en = ($i - $st) + 1
				$act += $acts.Substring($st, $en)
			}
		}
	}
	If ($act -ne "[]")
	{
		$times = ($act | Select-String -Pattern '\d{2,4}[,]\d{2,4}' -AllMatches | %{ $_.Matches } | %{ $_.Value }).Split(",")
		$info = @()
		$fname = @()
		$eventnames = @()
		$timecounter = 0
		For ($s = 0; $s -lt $act.Length; $s++)
		{
			$ex = $act[$s].ToString()
			$punc = 0
			While ($punc -le 6)
			{
				For ($i = 0; $i -lt ($ex.Length); $i++)
				{
					If ($ex[$i] -eq '"' -And $punc -lt 1)
					{
						$punc++
						$st = ($i + 1)
					}
					Elseif ($ex[$i] -eq '"' -And $punc -eq 1)
					{
						$en = ($i - $st)
						$first = $ex.SubString($st, $en)
						$punc++
					}
					Elseif ($ex[$i] -eq '"' -And $punc -eq 2)
					{
						$punc++
						$st = ($i + 1)
					}
					Elseif ($ex[$i] -eq '"' -And $punc -eq 3)
					{
						$en = ($i - $st)
						$last = $ex.SubString($st, $en)
						$fname += $first + " " + $last
						$punc++
					}
					ElseIf ($ex[$i] -eq '"' -And $punc -eq 4)
					{
						$punc++
						$st = ($i + 1)
					}
					Elseif ($ex[$i] -eq '"' -And $punc -eq 5)
					{
						$en = ($i - $st)
						$eventname = $ex.SubString($st, $en)
						$item = New-Object PSObject
						$item | Add-Member -type NoteProperty -Name 'InstructorName' -Value $fname[$s]
						$item | Add-Member -type NoteProperty -Name 'Times' -Value $times[$timecounter]
						$item | Add-Member -type NoteProperty -Name 'EventName' -Value $eventname
						$info += $item
						$timecounter++
						$item = New-Object PSObject
						$item | Add-Member -type NoteProperty -Name 'InstructorName' -Value $fname[$s]
						$item | Add-Member -type NoteProperty -Name 'Times' -Value $times[$timecounter]
						$item | Add-Member -type NoteProperty -Name 'EventName' -Value $eventname
						$info += $item
						$punc = 7
						$timecounter++
					}
				}
			}
		}
		$returnres = $info | Sort-Object @{ Expression = { $_.Times }; Ascending = $true }
		Return $returnres
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