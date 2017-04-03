#----------------------------------------------
# Generated Form Function
#----------------------------------------------
function Show-MainForm_psf {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$formAstraAssist = New-Object 'System.Windows.Forms.Form'
	$tabcontrol1 = New-Object 'System.Windows.Forms.TabControl'
	$simpletab = New-Object 'System.Windows.Forms.TabPage'
	$datetimepicker2 = New-Object 'System.Windows.Forms.DateTimePicker'
	$roomname = New-Object 'System.Windows.Forms.TextBox'
	$radiobuttonCurrentTime = New-Object 'System.Windows.Forms.RadioButton'
	$labelRoomName = New-Object 'System.Windows.Forms.Label'
	$radiobuttonAlternateTime = New-Object 'System.Windows.Forms.RadioButton'
	$buttonCheckRoom = New-Object 'System.Windows.Forms.Button'
	$classname = New-Object 'System.Windows.Forms.TextBox'
	$labelCurrentNextEventName = New-Object 'System.Windows.Forms.Label'
	$labelRoomAvailability = New-Object 'System.Windows.Forms.Label'
	$labelCurrentEventEndsAt = New-Object 'System.Windows.Forms.Label'
	$labelAlternateTime = New-Object 'System.Windows.Forms.Label'
	$labelEventScheduledAfterC = New-Object 'System.Windows.Forms.Label'
	$roomavailability = New-Object 'System.Windows.Forms.TextBox'
	$classendtime = New-Object 'System.Windows.Forms.TextBox'
	$classafter = New-Object 'System.Windows.Forms.TextBox'
	$classaftertime = New-Object 'System.Windows.Forms.TextBox'
	$labelNextEventStartsAt = New-Object 'System.Windows.Forms.Label'
	$customtab = New-Object 'System.Windows.Forms.TabPage'
	$labelResults = New-Object 'System.Windows.Forms.Label'
	$buttonCheck = New-Object 'System.Windows.Forms.Button'
	$customresults = New-Object 'System.Windows.Forms.TextBox'
	$roomdetails = New-Object 'System.Windows.Forms.TextBox'
	$labelRoomDetails = New-Object 'System.Windows.Forms.Label'
	$roombox = New-Object 'System.Windows.Forms.ComboBox'
	$datetimepicker1 = New-Object 'System.Windows.Forms.DateTimePicker'
	$labelRoom = New-Object 'System.Windows.Forms.Label'
	$labelBuilding = New-Object 'System.Windows.Forms.Label'
	$buildingbox = New-Object 'System.Windows.Forms.ComboBox'
	$roomcardtab = New-Object 'System.Windows.Forms.TabPage'
	$label2 = New-Object 'System.Windows.Forms.Label'
	$label1 = New-Object 'System.Windows.Forms.Label'
	$roomselectionbox2 = New-Object 'System.Windows.Forms.ComboBox'
	$buildingselectionbox2 = New-Object 'System.Windows.Forms.ComboBox'
	$helptab = New-Object 'System.Windows.Forms.TabPage'
	$tooltip1 = New-Object 'System.Windows.Forms.ToolTip'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$formAstraAssist.SuspendLayout()
	$tabcontrol1.SuspendLayout()
	$simpletab.SuspendLayout()
	$customtab.SuspendLayout()
	$roomcardtab.SuspendLayout()
	#
	# formAstraAssist
	#
	$formAstraAssist.Controls.Add($tabcontrol1)
	$formAstraAssist.AcceptButton = $buttonCheckRoom
	$formAstraAssist.AutoScaleDimensions = '6, 13'
	$formAstraAssist.AutoScaleMode = 'Font'
	$formAstraAssist.ClientSize = '565, 300'
	$formAstraAssist.FormBorderStyle = 'FixedSingle'
	#region Binary Data
	$formAstraAssist.Icon = [System.Convert]::FromBase64String('
AAABAAQAQEAAAAEAGAAoMgAARgAAADAwAAABACAAqCUAAG4yAAAgIAAAAQAgAKgQAAAWWAAAEBAA
AAEAIABoBAAAvmgAACgAAABAAAAAgAAAAAEAGAAAAAAAADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAD/////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////8AAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAD/////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////8AAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////
////////////////////////////////////////////////////////////////////////////
///+/v/////////////////////+/v/////////////////+//7/////////////////////////
//////////////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAD/////////////////////////////////////////////////////////////
///////////////////////////////////+///////////8/f3z+/z+////////////////////
///9/f78/P7//v////////////////////////////////////////////////////8AAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////
///////////////////////////////////////////////////9/f/////bx+3c2fT////+/P//
//aZq9nIzfb////+/v7////+//7u7+389fz////+/v/9/f/+/v//////////////////////////
//////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////
///////////////////////////////////////////////////////////////////////////+
/v/////x9Pxsb9rY2fb////8/P////5+Z+VbSeH////+/v/+/v/////I1d+Ck+a5t+316fT////9
/f7+/v////////////////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////////////////////////
///////////////////////////8/f////6NoOggM+Ln5PX////+///69fhnUd0HFuC/wun///39
/P/+/v////+nwe0SGexXOenP0fj+//z9/f////////////////////////////////////////8A
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////
///////////////////////////////////////////////////7+/7////Mze4fG+s5K+ri5fT/
///////s8/hIU94ND+JTZNT2+fH////+/v79/v7///9yd+YDAPESI+BwieT++f3////+/v//////
//////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAD////////////////////////////////////////////////////////////////////////9
/f/////w7/dLQfEAB+w2Sd3n6vj////////s5fg9ON4qG+ETJN7M0PX////9/f/9/f/////R0/IW
GuoxGOgWFNx6i+X///3+/f////////////////////////////////8AAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////////////////
///////////////////+///8/v/////t7/hFTfAcC+ooG99MUNb79+/+///////G1+YSLt8wId8H
EOZWdef///7+/v/9/v/////i7PchMeshFuZJJOAiGN2trur////9/f7/////////////////////
//////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////
///////////////////////////////////////////+/f78+/7////r6fpLUeEWD+c/J98JEeN8
geP///r8+v////6qm9kVGeA8JN8mF+YrLeLg1vD////9/f7////29vlCWd0AF+BIJeAmGeBjVeH7
9Pj////+/v////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAD////////////////////////////////////////////////////9/f/+/v///v/8
//66r+gmQd8BF+BAJN9KIt8TDuq1sOv////7+/7///91h+UHFt9HIuEjIt8AGOKvser////8/P7/
///6+flmW98FFeFHJeASGuE7Otzc4/P////9/f7///////////////////////8AAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////////
///////8/P79/f7//v/////i1fFldeYOK94eGuA6IuFHJN0nEeotQuXw7fX////+/v////9TaeMH
F+BCIuA5JN8EAPOMhe3////8+/7////y+fk0Wt8AFeFIJOAnHuEOLN3G0PT////8/P7/////////
//////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////
/////////////////////////////v/+/f/////8+P3Q2PJde+ccLeITE905HeFFIeBDIOA9I+AA
AfN/ku////78+//////jzuwoI+QgEuxHI95HI98KB/BcSt797/b+///////z9/k8Wt0AF+BGI+A/
H+EGJt21yfT////8/P7///////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAD////////////////////////////////9/v7+/v/////K1fJhb+UMF+gH
Dug5F+dHJN9DIeA+H+FHJN4WF+Q0L+Xy6/X////8+/7////CvOsCI9wfIOBGIOBEI98cF+ItOuft
7fP////////e7PgkNugYFeVGJN86HuEGJ922yvT////8/P7///////////////////////8AAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD////////////////////////////+
/v/+/f////yrrvAIJOQVCeo0HOQ+I99DIt8+IOA9IOBII94iHOMEDu24vOz////9/f/9/P////+F
hOwFAvE/I99AIOBFI98aFuUeI/He4fL////////X1vITFu00FulKJN4cHOEYMd3X1vT////9/f7/
//////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/
///////////////////////9/f7////k6/VwWeMAB/IeG+NHI+BEIt9BIOA+IOE/H+FGI98/HeQJ
AvKOkvL////9/f/+/f/////x6vZNQt0cC+1GI98/IOBEIt8yGuUkFfHY0PL///////6Yj+cVD+U5
JN5GIeAjGuEtOd3a4PT////9/f7///////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAD////////////////////9/f7////k7fdRVt4PDuQyH+RDI95A
IOA+IOBBH+FHIOBHJd4fH98GFOV4g9j9//T//v/+/v/9/f/////L1PIQIeo6HOJCIt9AIOBEIt8z
GeUkFfHX0vL///////1qeOwZBfBJJd1BIuEpGOBgRd7u7PX////+/f7/////////////////////
//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD////////////////+/v//
///07vVVVt8RE+A/Jd9GId8+H+E/IN9FIt88Jd0mIOEVC+kpJdyVqO3///77+v7////////+/v//
//2Nd+YRD+Y9IuBBIOBAIOBDIt84GuUlE/HW0PL////+//1wWuwWB/BGJd1FIuEJFt5zger////8
/P7///////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAD////////////+//7//v/4/+xyY9oQEOE/JeBDIOA9H+FFId9EI983GuQGAPYXGeVkVebL
u+3////+/f///v/////////////6/vo3P+sjDO1IJd0/H+E/IOBGI98XFuYfH/Ld3fP////+//1r
be0YB+9JJtxDIeEjGd52k+r////9/P7///////////////////////////8AAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD////////////9/f////+SsecIDOo/IONDId8+IOBG
JN4xH+AUBvQVIeFsZt7Hs+z6/fr////9/f7////////////9/f7////Cs+wVFeZCIOA/IOBAIOA/
IOBGIuAJG98vQN3m6PT///////5/hucWA/FBI+BGIeAOGN53kOr////8/P7/////////////////
//////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD////////+/v//
///t8vclNecvFeZGJN5AH+FIJN8kDukXFOllb9vM0+P4//D//v/+//79/v7////////////+//7/
/f/7/+9zZ9wPCutGJN4/IOBAIOA/IOBFJN8KBexzWeb///z8/f/////MxOwTFu4xGOhKJN8IGN5y
kur////9/P7///////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAD////////9/f////+Ki+oADug0IeJGIOA7I98fEOYvMe/Cren///b+/vz+/v/9
/f/+///////////////////9/f7////V1+8ZL9kzHuBDIeBAIOBAIOA/IOBJI98JBPF+ku3////7
+/7//////PtbY+IAD+VOJ98PFt5veej////+/f////////////////////////////8AAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD////+/v/////48PYuPuMUEOlOJN43IeEK
FN9QaeHx7/n////+/f/9/P7+/v7////////////////////////+/v////+Qi+sdFt9BIuFBIOBA
IOA/IOBDIOA0IOEfINvAs+n////9/f7+/v/////l6fYqLPEoDuxFIt5mS93z5fP////+/f7/////
//////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD////9
/P7////AsO0RCu87It85JOENFt+Ob+H6+/r+/v/9/f/////////////////////////////////+
/v/////j5/koMN40HOBEIeA/IOBAIOA/IOBGIeAYGt88P+T48vv//////v/////9/f////+2qOQd
H+gAB+wyNuDk4PT////9/f7///////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAD////8/f////56gOcDB+1BJOIPF9+OfOH/9/r+///9/f7/////////
///////////////////////////8/P////98g+YPGN9GIuA/IOBAIOBAIOBDIOA5IuAAGeB/jNf/
//7+/v/////////////9/f////jA1t4uOvQRA+u/qev////9/f////////////////////////8A
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD+/v/////09vU7Q+kfFuIAF92A
beH/+Pn9///+/v/////////////////////////////////////9/f/////d3PYfNOIVHOBHIeA/
IOBAIOBAIOBEIuAqG+AqOuDg5en////+/f/////////////////9/v/////o6vVsat9tetz+/vv/
//////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAD+/v/////s8fY3OPALAfFCXeH18/r////9/f7/////////////////////////////////////
///9/P////9/k+gABetBIuJBIOBAIOBAIOA/IOBIIuEWFd2Rnuv////8/P7/////////////////
///////9/f7//v79///Y7uP5+/n///////////////////////////8AAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD+/f/////n6PUzKPAUCe/Lxuz////8/P7/////////////
///////////////////////////+/v/////w8fc4OOkYFeZGJN4/IOBAIOA/IOBHIuEiGeBEUODp
9fn////+/v/////////////////////////////+/v/+/v//////////////////////////////
//////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD9/f/////T5fYOGOuL
g+3///z9/f/////////////////////////////////////////////9/f/////X0PITDOwyGOlF
It4/IOBAIOBDIuApHt4kKd27zdj////+/v/////////////////////////////////////////+
/v7///////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAD9/f/////U3PpQRNzn5Pn////+/v//////////////////////////////////////
///////+/f////+OhecED+c+JN5BH+FAIOBBIOBCIeIOD+utmOf///78/P//////////////////
//////////////////////////////////////////////////////////////8AAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD+/v/////W5vWcm9r78/3////+/v//////////
///////////////////////////////+/////v/7//hNVOoaBvFJJd0+H+E/H+FDJt0SB+tZVu3/
//3+/f/+////////////////////////////////////////////////////////////////////
//////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD////////v
+fTp9+v///////7////////////////////////////////////////////+/v7////l4+EpOtwY
EexHI94+H+FFIt4wGeYAIubRze3////9/f7/////////////////////////////////////////
//////////////////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAD/////////////////////////////////////////////////////////
///////////9/f7////DyfARFu03IN9CIOBAIOBCI+AKD+d5aOb///v+/v//////////////////
//////////////////////////////////////////////////////////////////////8AAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD////////////+/v7/////////////
///////////////////////////////////////9/P7///+4ve0UDfNDH+FAIeBDIt8tG+MfGenL
0O/////8/P7/////////////////////////////////////////////////////////////////
//////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/
///////////////////////////////////////////////////////////////////9/P7///+Y
rO4JCPNCIeA/IeBJIuAMGd9sdeT///3+/////v//////////////////////////////////////
//////////////////////////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////////////////////
///////////////////8/P7///+Jpe4DBfNEIeBBIeA9IeEWGt6jo+j////9/f7/////////////
////////////////////////////////////////////////////////////////////////////
//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////
///////////////////////////////////////////////8/P7///+Npu4FBfNDIeBGIeAgHeAs
L9/p3PX////+/v//////////////////////////////////////////////////////////////
//////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAD////////////////////////////////////////////////////////////////////8
/P7///+IpO4DBfNDIeBHIuAlGN9fZuT///7/////////////////////////////////////////
//////////////////////////////////////////////////////////8AAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////////////
///////////////////////////9/P7///+eru4NCfJFIOA9JOAkEuGikdT///v+/v//////////
////////////////////////////////////////////////////////////////////////////
//////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////
///////////////////////////////////////////////////////9/f7///+5v+4QDvNAH+E5
IuAHGt+6xOv////9/P//////////////////////////////////////////////////////////
//////////////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAD/////////////////////////////////////////////////////////////
///////9/f7////Jye0XGeoeId89HeEUMt3W2/b////9/f//////////////////////////////
//////////////////////////////////////////////////////////////////8AAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////
///////////////////////////////////+/v/////79flHROUaD+s5Ht8lPN7l5PX////9/f//
////////////////////////////////////////////////////////////////////////////
//////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////
///////////////////////////////////////////////////////////////////+/f////5Q
ae0cB/E8Hd43R97q7vb////9/v//////////////////////////////////////////////////
//////////////////////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////////////////////////
///////////////////9/f////+jjecXEuUyG994Sd767/b////+/v//////////////////////
//////////////////////////////////////////////////////////////////////////8A
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////
///////////////////////////////////////////////+/v/////e4fQhIe4YDOpcTNv07vb/
///+/v//////////////////////////////////////////////////////////////////////
//////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAD////////////////////////////////////////////////////////////////////////+
/v/////5+fhST+cACOY8TN3g7vb////9/v//////////////////////////////////////////
//////////////////////////////////////////////////////8AAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////////////////
///////////////////////////////8/P////+eo+wABOw2Qt3m5/b////9/f//////////////
////////////////////////////////////////////////////////////////////////////
//////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////
///////////////////////////////////////////////////////////9/f7////b0O8jIuAU
I+fb2vX////9/f//////////////////////////////////////////////////////////////
//////////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAD/////////////////////////////////////////////////////////////////
///////////////+/v////uCdukEAPDGvPL////8/P//////////////////////////////////
//////////////////////////////////////////////////////////////8AAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////////
///////////////////////////////////////////+/v/////YyO0uHt2IgeL///7+/v//////
////////////////////////////////////////////////////////////////////////////
//////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////
///////////////////////////////////////////////////////////////////////////8
/P////+Gies6T9////7/////////////////////////////////////////////////////////
//////////////////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAD/////////////////////////////////////////////////////////
///////////////////////////9/v/////g5/dNXuHl4/n////+/v//////////////////////
//////////////////////////////////////////////////////////////////////8AAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////
///////////////////////////////////////////////////////////8/P7///+koOarn+T/
///9/f7/////////////////////////////////////////////////////////////////////
//////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/
////////////////////////////////////////////////////////////////////////////
///////////////////28f6+vN3u+u3////+//7/////////////////////////////////////
//////////////////////////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////////////////////
///////////////////////////////////////////////////7/v/7/v//////////////////
////////////////////////////////////////////////////////////////////////////
//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////
////////////////////////////////////////////////////////////////////////////
/v///v//////////////////////////////////////////////////////////////////////
//////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAD/////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////8AAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAD8AAAAAAAAf/wAAAAAAAB//AAAAAAAAH/8AAAA
AAAAf/wAAAAAAAB//AAAAAAAAH/8AAAAAAAAf/wAAAAAAAB//AAAAAAAAH/8AAAAAAAAf/wAAAAA
AAB//AAAAAAAAH/8AAAAAAAAf/wAAAAAAAB//AAAAAAAAH/8AAAAAAAAf/wAAAAAAAB//AAAAAAA
AH/8AAAAAAAAf/wAAAAAAAB//AAAAAAAAH/8AAAAAAAAf/wAAAAAAAB//AAAAAAAAH/8AAAAAAAA
f/wAAAAAAAB//AAAAAAAAH/8AAAAAAAAf/wAAAAAAAB//AAAAAAAAH/8AAAAAAAAf/wAAAAAAAB/
/AAAAAAAAH/8AAAAAAAAf/wAAAAAAAB//AAAAAAAAH/8AAAAAAAAf/wAAAAAAAB//AAAAAAAAH/8
AAAAAAAAf/wAAAAAAAB//AAAAAAAAH/8AAAAAAAAf/wAAAAAAAB//AAAAAAAAH/8AAAAAAAAf/wA
AAAAAAB//AAAAAAAAH/8AAAAAAAAf/wAAAAAAAB//AAAAAAAAH/8AAAAAAAAf/wAAAAAAAB//AAA
AAAAAH/8AAAAAAAAf/wAAAAAAAB//AAAAAAAAH/8AAAAAAAAf/wAAAAAAAB//AAAAAAAAH/8AAAA
AAAAf/wAAAAAAAB//AAAAAAAAH/8AAAAAAAAfygAAAAwAAAAYAAAAAEAIAAAAAAAACQAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
/////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP//////
///5////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAA
AAAAAP///wYAAAAA////gP/////////5////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////P/////////DAAAA
AP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////
gP/////////5////////////////////////////////////////////////////////////////
//////////////////7//////////////v7///7+////////////////////////////////////
/////////////////////////////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAA
AAAAAAAAAAAAAP///wYAAAAA////gP/////////5////////////////////////////////////
/////////////////////////////////////////////v/////////////////////+////////
///////////+/////P3+///+/////////////////////////////////////////////P//////
///DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5////////
//////////////////////////////////////////////////////////////7+/////f//+vb8
//z8/v//////7PT2//H6+////////////////////v7///////39///9/f//////////////////
/////////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYA
AAAA////gP/////////5////////////////////////////////////////////////////////
/////////v3////////m4/b/tK7n//j5/v//////wL/q/4mC5v/+/v///////////f/N1Ob/zs7z
///++v///////fz///7//////////////////////////////P/////////DAAAAAP///wQAAAAA
AAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5////////////////////////////
////////////////////////////////////+/v//////v94h+j/e4Ho////////////t6ft/xsY
3P/R1fD////////9///l8PP/V2np/2BM6//g4fj////+//39////////////////////////////
/P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5
///////////////////////////////////////////////////////////7+////////8PC9P8L
C+n/iovu/////v//////oaLr/wcK3P9uetz////7//n5/v//////x8r0/xIS6/8bJeH/prPs////
///8/P///////////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAA
AP///wYAAAAA////gP/////////5////////////////////////////////////////////////
/v7///r8////////2Nv5/zow8P8JCuD/mqPj//////////3/gIvm/xYN3v8iMeX/0t34///////6
+v/////7/0hT7f8fCOX/LCTc/7zB8P///////f3+/////////////////P/////////DAAAAAP//
/wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5////////////////////
//////////////////7+///7/P7//Pz////////W2fX/Mzfn/yQR5P8jIt//vr/q///////28/X/
Vlzb/yYY4f8WEuP/hozo/////f/5+v/////+/2F05v8VGOD/Nhfg/1pR4f/9+fr////////+////
/////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP//
///////5/////////////////////////////////P3+//79////////9/r8/6Cl6v8ZMN//JBre
/0Md4P81Nef/7Or2///////n6/n/LUPf/zMb4P8YFeH/TFbo//v6+//8+//////+/3Z95P8SFN//
MSDh/ygy3f/f4vX///////3+/v///////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAA
AAAAAAAAAP///wYAAAAA////gP/////////5//////////////////////39///9/f////////f8
+/+vvPH/UFjj/xQa3/8yGuH/Tine/xMH6/9zhO7////9///////Px/H/Fh7l/z0i4P8vF+X/Libs
/+rf9P/////////+/1t94/8JFN7/RyHh/xEp3v/D0/b///////39/v///////////P/////////D
AAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5////////////
/////Pz+///+///6/f3/q7Xv/z9L6P8QF+b/LBLh/0Ig4P9KJd//Lhvf/yIj5//i4ff/////////
//+amuj/Ag/h/0ck4f89H+D/Exjk/8fH8P/////////9/1Bk6v8WEeL/SiLg/xMn3v+/0vb/////
//39/v///////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA
////gP/////////5///////////9/f7///////Dp+f9ndO7/CQ/k/ywR5P8/IeD/RCPh/0Yk4P9C
IOL/BQjs/6Kn8P////7/+/z////+/P9hX+z/Fwrn/0kn3v8+It//Dg3r/7Cy8///////8u/3/zg4
6/8zFOX/Nh/f/xkw3//Z3Pb///////39/v///////////P/////////DAAAAAP///wQAAAAAAAAA
AAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5//////v7////////1tzz/z444/8OBuj/
QSPf/0Yk3/9EIuD/SiXf/zci3/8PCeL/gYXq/////v/7+////////+Pn9f8tK+T/OBfk/0Qj3/9E
I+D/Hgjr/6qi8///////w8bz/yMa5/9BIt//Mxrh/0E33v/n6Pb///////7+/v///////////P//
///////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5/f3/
///////i3/P/NTvf/yMU4P9JJuD/QiLf/0cl3/82IOH/HxDk/x8b3/+Knev//v/4//79///8/P//
/////6ih7v8WEuX/RCLf/0Ag4P9EJOD/Hwfs/6qi8///////ubX1/x4N7v9KJeD/JBXf/11i5f//
/P3//v///////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP//
/wYAAAAA////gP/////+/v75/////+/48P9JRd7/IxLh/0gm4P9EJN7/Ph7j/yIM5v8WEOv/WlTn
/8e78f////7//fz///79///8/f/////9/1td7P8nDOX/RiXf/0Eg4f89I9//BxDn/6+x8v//////
uLv0/x8R6/9JJN//KRTe/2J66P///////v3+/////////////////P/////////DAAAAAP///wQA
AAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////7/P/5/////3mN6/8XCub/TCbg/0ck
3/8rEuP/Ghfm/15q4f/Fwuf//PX7///////9/f///v////38/v////7/2M/s/ycg5f89HuD/QCHg
/0Uj4P8yHOL/HB/h/9PQ8v//////2tvz/ygi7P9AG+X/IRbd/1l46P///////v3/////////////
/////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP39////
///52tz1/x0n6P83GuL/Ribf/yAR4/9BOO7/xb/r//3/9P////7//f3///39/v////////////v7
//////3/gYvi/xoQ3/9HJOH/PyDg/0Yl3/8wEuT/ODjt/+3u+f/+/v/////9/2126f8XEOX/MBzd
/1lp5v///v7///7//////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAA
AAAAAP///wYAAAAA////gPv8//////75i4rt/w8L5P9IJuH/GBHe/2Ny5f/z9fv///////z7///7
+/////7//////////////v7////////p6fr/Pzzi/zQZ3/9FI+D/PyDg/0gk4P8fEd//b23l////
/P/8/P///////+3w+P86Nez/HALn/1xI3f/y6/b///////7+/v///////////P/////////DAAAA
AP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA/f3/gP/////39fn5RkTs/ysS5f8fG93/
h3nk///5+//+/////Pz//////////////////////////////f3///////+Nl+v/HBHd/0gj4f8+
IOD/QiHg/z8h4f8MGtv/sbTt///////7/P7//f3////////U0en/Kjvo/w4M6v/d0PP///////39
/v///////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP7+/wYAAAAA+vr/
gP/////P1fT5IiXm/wkQ4P+CeOT///37//v9///+/f/////////////////////////////+/v//
/////+fo+f8lN+L/Kxrg/0Yi4P89H+D/RyPg/ykW4P9CU97/9fjy///+///+/v7///////39////
//3/6u33/2Zk5v+WmeP///////39/////////////P/////////DAAAAAP///wQAAAAAAAAAAAAA
AAAAAAAAAAAAAP7+/wYAAAAA+vr/gP/////IyvT5CgPw/0dW5v/9/Pr//v7///39////////////
///////////////////////8/P///////4ya7f8NDOb/RiTg/z8f4P9AIOD/RSDh/yAa3/+yvfH/
//////z8/v/////////////////9/f////7///v+/P/j8e3///7+/////////////////P//////
///DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP79/wYAAAAA+vj/gP////+utvT5FxHt/9LK
8///////+/v+//////////////////////////////////7+///8/f/////7/0tH7f8kD+X/SCXe
/z4f4P9FJeD/HhLe/2Z22//+//z///7//////////////////////////////f7///7+////////
/////////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP39/wYA
AAAA+vr/gP////+fpvD5fnfn///////8/P////////////////////////////////////////38
////////2NP1/yIi5/83GuH/QiHg/0Yl3/8uFOT/Qz7m/+7s8P///////v7/////////////////
///////////////////////+/v7//////////////////////P/////////DAAAAAP///wQAAAAA
AAAAAAAAAAAAAAAAAAAAAP7+/wYAAAAA/v3/gP/////J1ev50s/q///////8/f7/////////////
//////////////////////////v7//////3/oarp/xML7P9GI9//QSHg/z4g4P8SE+j/vbz1////
///6+///////////////////////////////////////////////////////////////////////
/P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////5/vf5
/P/6//////////////////////////////////////////////////z9//////r/cnzj/xUN5P9G
I+D/RyTg/xsO5P9cZOj////7//v8////////////////////////////////////////////////
/////////////////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAA
AP///wYAAAAA////gP///////v/5//7/////////////////////////////////////////////
/v7///78//////v/XF/y/ygM5P9JJ97/Oh/g/x4b5v/MyfH///////39/v//////////////////
/////////////////////////////////////////////////////////P/////////DAAAAAP//
/wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5/v/+////////////////
/////////////////////////////v7////+///0+/r/QlHw/ygN5f9QKd//IhTf/1lm5P////7/
/v7/////////////////////////////////////////////////////////////////////////
/////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP//
///////5/////////////////////////////////////////////////v7////+///x+fr/OUzx
/yoN5f9KKOD/FRPe/6Ge6////////P3+////////////////////////////////////////////
/////////////////////////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAA
AAAAAAAAAP///wYAAAAA////gP/////////5////////////////////////////////////////
/////////v7////+///x+fr/OUzx/ywP5f9DIt//LSze/93c9////////f3/////////////////
/////////////////////////////////////////////////////////////////P/////////D
AAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5////////////
/////////////////////////////////////v7////9///4/Pr/TVbx/zEQ5v8xGeD/V07b//f1
8////////v7/////////////////////////////////////////////////////////////////
/////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA
////gP/////////5/////////////////////////////////////////////////v7///39////
//r/YWTu/yAR5P8kFt7/Ynnn/////v/8+////v//////////////////////////////////////
/////////////////////////////////////////////P/////////DAAAAAP///wQAAAAAAAAA
AAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5////////////////////////////////
//////////////////////v7//////7/lZbt/xYP5/8jFt7/fpDp///////7+///////////////
/////////////////////////////////////////////////////////////////////////P//
///////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5////
//////////////////////////////////////////////////v7////////tb30/yEU6/8tFdz/
nJ7p///////7+///////////////////////////////////////////////////////////////
/////////////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP//
/wYAAAAA////gP/////////5////////////////////////////////////////////////////
//39////////7+j2/zo36f8jCuH/vKHo///////8+///////////////////////////////////
/////////////////////////////////////////////////////P/////////DAAAAAP///wQA
AAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5////////////////////////
///////////////////////////////////8/P/////9/25v7v8AAeP/lqPo///////7/P//////
////////////////////////////////////////////////////////////////////////////
/////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP//////
///5///////////////////////////////////////////////////////////8/P///////7m4
8f8ABOP/ipTp///////7+///////////////////////////////////////////////////////
/////////////////////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAA
AAAAAP///wYAAAAA////gP/////////5////////////////////////////////////////////
///////////////+/v7///////jy9v8wLOX/ZGTx/////f/6+///////////////////////////
/////////////////////////////////////////////////////////////P/////////DAAAA
AP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5////////////////
/////////////////////////////////////////////////f3///////+ej+z/RTnh//Py+f//
/////v7/////////////////////////////////////////////////////////////////////
/////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////
gP/////////5////////////////////////////////////////////////////////////////
/v7////////z8vz/UWDh/8nP9////////f3/////////////////////////////////////////
/////////////////////////////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAA
AAAAAAAAAAAAAP///wYAAAAA////gP/////////5////////////////////////////////////
//////////////////////////////////z8////////rrXu/6ej6f///////v7+////////////
/////////////////////////////////////////////////////////////////////P//////
///DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5////////
//////////////////////////////////////////////////////////////7+////////+fX+
/8K+5P/w9/P///////7//v//////////////////////////////////////////////////////
/////////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYA
AAAA////gP/////////5////////////////////////////////////////////////////////
//////////////////////////7///3//v/8/v3/////////////////////////////////////
/////////////////////////////////////////////////P/////////DAAAAAP///wQAAAAA
AAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5////////////////////////////
/////////////////////////////////////////////////////v7/////////////////////
////////////////////////////////////////////////////////////////////////////
/P/////////DAAAAAP///wQAAAAAAAAAAAAAAAAAAAAAAAAAAP///wYAAAAA////gP/////////5
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////////////////////P/////////DAAAAAP///wQAAAAAAAAAAAAAAADwAAAAAB8A
APAAAAAAHwAA8AAAAAAfAADwAAAAAB8AAPAAAAAAHwAA8AAAAAAfAADwAAAAAB8AAPAAAAAAHwAA
8AAAAAAfAADwAAAAAB8AAPAAAAAAHwAA8AAAAAAfAADwAAAAAB8AAPAAAAAAHwAA8AAAAAAfAADw
AAAAAB8AAPAAAAAAHwAA8AAAAAAfAADwAAAAAB8AAPAAAAAAHwAA8AAAAAAfAADwAAAAAB8AAPAA
AAAAHwAA8AAAAAAfAADwAAAAAB8AAPAAAAAAHwAA8AAAAAAfAADwAAAAAB8AAPAAAAAAHwAA8AAA
AAAfAADwAAAAAB8AAPAAAAAAHwAA8AAAAAAfAADwAAAAAB8AAPAAAAAAHwAA8AAAAAAfAADwAAAA
AB8AAPAAAAAAHwAA8AAAAAAfAADwAAAAAB8AAPAAAAAAHwAA8AAAAAAfAADwAAAAAB8AAPAAAAAA
HwAA8AAAAAAfAADwAAAAAB8AAPAAAAAAHwAA8AAAAAAfAAAoAAAAIAAAAEAAAAABACAAAAAAAAAQ
AAAAAAAAAAAAAAAAAAAAAAAA////AQAAAAD///8O////8f/////////+////////////////////
////////////////////////////////////////////////////////////////////////////
///////////////6/////////38AAAAA////BQAAAAD///8BAAAAAP///w7////x//////////7/
////////////////////////////////////////////////////////////////////////////
//////////////////////////////////r/////////fwAAAAD///8FAAAAAP///wEAAAAA////
Dv////H//////////v///////////////////////////////////////////v7///7+////////
/v7/////////////////////////////////////////////////+v////////9/AAAAAP///wUA
AAAA////AQAAAAD///8O////8f/////////+////////////////////////////////////////
///+/v///////////////////v///////////////f3///7+///////////////////////6////
/////38AAAAA////BQAAAAD///8BAAAAAP///w7////x//////////7/////////////////////
//////////////////////Tw+f/28/z/+vz7/9re8////v///v7+//Ly+P/+/v////////7+////
//////////////r/////////fwAAAAD///8FAAAAAP///wEAAAAA////Dv////H//////////v//
//////////////////////////////z8////////i5Hp/93d+P///Pz/XFTg/93f9///////usft
/4F87v/t7vv///////7+////////////+v////////9/AAAAAP///wUAAAAA////AQAAAAD///8O
////8f/////////+//////////////////////7+///7+////////7Kx9v8kJ+X/7/D6//j5/P8j
Jt3/gozn//////////3/S0zt/ywt4//c4Pb///////39///////6/////////38AAAAA////BQAA
AAD///8BAAAAAP///w7////x//////////7///////////7+///8/P///f3///////+/xvX/JBnn
/0I/3/////v/1Nfx/yEd3f81OOb/7fD5//////+Woe//DQDf/2JW4v////3///////////r/////
////fwAAAAD///8FAAAAAP///wEAAAAA////Dv////H//////////v/////9/f///f3////////y
9Pv/iJHq/yYm3/8mC+H/eHvt//////+lrvD/Ihfe/yIX5P++vfX//////5mm6/8YE97/MC7g/9zj
9////////v7/+v////////9/AAAAAP///wUAAAAA////AQAAAAD///8O////8f/////////+/Pz/
///////t8fv/ipTw/zU35f8qFN7/Qx/g/yMb5v/O1Pn//////3F36v8oFOD/JxDj/5GS7v//////
g5jv/x4O4P8rLN//y9v4///////9/v/6/////////38AAAAA////BQAAAAD///8BAAAAAP///w7/
///x//////39//7/////0M72/zo/6f8fDOH/QR7g/0wn4P8ZCeP/jpXy///////4+Pv/REDp/zsb
4P8oEOH/e3ry/////f9nZe3/Kw3i/zEw3v/g5ff///////7+//r/////////fwAAAAD///8FAAAA
AP///wEAAAAA////Dv////H9/f///////sbJ8P8nIuD/Nhfh/00o3/8vFOL/IBXg/4eQ6/////z/
/////8jJ9v8nGeP/SSbf/ywM4/+AdPP////9/0w/7f8vEN//Tkjj//j4/P///////v7/+v//////
//9/AAAAAP///wUAAAAA////AQAAAAD+/v8O/v7/8f/////d5fT+Myvg/0Ad4P86GuD/JBbj/1dT
6P/Ev/P////+//r6//////7/g3/u/ygN4f9MKOD/HA7g/4OH7/////3/TUXt/y0K3/9SYeX//v//
///+///////6/////////38AAAAA////BQAAAAD///8BAAAAAPz8/g78/f/x/////2Zx7f4sEeL/
MBfg/09F6v/Fyu3////6///+///8/P7//////+/y9v88Nt//Oxrg/0gl3/8iEOP/rK7z//////+K
je//EwDi/1hc5P/9//7///////////r/////////fwAAAAD///8FAAAAAP///wEAAAAA6Ob6Dv//
//Hi4Pj/LSPm/iYR3f94euj/+fz+///////9/f///fz///z8////////oqXv/ykU3v9FJOH/PR7g
/y8p4P/i4fj///////f5+/9KRej/LB7i//Ps+P///////v7/+v////////9/AAAAAP///wUAAAAA
////AQAAAADGxfoO////8amr8/8EAeH+iYLn/////f/9/f///f3////////+/v////////L1/P84
QOP/ORnf/0gm4P8rEt//ZXLi/////v/8/P///////+zz9/9iZer/wb/u///////9/f/6////////
/38AAAAA////BQAAAAD+/f8BAAAAAL+4/w7////xgH/0/0BB6v7///v//f3///7+////////////
//z8////////o6nz/xwO4/9HJeD/Px3g/y8p3f/W3vf///////7+///+/v////////v9+//v9vb/
//////////r/////////fwAAAAD///8FAAAAAP39/wEAAAAA1836Dv////GGie7/xMD2/v/////9
/P///////////////////f3//////v9jX+3/LBHh/0on3/8nEeL/nKDp///////9/P//////////
///+/v///f7/////////////////+v////////9/AAAAAP///wUAAAAA/v7/AQAAAAD+9/0O////
8dng7v/4+Pz+//////////////////////7+////////7/L1/zMy5v9AHuH/LxTg/1VW6/////7/
/f3////////////////////////+/v///v7////////////6/////////38AAAAA////BQAAAAD/
//8BAAAAAP///w7////x//////7///7//////////////////////f3////////R1vf/Kx7m/0Yh
3/8lGuP/w8b0///////9/f////////////////////////////////////////////r/////////
fwAAAAD///8FAAAAAP///wEAAAAA/v7/Dv////H+/v///////v/////////////////////9/f//
/////7zJ+P8oGOn/Nxfe/1NW5P////7//v7/////////////////////////////////////////
////////+v////////9/AAAAAP///wUAAAAA////AQAAAAD///8O////8f/////////+////////
//////////////z9////////t8b4/ycY6P8vFNz/mpns///////8/P//////////////////////
///////////////////////////6/////////38AAAAA////BQAAAAD///8BAAAAAP///w7////x
//////////7//////////////////////f3////////Gzvj/Khnn/y8f3P/LzfD///////39/v//
//////////////////////////////////////////////r/////////fwAAAAD///8FAAAAAP//
/wEAAAAA////Dv////H//////////v/////////////////////+/v///////+jp+f8uJef/Ky3g
/+Hq+f///////v7/////////////////////////////////////////////////+v////////9/
AAAAAP///wUAAAAA////AQAAAAD///8O////8f/////////+////////////////////////////
///////+/01G6/9DLeD/9/T5///////+/v//////////////////////////////////////////
///////6/////////38AAAAA////BQAAAAD///8BAAAAAP///w7////x//////////7/////////
//////////////////z8////////iYjw/yom4v/29vj///////7+////////////////////////
//////////////////////////r/////////fwAAAAD///8FAAAAAP///wEAAAAA////Dv////H/
/////////v///////////////////////////f3////////Rz/b/Iivk/+bp+v///////v7/////
////////////////////////////////////////////+v////////9/AAAAAP///wUAAAAA////
AQAAAAD///8O////8f/////////+/////////////////////////////////v7//////v9mW+j/
u7j0///////9/f/////////////////////////////////////////////////6/////////38A
AAAA////BQAAAAD///8BAAAAAP///w7////x//////////7/////////////////////////////
///9/f///////8TI9P+Xnuv///////z9////////////////////////////////////////////
//////r/////////fwAAAAD///8FAAAAAP///wEAAAAA////Dv////H//////////v//////////
////////////////////////////////+/z//8fE7P/19/n/////////////////////////////
////////////////////////+v////////9/AAAAAP///wUAAAAA////AQAAAAD///8O////8f//
///////+/////////////////////////////////////////////v///P39//3+/v//////////
///////////////////////////////////////////6/////////38AAAAA////BQAAAAD///8B
AAAAAP///w7////x//////////7////////////////////////////////////////////////+
/v////////////////////////////////////////////////////////////r/////////fwAA
AAD///8FAAAAAOAAAA/gAAAP4AAAD+AAAA/gAAAP4AAAD+AAAA/gAAAP4AAAD+AAAA/gAAAP4AAA
D+AAAA/gAAAP4AAAD+AAAA/gAAAP4AAAD+AAAA/gAAAP4AAAD+AAAA/gAAAP4AAAD+AAAA/gAAAP
4AAAD+AAAA/gAAAP4AAAD+AAAA/gAAAPKAAAABAAAAAgAAAAAQAgAAAAAAAABAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAD///99//////////v////////////////+/v///v7///7+///9/f///v7/////
//3/////////QAAAAAAAAAAA////ff/////////7///////////9/f/////////////+/v//////
//7+///////9/////////0AAAAAAAAAAAP///33/////////+/39///+/v//9/f+/97f+P/R0PX/
6+36/9PU9v/x8f3//////f////////9AAAAAAAAAAAD///99//////39//v9/f///////5OS8f+d
nO//h4jp/6ao8f+4uvb/XVrn//////3+/v///v7/QAAAAAAAAAAA////ff39///////73uP7/3x1
6v8eDuD/2dr5/1xW5/9rYOv/1tv3/x4b3v/j5/r9//////n6/kAAAAAAAAAAAPv7/33/////srHy
+ysW4f8cAN3/mpbw//Dz/f8yHOL/a1rr/6mk9f81JuH/7/P7/f/////7+/5AAAAAAAAAAAD///99
1Nb4/x8J3ftgT+b/xsb1//////+rqPH/IwLd/3hv7P+2svb/Myni//r+/v3//////P3/QAAAAAAA
AAAA////fXJu7f96cur7///////+///5/f7/W0/l/yUF3P+hoe///////3x66//h3/j9//////r6
/kAAAAAAAAAAAPX3/X2ZmvL/+Pj9+/38////////v8D3/ycK4P9XR+P/8/j8///////5+v3/+fr9
/f/////+/v9AAAAAAAAAAAD5+/199fb7//7+//v7+////////42H7v8iCN//xMX3///////8/P//
/f3///////3/////////QAAAAAAAAAAA////ff7+///+/v/7/fz///////9uaO//Tz/j///////+
/v/////////////////9/////////0AAAAAAAAAAAP///33+////////+/z8////////dXDu/3dz
6f///////Pz//////////////////f////////9AAAAAAAAAAAD///99//////////v8/P//////
/6Si8/+MiO3///////z7//////////////////3/////////QAAAAAAAAAAA////ff/////////7
/v7////////h4Pr/kpLv///////9/f/////////////////9/////////0AAAAAAAAAAAP///33/
////////+//////+/////////9DQ9f/3+Pz//////////////////////f////////9AAAAAAAAA
AAD///99//////////v////////////////8/P7//f7+//////////////////////3/////////
QAAAAADAAwAAwAMAAMADAADAAwAAwAMAAMADAADAAwAAwAMAAMADAADAAwAAwAMAAMADAADAAwAA
wAMAAMADAADAAwAA')
	#endregion
	$formAstraAssist.Margin = '5, 5, 5, 5'
	$formAstraAssist.MaximizeBox = $False
	$formAstraAssist.Name = 'formAstraAssist'
	$formAstraAssist.Text = 'Astra Assist'
	$formAstraAssist.add_Load($formAstraAssist_Load)
	#
	# tabcontrol1
	#
	$tabcontrol1.Controls.Add($simpletab)
	$tabcontrol1.Controls.Add($customtab)
	$tabcontrol1.Controls.Add($roomcardtab)
	$tabcontrol1.Controls.Add($helptab)
	$tabcontrol1.Location = '8, 9'
	$tabcontrol1.Name = 'tabcontrol1'
	$tabcontrol1.SelectedIndex = 0
	$tabcontrol1.Size = '548, 282'
	$tabcontrol1.TabIndex = 21
	#
	# simpletab
	#
	$simpletab.Controls.Add($datetimepicker2)
	$simpletab.Controls.Add($roomname)
	$simpletab.Controls.Add($radiobuttonCurrentTime)
	$simpletab.Controls.Add($labelRoomName)
	$simpletab.Controls.Add($radiobuttonAlternateTime)
	$simpletab.Controls.Add($buttonCheckRoom)
	$simpletab.Controls.Add($classname)
	$simpletab.Controls.Add($labelCurrentNextEventName)
	$simpletab.Controls.Add($labelRoomAvailability)
	$simpletab.Controls.Add($labelCurrentEventEndsAt)
	$simpletab.Controls.Add($labelAlternateTime)
	$simpletab.Controls.Add($labelEventScheduledAfterC)
	$simpletab.Controls.Add($roomavailability)
	$simpletab.Controls.Add($classendtime)
	$simpletab.Controls.Add($classafter)
	$simpletab.Controls.Add($classaftertime)
	$simpletab.Controls.Add($labelNextEventStartsAt)
	$simpletab.Location = '4, 22'
	$simpletab.Name = 'simpletab'
	$simpletab.Padding = '2, 2, 2, 2'
	$simpletab.Size = '540, 256'
	$simpletab.TabIndex = 0
	$simpletab.Text = 'Simple Search'
	$simpletab.UseVisualStyleBackColor = $True
	#
	# datetimepicker2
	#
	$datetimepicker2.CalendarFont = 'Microsoft Sans Serif, 10pt'
	$datetimepicker2.CustomFormat = 'MM/dd/yyyy hh:mm tt'
	$datetimepicker2.Font = 'Microsoft Sans Serif, 10pt'
	$datetimepicker2.Format = 'Custom'
	$datetimepicker2.Location = '265, 96'
	$datetimepicker2.Name = 'datetimepicker2'
	$datetimepicker2.ShowUpDown = $True
	$datetimepicker2.Size = '147, 23'
	$datetimepicker2.TabIndex = 21
	#
	# roomname
	#
	$roomname.BackColor = 'Window'
	$roomname.Font = 'Microsoft Sans Serif, 12pt'
	$roomname.ForeColor = 'WindowText'
	$roomname.Location = '17, 49'
	$roomname.Name = 'roomname'
	$roomname.Size = '132, 26'
	$roomname.TabIndex = 0
	$roomname.TextAlign = 'Center'
	$tooltip1.SetToolTip($roomname, 'Enter the building code first, then the room number.
Ex. DSC 251 = David Straz Center Room 251
')
	$roomname.add_TextChanged($roomname_TextChanged)
	#
	# radiobuttonCurrentTime
	#
	$radiobuttonCurrentTime.Checked = $True
	$radiobuttonCurrentTime.Font = 'Microsoft Sans Serif, 10pt'
	$radiobuttonCurrentTime.Location = '302, 34'
	$radiobuttonCurrentTime.Name = 'radiobuttonCurrentTime'
	$radiobuttonCurrentTime.Size = '110, 24'
	$radiobuttonCurrentTime.TabIndex = 20
	$radiobuttonCurrentTime.TabStop = $True
	$radiobuttonCurrentTime.Text = 'Current Time'
	$radiobuttonCurrentTime.UseVisualStyleBackColor = $True
	$radiobuttonCurrentTime.add_CheckedChanged($radiobuttonCurrentTime_CheckedChanged)
	#
	# labelRoomName
	#
	$labelRoomName.AutoSize = $True
	$labelRoomName.Font = 'Microsoft Sans Serif, 14pt'
	$labelRoomName.Location = '31, 15'
	$labelRoomName.Name = 'labelRoomName'
	$labelRoomName.Size = '117, 24'
	$labelRoomName.TabIndex = 2
	$labelRoomName.Text = 'Room Name'
	#
	# radiobuttonAlternateTime
	#
	$radiobuttonAlternateTime.Font = 'Microsoft Sans Serif, 10pt'
	$radiobuttonAlternateTime.Location = '421, 34'
	$radiobuttonAlternateTime.Name = 'radiobuttonAlternateTime'
	$radiobuttonAlternateTime.Size = '125, 24'
	$radiobuttonAlternateTime.TabIndex = 19
	$radiobuttonAlternateTime.Text = 'Alternate Time'
	$radiobuttonAlternateTime.UseVisualStyleBackColor = $True
	#
	# buttonCheckRoom
	#
	$buttonCheckRoom.Enabled = $False
	$buttonCheckRoom.Font = 'Microsoft Sans Serif, 12pt'
	$buttonCheckRoom.Location = '154, 44'
	$buttonCheckRoom.Name = 'buttonCheckRoom'
	$buttonCheckRoom.Size = '107, 32'
	$buttonCheckRoom.TabIndex = 1
	$buttonCheckRoom.Text = 'Check Room'
	$buttonCheckRoom.UseVisualStyleBackColor = $True
	$buttonCheckRoom.add_Click($buttonCheckRoom_Click)
	#
	# classname
	#
	$classname.Location = '253, 234'
	$classname.Name = 'classname'
	$classname.ReadOnly = $True
	$classname.Size = '283, 20'
	$classname.TabIndex = 17
	#
	# labelCurrentNextEventName
	#
	$labelCurrentNextEventName.AutoSize = $True
	$labelCurrentNextEventName.Font = 'Microsoft Sans Serif, 12pt'
	$labelCurrentNextEventName.Location = '14, 231'
	$labelCurrentNextEventName.Name = 'labelCurrentNextEventName'
	$labelCurrentNextEventName.Size = '193, 20'
	$labelCurrentNextEventName.TabIndex = 18
	$labelCurrentNextEventName.Text = 'Current/Next Event Name:'
	#
	# labelRoomAvailability
	#
	$labelRoomAvailability.AutoSize = $True
	$labelRoomAvailability.Font = 'Microsoft Sans Serif, 12pt'
	$labelRoomAvailability.Location = '14, 122'
	$labelRoomAvailability.Name = 'labelRoomAvailability'
	$labelRoomAvailability.Size = '132, 20'
	$labelRoomAvailability.TabIndex = 3
	$labelRoomAvailability.Text = 'Room Availability:'
	#
	# labelCurrentEventEndsAt
	#
	$labelCurrentEventEndsAt.AutoSize = $True
	$labelCurrentEventEndsAt.Font = 'Microsoft Sans Serif, 12pt'
	$labelCurrentEventEndsAt.Location = '14, 152'
	$labelCurrentEventEndsAt.Name = 'labelCurrentEventEndsAt'
	$labelCurrentEventEndsAt.Size = '170, 20'
	$labelCurrentEventEndsAt.TabIndex = 5
	$labelCurrentEventEndsAt.Text = 'Current Event Ends at:'
	#
	# labelAlternateTime
	#
	$labelAlternateTime.AutoSize = $True
	$labelAlternateTime.Font = 'Microsoft Sans Serif, 14pt'
	$labelAlternateTime.Location = '349, 6'
	$labelAlternateTime.Name = 'labelAlternateTime'
	$labelAlternateTime.Size = '132, 24'
	$labelAlternateTime.TabIndex = 11
	$labelAlternateTime.Text = 'Alternate Time'
	#
	# labelEventScheduledAfterC
	#
	$labelEventScheduledAfterC.AutoSize = $True
	$labelEventScheduledAfterC.Font = 'Microsoft Sans Serif, 12pt'
	$labelEventScheduledAfterC.Location = '14, 177'
	$labelEventScheduledAfterC.Name = 'labelEventScheduledAfterC'
	$labelEventScheduledAfterC.Size = '230, 20'
	$labelEventScheduledAfterC.TabIndex = 4
	$labelEventScheduledAfterC.Text = 'Event Scheduled After Current:'
	#
	# roomavailability
	#
	$roomavailability.Location = '253, 125'
	$roomavailability.Name = 'roomavailability'
	$roomavailability.ReadOnly = $True
	$roomavailability.Size = '283, 20'
	$roomavailability.TabIndex = 7
	#
	# classendtime
	#
	$classendtime.Location = '253, 152'
	$classendtime.Name = 'classendtime'
	$classendtime.ReadOnly = $True
	$classendtime.Size = '283, 20'
	$classendtime.TabIndex = 8
	#
	# classafter
	#
	$classafter.Location = '253, 179'
	$classafter.Name = 'classafter'
	$classafter.ReadOnly = $True
	$classafter.Size = '283, 20'
	$classafter.TabIndex = 9
	#
	# classaftertime
	#
	$classaftertime.Location = '253, 207'
	$classaftertime.Name = 'classaftertime'
	$classaftertime.ReadOnly = $True
	$classaftertime.Size = '283, 20'
	$classaftertime.TabIndex = 10
	#
	# labelNextEventStartsAt
	#
	$labelNextEventStartsAt.AutoSize = $True
	$labelNextEventStartsAt.Font = 'Microsoft Sans Serif, 12pt'
	$labelNextEventStartsAt.Location = '14, 204'
	$labelNextEventStartsAt.Name = 'labelNextEventStartsAt'
	$labelNextEventStartsAt.Size = '155, 20'
	$labelNextEventStartsAt.TabIndex = 6
	$labelNextEventStartsAt.Text = 'Next Event Starts at:'
	#
	# customtab
	#
	$customtab.Controls.Add($labelResults)
	$customtab.Controls.Add($buttonCheck)
	$customtab.Controls.Add($customresults)
	$customtab.Controls.Add($roomdetails)
	$customtab.Controls.Add($labelRoomDetails)
	$customtab.Controls.Add($roombox)
	$customtab.Controls.Add($datetimepicker1)
	$customtab.Controls.Add($labelRoom)
	$customtab.Controls.Add($labelBuilding)
	$customtab.Controls.Add($buildingbox)
	$customtab.Location = '4, 22'
	$customtab.Name = 'customtab'
	$customtab.Padding = '2, 2, 2, 2'
	$customtab.Size = '540, 256'
	$customtab.TabIndex = 1
	$customtab.Text = 'Custom Search'
	$customtab.UseVisualStyleBackColor = $True
	#
	# labelResults
	#
	$labelResults.AutoSize = $True
	$labelResults.Font = 'Microsoft Sans Serif, 10pt'
	$labelResults.Location = '264, 68'
	$labelResults.Name = 'labelResults'
	$labelResults.Size = '59, 17'
	$labelResults.TabIndex = 9
	$labelResults.Text = 'Results:'
	#
	# buttonCheck
	#
	$buttonCheck.Font = 'Microsoft Sans Serif, 12pt'
	$buttonCheck.Location = '460, 51'
	$buttonCheck.Name = 'buttonCheck'
	$buttonCheck.Size = '75, 26'
	$buttonCheck.TabIndex = 8
	$buttonCheck.Text = 'Check'
	$buttonCheck.UseVisualStyleBackColor = $True
	$buttonCheck.add_Click($buttonCheck_Click)
	#
	# customresults
	#
	$customresults.Location = '264, 87'
	$customresults.Margin = '2, 2, 2, 2'
	$customresults.Multiline = $True
	$customresults.Name = 'customresults'
	$customresults.ReadOnly = $True
	$customresults.ScrollBars = 'Vertical'
	$customresults.Size = '271, 131'
	$customresults.TabIndex = 7
	#
	# roomdetails
	#
	$roomdetails.Location = '9, 142'
	$roomdetails.Margin = '2, 2, 2, 2'
	$roomdetails.Multiline = $True
	$roomdetails.Name = 'roomdetails'
	$roomdetails.ReadOnly = $True
	$roomdetails.Size = '224, 76'
	$roomdetails.TabIndex = 6
	#
	# labelRoomDetails
	#
	$labelRoomDetails.AutoSize = $True
	$labelRoomDetails.Font = 'Microsoft Sans Serif, 14pt'
	$labelRoomDetails.Location = '61, 118'
	$labelRoomDetails.Name = 'labelRoomDetails'
	$labelRoomDetails.Size = '121, 24'
	$labelRoomDetails.TabIndex = 5
	$labelRoomDetails.Text = 'Room Details'
	#
	# roombox
	#
	$roombox.DropDownStyle = 'DropDownList'
	$roombox.FormattingEnabled = $True
	$roombox.Location = '9, 87'
	$roombox.Name = 'roombox'
	$roombox.Size = '224, 21'
	$roombox.TabIndex = 4
	$roombox.add_TextChanged($roombox_TextChanged)
	#
	# datetimepicker1
	#
	$datetimepicker1.CalendarFont = 'Microsoft Sans Serif, 10pt'
	$datetimepicker1.CustomFormat = 'MM/dd/yyyy hh:mm tt'
	$datetimepicker1.Font = 'Microsoft Sans Serif, 10pt'
	$datetimepicker1.Format = 'Custom'
	$datetimepicker1.Location = '264, 22'
	$datetimepicker1.Name = 'datetimepicker1'
	$datetimepicker1.Size = '271, 23'
	$datetimepicker1.TabIndex = 3
	#
	# labelRoom
	#
	$labelRoom.AutoSize = $True
	$labelRoom.Font = 'Microsoft Sans Serif, 14pt'
	$labelRoom.Location = '82, 63'
	$labelRoom.Name = 'labelRoom'
	$labelRoom.Size = '61, 24'
	$labelRoom.TabIndex = 2
	$labelRoom.Text = 'Room'
	#
	# labelBuilding
	#
	$labelBuilding.AutoSize = $True
	$labelBuilding.Font = 'Microsoft Sans Serif, 14pt'
	$labelBuilding.Location = '77, 10'
	$labelBuilding.Name = 'labelBuilding'
	$labelBuilding.Size = '78, 24'
	$labelBuilding.TabIndex = 1
	$labelBuilding.Text = 'Building'
	#
	# buildingbox
	#
	$buildingbox.DropDownStyle = 'DropDownList'
	$buildingbox.FormattingEnabled = $True
	$buildingbox.Location = '9, 34'
	$buildingbox.Name = 'buildingbox'
	$buildingbox.Size = '224, 21'
	$buildingbox.TabIndex = 0
	$buildingbox.add_TextChanged($buildingbox_TextChanged)
	#
	# roomcardtab
	#
	$roomcardtab.Controls.Add($label2)
	$roomcardtab.Controls.Add($label1)
	$roomcardtab.Controls.Add($roomselectionbox2)
	$roomcardtab.Controls.Add($buildingselectionbox2)
	$roomcardtab.Location = '4, 22'
	$roomcardtab.Name = 'roomcardtab'
	$roomcardtab.Size = '540, 256'
	$roomcardtab.TabIndex = 2
	$roomcardtab.Text = 'Room Cards'
	$roomcardtab.UseVisualStyleBackColor = $True
	#
	# label2
	#
	$label2.AutoSize = $True
	$label2.Font = 'Microsoft Sans Serif, 14pt'
	$label2.Location = '90, 68'
	$label2.Name = 'label2'
	$label2.Size = '66, 24'
	$label2.TabIndex = 3
	$label2.Text = 'Room:'
	#
	# label1
	#
	$label1.AutoSize = $True
	$label1.Font = 'Microsoft Sans Serif, 14pt'
	$label1.Location = '90, 8'
	$label1.Name = 'label1'
	$label1.Size = '83, 24'
	$label1.TabIndex = 2
	$label1.Text = 'Building:'
	#
	# roomselectionbox2
	#
	$roomselectionbox2.DropDownStyle = 'DropDownList'
	$roomselectionbox2.FormattingEnabled = $True
	$roomselectionbox2.Location = '21, 95'
	$roomselectionbox2.Name = 'roomselectionbox2'
	$roomselectionbox2.Size = '221, 21'
	$roomselectionbox2.TabIndex = 1
	#
	# buildingselectionbox2
	#
	$buildingselectionbox2.DropDownStyle = 'DropDownList'
	$buildingselectionbox2.FormattingEnabled = $True
	$buildingselectionbox2.Location = '21, 35'
	$buildingselectionbox2.Name = 'buildingselectionbox2'
	$buildingselectionbox2.Size = '221, 21'
	$buildingselectionbox2.TabIndex = 0
	$buildingselectionbox2.add_TextChanged($buildingselectionbox2_TextChanged)
	#
	# helptab
	#
	$helptab.Location = '4, 22'
	$helptab.Name = 'helptab'
	$helptab.Size = '540, 256'
	$helptab.TabIndex = 3
	$helptab.Text = 'Help'
	$helptab.UseVisualStyleBackColor = $True
	#
	# tooltip1
	#
	$tooltip1.AutoPopDelay = 5000
	$tooltip1.InitialDelay = 200
	$tooltip1.IsBalloon = $True
	$tooltip1.ReshowDelay = 100
	$roomcardtab.ResumeLayout()
	$customtab.ResumeLayout()
	$simpletab.ResumeLayout()
	$tabcontrol1.ResumeLayout()
	$formAstraAssist.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $formAstraAssist.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$formAstraAssist.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$formAstraAssist.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $formAstraAssist.ShowDialog()

} #End Function

#Call the form
Show-MainForm_psf | Out-Null
