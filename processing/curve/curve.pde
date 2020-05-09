void setup(){
  size(800, 500);
  background(255);
  strokeWeight(5);
  smooth();
  stroke(20, 50, 70);
  line(20, height/2, width-20, height/2);
  sineCurve();
}

void draw(){
  
}

void sineCurve(){
  float xStep = 1;
  float amp = 30;
  float lastX = -999;
  float lastY = -999;
  float angle = 0;
  float y = 50;
  
  for(int x = 20; x <= width - 20; x += xStep){
     float rad = radians(angle);
     //y = height/2 + (sin(rad) * amp);
     //y = height/2 + (pow(sin(rad), 3) * amp);
     //y = height/2 + (pow(sin(rad), 3) * noise(rad*2) * amp);
     y = height/2 + customRandom() * amp;
     if(lastX > -999){
       line(x, y, lastX, lastY);
     }
     
     lastX = x;
     lastY = y;
     angle++;
  }
}

float customRandom(){
  float retValue = 1 - pow(random(2), 2);
  return retValue;
}