#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

#SingleInstance, force
;-----------------------------------------------------------------
global sourceAddr := "C:\Users\" . A_UserName . "\AppData\LocalLow\Nolla_Games_Noita\save00"
global destAddr := ".\slot"
global progName := "NoitaSL"

#IfWinExist, ahk_exe noita.exe
+F1::
Alert()
return
F1::
Alert()
return

+F2::
Alert()
return
F2::
Alert()
return

+F3::
Alert()
return
F3::
Alert()
return

+F4::
Alert()
return
F4::
Alert()
return

+F5::
Alert()
return
F5::
Alert()
return

+F6::
Alert()
return
F6::
Alert()
return

+F7::
Alert()
return
F7::
Alert()
return

+F8::
Alert()
return
F8::
Alert()
return

;-----------------------------------------------------------------
#IfWinNotExist, ahk_exe noita.exe
+F1::
SaveState(1)
return
F1::
LoadState(1)
return

+F2::
SaveState(2)
return
F2::
LoadState(2)
return

+F3::
SaveState(3)
return
F3::
LoadState(3)
return

+F4::
SaveState(4)
return
F4::
LoadState(4)
return

+F5::
SaveState(5)
return
F5::
LoadState(5)
return

+F6::
SaveState(6)
return
F6::
LoadState(6)
return

+F7::
SaveState(7)
return
F7::
LoadState(7)
return

+F8::
SaveState(8)
return
F8::
LoadState(8)
return

;-----------------------------------------------------------------
SaveState(slotNum) {
	destAddr := ".\slot"
	destAddr := destAddr . slotNum

	FileRemoveDir, destAddr, 1
	FileCopyDir, %sourceAddr%, %destAddr%
	MsgBox, 0x1000, %progName%, Saved State to Slot %slotNum%, 1
}

LoadState(slotNum) {
	destAddr := ".\slot"
	destAddr := destAddr . slotNum
	if !FileExist(destAddr) {
		MsgBox, 0x1000, %progName%, Slot %slotNum% is empty
		return
	}

	FileRemoveDir, %sourceAddr%, 1
	FileCopyDir, %destAddr%, %sourceAddr%
	MsgBox, 0x1000, %progName%, Loaded State from Slot %slotNum%, 1
}

Alert() {
	MsgBox, 0x1030, %progName%, I recommand that you SAVE & QUIT Noita, otherwise there may be some problems
}