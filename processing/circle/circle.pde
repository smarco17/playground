void setup(){
  size(1200, 900);
  background(255);
  strokeWeight(1);
  smooth();
  
  stroke(0, 30);
  noFill();
  justCircle();
  
  noiseSpiral();
  
}

void draw(){
  
}

void justCircle(){
  float radius = 200;
  int centX = width/2;
  int centY = height/2;
  ellipse(centX, centY, radius*2, radius*2);
}

void dotCircle(){
  float radius = 200;
  float x, y;
  int centX = width/2;
  int centY = height/2;
  
  for(float angle = 0; angle <= 360; angle += 3){
     float rad = radians(angle);
     x = centX + (radius * cos(rad));
     y = centY + (radius * sin(rad));
     point(x, y);
  }
}

void spiral(){
  float radius = 50;
  float x, y;
  int centX = width/2;
  int centY = height/2;
  float lastX = -999;
  float lastY = -999;
  
  for(float angle = 0; angle <= 1440; angle += 3){
    radius += 0.5;
    float rad = radians(angle);
    x = centX + (radius * cos(rad));
    y = centY + (radius * sin(rad));
    if(lastX > -999){
      line(x, y, lastX, lastY);
    }
    lastX = x;
    lastY = y;
  }
}

void noiseSpiral(){
  float x, y;
  int centX = width/2;
  int centY = height/2;
  
  for(int i = 0; i < 100; i++){
    float lastX = -999;
    float lastY = -999;
    float radiusNoise = random(10);
    float radius = 10;
    stroke(random(20), random(50), random(70), 80);
    int startAngle = int(random(360));
    int endAngle = 1440 + int(random(1440));
    int angleStep = 5 + int(random(3));
    
    for(float angle = startAngle; angle <= endAngle; angle += angleStep){
      radiusNoise += 0.05;
      radius += 0.5;
      float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
      float rad = radians(angle);
      x = centX + (thisRadius * cos(rad));
      y = centY + (thisRadius * sin(rad));
      if(lastX > -999){
        line(x, y, lastX, lastY);
      }
      lastX = x;
      lastY = y;
    }
  }
}