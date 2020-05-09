void setup(){
  size(1200, 900);
  background(255);
  strokeWeight(5);
  smooth();
  
  stroke(0, 255);
  line(20, height/2, width-20, height/2);
  sineCurve();
  
}

void draw(){
  
}

void sineCurve(){
  int spaceX = 20;
  int curveA = 200;
  float xStep = 1;
  float lastX = -999;
  float lastY = -999;
  float angle = 0;
  float y = 50;
  
  for(int x = spaceX; x <= width - spaceX; x += xStep){
    float rad = radians(angle);
    y = height/2 + (sin(rad)*curveA);
    if(lastX > -999){
      line(x, y, lastX, lastY); 
    }
    lastX = x;
    lastY = y;
    angle++;
  }
}