import processing.opengl.*;

float _x = 0.001, _y = 0.001, _z = 0.001;
float a = 0.2, b = 0.2, c = 5.7;

void setup(){
  size(1600, 1200, OPENGL);
  background(0);
  stroke(124, 155, 255, 255);
  blendMode(ADD);
  camera(width*0.8, height*0.7, height,
         0.0, 1.0, 0.0,
         0.0, 0.0, -1.0);
}

void draw(){
  float x, y, z, t = 0.001;
  for(int i = 0; i < 100; i++){
     x = _x + (-_y -_z)*t;
     y = _y + (_x + a * _y)*t;
     z = _z + (b + _x * _z - c * _z)*t;
     
     point(x*20 + width/2, y*20 + height/2, z*20 + height/2);
     
     _x = x;
     _y = y;
     _z = z;
     
     //t += 0.00001;
  }
  
  if(mousePressed){
    String path = "./screenshot.png";
    save(path);
    println(path);
  }
}