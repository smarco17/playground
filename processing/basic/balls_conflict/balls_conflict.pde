int numBalls;
Ball balls[] = new Ball[1000];
float spring = 100;
float reduction = 0.99;
float gravity = 0.1;

void setup(){
  size(1600, 900);
  smooth();
  noStroke();
  frameRate(60);
}

void draw(){
  background(0);
  for(int i = 0; i < numBalls; i++){
    balls[i].display();
    balls[i].move();
    balls[i].bound();
    balls[i].collide();
  }
}

class Ball{
  float posX, posY;
  float radius, mass;
  float speedX, speedY;
  color clr;
  int idno;
  Ball[] others;
  
  Ball(float x, float y, float r, float sx, float sy, int id, color c, Ball[] o){
    posX = x;
    posY = y;
    radius = r;
    speedX = sx;
    speedY = sy;
    clr = c;
    idno = id;
    mass = radius * radius;
    others = o;
  }
  
  void move(){
    speedX *= reduction;
    speedY *= reduction;
    posX += speedX;
    posY += speedY;
    speedY += gravity;
  }
  
  void bound(){
    if(posX + radius >= width){
      speedX = -speedX;
      posX = width - radius;
    }
    if(posX - radius <= 0){
      speedX = -speedX;
      posX = radius;
    }
    if(posY + radius >= height){
      speedY = -speedY;
      posY = height - radius;
    }
    if(posY - radius <= 0){
      speedY = -speedY;
      posY = radius;
    }
  }
  
  void collide(){
    for(int i = idno + 1; i < numBalls; i++){
      float dx = others[i].posX - posX;
      float dy = others[i].posY - posY;
      float distance = sqrt(dx*dx + dy*dy);
      float critical = others[i].radius + radius;
      if(distance < critical){
        float force = spring * (critical - distance);
        float theta = atan2(dy, dx);
        float ax = -force * cos(theta) / mass;
        float ay = -force * sin(theta) / mass;
        speedX += ax;
        speedY += ay;
        ax = force * cos(theta) / others[i].mass;
        ay = force * sin(theta) / others[i].mass;
        others[i].speedX += ax;
        others[i].speedY += ay;
      }
    }
  }
  
  void display(){
    fill(clr);
    ellipse(posX, posY, radius*2, radius*2);
  }
  
}

void mousePressed(){
  float x = mouseX;
  float y = mouseY;
  float d = random(10, 20);
  float sx = random(-10, 10);
  float sy = random(-10, 10);
  color c = color(random(128, 255), random(64, 128));
  balls[numBalls] = new Ball(x, y, d, sx, sy, numBalls, c, balls);
  numBalls += 1;
}