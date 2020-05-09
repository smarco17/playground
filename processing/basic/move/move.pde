void setup(){
  size(1200, 900);
  smooth();
}

void draw(){
  pushMatrix();
  for(int i = 0; i < 10; i++){
    rect(0, 0, width / 10, height / 10);
    translate(width / 10, height / 10);
    scale(2);
  }
  popMatrix();
  for(int i = 0; i < 10; i++){
    rect(width / 2, height / 2, width / 10, height / 10);
    rotate(PI / 10);
  }
}