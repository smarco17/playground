#include "Arduino.h"
#include "LCD.h"
#include <Wire.h>

LCD::LCD(int addr){
  Wire.begin();
  lcd_addr = addr;
}

void LCD::TxCommand(byte command){
  Wire.beginTransmission(lcd_addr);
  Wire.write(0x00);
  Wire.write(command);
  Wire.endTransmission();
  delay(10);
}

void LCD::TxData(byte data){
  Wire.beginTransmission(lcd_addr);
  Wire.write(0x40);
  Wire.write(data);
  Wire.endTransmission();
  delay(1);
}

void LCD::Init(){
  int commands[] = {0x38, 0x39, 0x14, 0x7A, 0x54, 0x6C, 0x38, 0x0C, 0x01, 0x06};
  for(byte i=0; i<9; i++){
    TxCommand(commands[i]);
    delay(20);
  } 
}
