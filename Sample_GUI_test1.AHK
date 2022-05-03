#NoEnv
#SingleInstance, Force
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2
; #NoTrayIcon

vChoice1 := "server1"
vChoice2 := "server2"
vChoice3 := "server3"

;	note, the size, x/y, width and height have all been tested and found to be: OK
; Gui, New, +HwndhGui
Gui, SelectGameMode:New
Gui, SelectGameMode:+AlwaysOnTop
Gui, SelectGameMode:Font, s15 Bold q1 cBlack, Consolas
Gui, SelectGameMode:Add, Text, x35 y15 w300 h30, Select Game Mode
Gui, SelectGameMode:Font, s15 Normal q1 cBlack, Consolas
Gui, SelectGameMode:Add, Radio, x49 y60 w140 h16 gAChoice vAChoice1, [&1] %vChoice1%
Gui, SelectGameMode:Add, Radio, x49 y85 w140 h16 gAChoice vAChoice2, [&2] %vChoice2%
Gui, SelectGameMode:Add, Radio, x49 y110 w140 	h16 gAChoice vAChoice3, [&3] %vChoice3%
Gui, SelectGameMode:Font, s15 Bold q1 cBlack, Consolas
Gui, SelectGameMode:Add, Button, x20  y150 w95 h25 gLaunchIt, &LAUNCH
Gui, SelectGameMode:Font, s15 Normal q1 cBlack, Consolas
Gui, SelectGameMode:Add, Button, 	x135 y150 w90 h25 gCanceled, &Cancel
Gui, SelectGameMode:Font
	GuiControl, SelectGameMode:+Default, &Cancel
	GuiControl, SelectGameMode:Hide, &LAUNCH
Gui, SelectGameMode:Show, x750 y250 h200 w255, Conan Exiles
Return

AChoice:
	Gui, SelectGameMode:Submit, nohide
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
	GuiControl, SelectGameMode:Show, &LAUNCH
Return

LaunchIt:
	Gui, SelectGameMode:Submit, nohide
	Gui, SelectGameMode:Destroy
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

ButtonExit:
Canceled:
GuiEscape:
GuiClose:
GuiContextMenu:
	ExitApp
Return
*Esc::
    ExitApp
Return
