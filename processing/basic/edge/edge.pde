int count = 0;

void setup(){
  size(1200, 900);
  background(255);
  // noSmooth();
  smooth();
  ellipse(200, 300, 300, 200);
  ellipse(600, 300, 300, 200);
  rect(100, 600, 300, 200);
  rect(500, 600, 300, 200);
  frameRate(1);
}

void draw(){
  background(255);
  
  switch(count % 4){
    case 0:
      strokeWeight(1);
      ellipse(200, 300, 300, 200);
      ellipse(600, 300, 300, 200);
      strokeJoin(ROUND);
      rect(100, 600, 300, 200);
      rect(500, 600, 300, 200);
      break;
    case 1:
      strokeWeight(2);
      ellipse(200, 300, 300, 200);
      ellipse(600, 300, 300, 200);
      stroke(BEVEL);
      rect(100, 600, 300, 200);
      rect(500, 600, 300, 200);
      break;
    case 2:
      strokeWeight(3);
      ellipse(200, 300, 300, 200);
      ellipse(600, 300, 300, 200);
      strokeJoin(ROUND);
      rect(100, 600, 300, 200);
      rect(500, 600, 300, 200);
      break;
    case 3:
      strokeWeight(4);
      ellipse(200, 300, 300, 200);
      ellipse(600, 300, 300, 200);
      strokeJoin(BEVEL);
      rect(100, 600, 300, 200);
      rect(500, 600, 300, 200);
      break;
    default:
      break;
  }
  
  count++;
  
}