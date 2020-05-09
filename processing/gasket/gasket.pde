void setup(){
  size(1600,1400);
  fill(0);
  smooth();
  noLoop();
}

void draw(){
  gasket(0, 0, width, 10);
}

void gasket(float x, float y, float a, int num){
  triangle(x, y, x + a, y, x + a / 2, y + sqrt(3) * a / 2);
  num -= 1;
  if(num > 0){
    fill(random(0, 80));
    gasket(x, y, a / 2, num);
    fill(random(81, 160));
    gasket(x + a / 2, y, a /2, num);
    fill(random(161, 240));
    gasket(x + a / 4, y + sqrt(3) * a /4, a / 2, num);
  }
}