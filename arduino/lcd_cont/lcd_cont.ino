#include "LCD.h"

LCD lcd(0x3E);

void setup() {
  lcd.Init();
}

void loop() {
  String disp = "Hello,World.";
  lcd.TxCommand(0x80);
  for(byte i=0; i <disp.length(); i++){
    lcd.TxData(disp.charAt(i));
  }
}
