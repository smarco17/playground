void setup(){
  size(500, 100);
  background(255);
  strokeWeight(5);
  smooth();
  stroke(20, 50, 70);
  line(20, height/2, width-20, height/2);
  
  //randomLine();
  noiseLine();
}

void draw(){
  
}

void randomLine(){
  int step = 10;
  float lastX = -999;
  float lastY = -999;
  float y = 50;
  int borderX = 20;
  int borderY = 10;
  
  for(int x=borderX; x<=width-borderX; x+=step){
     y = borderY + random(height - 2*borderY);
     if(lastX > -999){
       line(x, y, lastX, lastY); 
     }
     lastX = x;
     lastY = y;
  }
}

void noiseLine(){
  int step = 10;
  float lastX = -999;
  float lastY = -999;
  float yNoise = random(10);
  float y;
  
  for(int x = 20; x <= 480; x += step){
    y = 10 + noise(yNoise) * 80;
    if(lastX > -999){
      line(x, y, lastX, lastY); 
    }
    lastX = x;
    lastY = y;
    yNoise += 0.05;
  }
}