float x = 0.1, y = 0.1;
 
//static final float a =  0.45, b = 1.9;
//static final float a =  1.0, b = 0.85;
//static final float a =  1.0, b = 0.9;
static final float a =  1.25, b = 0.75;
 
void setup() {
  size(1600, 1200);
  blendMode(ADD);
  background(0);
  stroke(124, 155, 255, 50);
}
 
void draw() {
  float _x, _y;
 
  for (int i = 0; i < 100; i++) {
 
    _x = (1 + a * b) * x - b * x * y;
    _y = (1 - b) * y + b * x * x;
 
    point(_x * 150 + width*0.5, - _y * 150 + height*0.75);
 
    x = _x;
    y = _y;
  }
  
  if(mousePressed){
    String path = "./rolentz.png";
    save(path);
  }
}