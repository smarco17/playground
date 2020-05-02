#ifndef LCD_H
#define LCD_H

#include "Arduino.h"

class LCD {
  public:
    LCD(int addr);
    void Init();
    void TxCommand(byte command);
    void TxData(byte data);
  private:
    int lcd_addr;
};

#endif
