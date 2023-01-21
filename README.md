# Keyboard-Relay-Clicker
Trying to get keyboard presses to activate a relay as a physical clicker.

Goals
* Relay clicks fast enough to not have an audible delay between key presses
* All keys activate relay
* Holding down a key doesnt spam the relay
* Ideally a way to open relay on key down and close relay on key up
* Doesnt have to be reliant on powershell/windows




ProtoType v0.10
First attempt at a keyboard clicker using AHK, powershell and a LCUS-1 USB Relay Module
Requires LCUS-1 USB relay and ahk 1.1.
Downsides
* There is a slight delay and may lagg behind if you type too fast.
* Holding down a key spams relay on and off
* Not all keys currently activate relay.
  * This includes multi press buttons...
