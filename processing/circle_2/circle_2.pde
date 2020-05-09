void setup(){
  size(1200, 900);
  background(255);
  strokeWeight(5);
  smooth();
  noiseCircle();
  
}

void noiseCircle(){
  float radius = 300;
  int centX = width/2;
  int centY = height/2;
  
  stroke(30);
  noFill();
  ellipse(centX, centY, radius*2, radius*2);
  
  stroke(20, 50, 70);
  strokeWeight(1);
  
  float x, y;
  float noiseVal = random(10);
  float radVariance, thisRadius, rad;
  beginShape();
  for(float ang = 0; ang <= 360; ang += 1){
     noiseVal += 0.1;
     radVariance = 100 * customNoise(noiseVal);
     
     thisRadius = radius + radVariance;
     rad = radians(ang);
     x = centX + (thisRadius * cos(rad));
     y = centY + (thisRadius * sin(rad));
     
     curveVertex(x, y);
  }
  endShape();
}

float customNoise(float value){
  float retValue = pow(sin(value), 3);
  return retValue;
}