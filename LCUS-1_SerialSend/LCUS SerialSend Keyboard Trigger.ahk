;Keyboard Relay Clicker v0.11 (LCUS-1 SerialSend)
;OPTIMIZATIONS START
; source https://www.autohotkey.com/boards/viewtopic.php?t=6413
; some of these optimisations are not required...
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
DllCall("ntdll\ZwSetTimerResolution","Int",5000,"Int",1,"Int*",MyCurrentTimerResolution) ;setting the Windows Timer Resolution to 0.5ms, THIS IS A GLOBAL CHANGE
;OPTIMIZATIONS END

	
;code from Rohwedder (https://www.autohotkey.com/boards/viewtopic.php?style=17&f=76&t=77075) 	
Gui, +HwndGui
Gui, Add, Edit, vMyEdit
Gui, Show
Format := "SC{:X}"
Loop, 0x1FF
	Gosub, TestEndkey
Format := "VK{:X}"
Loop, 0xFF
	Gosub, TestEndKey
Gui, Destroy
Loop
{
	ih := InputHook("L1 M V", EndKeys)
	ih.Start(), ih.Wait()
	;Runs software SerialSend to communicate with Arduino over com port 3 with baudrate of 115200.
	;relay on
	run,SerialSend /devnum 9 /baudrate 9600 /hex "\xA0\x01\x01\xA2",,Hide
	;delay
	sleep, 10
	;relay off
	run,SerialSend /devnum 9 /baudrate 9600 /hex "\xA0\x01\x00\xA1",,Hide
}
Return
TestEndKey:
IF ("" = Key := GetKeyName(Format(Format, A_Index)))
	Or InStr(Key, "Button") Or InStr(Key, "Wheel")
	Return
ControlSend, Edit1,% Key := "{" Key "}", ahk_id %Gui%
Gui, Submit
IF (MyEdit = "") And !Instr(EndKeys, Key)
	EndKeys .= Key
ControlSend, Edit1, {Bs}, ahk_id %Gui%
Return
