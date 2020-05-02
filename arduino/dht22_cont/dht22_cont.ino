#include "DHT.h"

#define DHTTYPE DHT22
#define DHTPIN 7

DHT dht(DHTPIN, DHTTYPE);

void setup() {
  Serial.begin(9600); 
  dht.begin();
}

void loop() {
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  char temp[7];
  char humid[7];
  char disp[20];
  
  if (isnan(h) || isnan(t)) {
    Serial.println("something wrong.");
    return;
  }
  
  dtostrf(h, 3, 1, humid);
  dtostrf(t, 3, 1, temp);
  
  sprintf(disp, "Humid: %s [] Temp: %s [*C]", humid, temp);
  Serial.println(disp);
  delay(1000);
}
