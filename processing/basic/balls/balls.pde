int num = 200;
Ball[] balls = new Ball[num];

void setup(){
  size(1200, 900);
  smooth();
  noStroke();
  frameRate(30);
  for(int i = 0; i < num; i++){
    balls[i] = new Ball(random(4, 15), random(0, width), random(0, height), color(random(0, 255)), random(-3, 3), random(-3, 3));
  }
}

void draw(){
  background(128);
  for(int i = 0; i < num; i++){
    balls[i].update();
  }
}

class Ball{
  float radius, posX, posY, speedX, speedY;
  color clr;
  
  Ball(float r, float x, float y, color c, float sx, float sy){
    radius = r;
    posX = x;
    posY = y;
    clr = c;
    speedX = sx;
    speedY = sy;
  }
  
  void update(){
  posX += speedX;
  posY += speedY;
  
  // 床に当たったとき
  if(posY + radius > height){
    speedY = -speedY;
    posY = height - radius;
  }
  // 天井に当たったとき
  if(posY - radius < 0){
    speedY = -speedY;
    posY = radius;
  }
  // 右の壁に当たったとき
  if(posX + radius > width){
    speedX = -speedX;
    posX = width - radius;
  }
  // 左の壁にに当たったとき
  if(posX - radius < 0){
    speedX = -speedX;
    posX = radius;
  }
  fill(clr);
  ellipse(posX, posY, radius*2, radius*2);
  }
}