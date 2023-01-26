//Arduino Relay Clicker v1.0
// Example 1 - Receiving single characters by Robin2 (https://forum.arduino.cc/t/serial-input-basics-updated/382007)

//Variables
String receivedString;
boolean newData = false;

const int RELAY_PIN = 3;  //Pin used for relay digital trigger


void setup() {
    Serial.begin(115200); //set high baudrate
    Serial.setTimeout(2); //Milliseconds. Overides Serial Communication
    pinMode(RELAY_PIN, OUTPUT); //set type of pin
}

void loop() {
    recvOneChar();
    showNewData();
}

void recvOneChar() {
    if (Serial.available() > 0) {
        receivedString = Serial.readString(); //Stores String sent from ahk into variable
        newData = true;
    }
}

void showNewData() {
    if (newData == true) {
      digitalWrite(RELAY_PIN, HIGH); //trigger relay on
      delay(10); //You can adjust this delay to suit your needs. 
      digitalWrite(RELAY_PIN, LOW); //trigger relay off
      //delay(50); //optional delay. Found it works better when off
        newData = false;
    }
}
