# Keyboard-Relay-Clicker
Trying to get keyboard presses to activate a relay as a physical clicker.
Work-In-Progress

## Three Versions
Currently have two versions of this script.
* Ahk + LCUS-1 USB Relay with powershell (Windows + Linux?)
* Arduino with Relay board + AHK and SerialSend.exe (Windows) (Recommended)
* AHK + LCUS-1 + SerialSend (Windows) (Reccommended)


### Goals
* Relay clicks fast enough to not have an audible delay between key presses
* All keys activate relay
* Holding down a key doesnt spam the relay
* Ideally a way to open relay on key down and close relay on key up
* Doesnt have to be reliant on powershell/windows
  * https://github.com/andrewintw/usb-powered-relay ?

### Arduino Version
Requires:
* Arduino Uno (Or any Arduino (including clones) that plugs into PC)
* 3 Pin Relay Board (pos, neg, data)
* AHK
* SerialSend (Windows only?)

Pros
* A Lot faster than LCUS-1 USB. Maybe due to higher baudrate?
* Customisable delay in Arduino code

Cons
* Not as compact as LCUS-1 Relay. (if using Uno)
* Probably overkill for what it is.

### LCUS-1 USB Relay (SerialSend)
Requires:
* Arduino Uno (Or any Arduino (including clones) that plugs into PC)
* 3 Pin Relay Board (pos, neg, data)
* AHK
* SerialSend (Windows only?)

Pros
* As fast or almost as fast as Arduino
* More compact and easier to setup
* Cheap, only a couple of dollars

Cons
* Not as much configuration options


### LCUS-1 USB Relay (PowerShell)
Requires:
* LCUS-1 USB relay
* AHK 1.1
* USBCH341 Windows Driver USB (Also availble for other OS's)
* PowerShell (Maybe Linux using .sh?)

Pros
* Compact, plugs in anywhere
* Cheap, only a couple of dollars

Cons
* Pretty bad Serial Communication delay. Might be due to low baudrate, which for some reason cannot be changed. (This may actually be from powershell)
