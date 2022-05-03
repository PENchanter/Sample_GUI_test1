#NoEnv
#SingleInstance, Force
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2
; #NoTrayIcon

vChoice1 := "server1"
vChoice2 := "server2"
vChoice3 := "server3"

Gui, SelectGameMode:New ; <-- <solution provided by> 0xB0BAFE77
Gui, SelectGameMode:Default ; <-- <solution provided by> 0xB0BAFE77
Gui, +AlwaysOnTop
Gui, Font, s15 Bold q1 cBlack, Consolas ; [S]ize, [Q]uality [C]olor
Gui, Add, Text, x35 y15 w300 h30 , Select Game Mode
Gui, Font, s15 Normal q1 cBlack, Consolas ; [S]ize, [Q]uality [C]olor
Gui, Add, Radio, x48 y55 w145 h20 gAChoice vAChoice1, [&1] %vChoice1%
Gui, Add, Radio, x48 y80 w145 h20 gAChoice vAChoice2, [&2] %vChoice2%
Gui, Add, Radio, x48 y105 w145 h20 gAChoice vAChoice3, [&3] %vChoice3%
Gui, Font, s15 Bold q1 cBlack, Consolas ; [S]ize, [Q]uality [C]olor
Gui, Add, Button, x20 y150 w95 h25 gLaunchIt, &LAUNCH
Gui, Font, s15 Normal q1 cBlack, Consolas ; [S]ize, [Q]uality [C]olor
Gui, Add, Button, x135 y150 w90 h25 gCanceled, &Cancel
Gui, Font
GuiControl, +Default, &Cancel
GuiControl, Hide, &LAUNCH ; gLaunchIt
Gui, Show, x750 y250 h200 w255, Conan Exiles
Return

AChoice:
	Gui, Submit, nohide
	v_Choice := ""
	If (AChoice1){
		v_Choice := vChoice1
	}
	If (AChoice2){
		v_Choice := vChoice2
	}
	If (AChoice3){
		v_Choice := vChoice3
	}
;	MsgBox, % v_Choice
	GuiControl, Show, &LAUNCH ; gLaunchIt
Return

LaunchIt:
	Gui, Submit, nohide
	Gui, Destroy
	GOTO GoContinueOne
Return

GoContinueOne:
MsgBox, 4161, Conan Exiles, '%v_Choice%': Game Mode was chosen.
	IfMsgBox Ok, {
		GOTO GoContinueTwo
	} Else IfMsgBox Cancel, {
		ExitApp 
	}
ExitApp

GoContinueTwo:
	ExitApp

Canceled:
SelectGameModeGuiEscape: ; <-- <solution provided by> 0xB0BAFE77
SelectGameModeGuiClose: ; <-- <solution provided by> 0xB0BAFE77
GuiContextMenu:
	ExitApp
Return
*Esc::
	ExitApp
Return
