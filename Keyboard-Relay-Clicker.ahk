;Keyboard Relay Clicker v0.10
psScript = 
	(
		# delcare poweron and off commands
		[Byte[]] $powerOn  = 0xA0, 0x01, 0x01, 0xA2
		[Byte[]] $powerOff = 0xA0, 0x01, 0x00, 0xA1
		# set serial port. Change port here to match port in computer management windows
		$relay = new-Object System.IO.Ports.SerialPort COM7,9600,None,8,one
		
		# open communication
		$relay.Open()
		# power relay on
		$relay.Write($powerOn, 0, $powerOn.Count)
		# delay
		Start-Sleep -Milliseconds 10
		
		# power relay off
		$relay.Write($powerOff, 0, $powerOff.Count)
		# close communication
		$relay.Close()
	)
Loop, 
{ 
; keyboard presses
  Input, Var, L1 V
    ; SoundBeep	
	;run above script
	run,powershell -NoProfile -Command &{%psScript% },, HIDE
}
