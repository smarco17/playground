//static final float a = -1.0, b = 0.05, c = 2.275,  d = -0.5;
//static final float a =  1.0, b = 0.0,  c = - 2.25, d = 0.2;
//static final float a =  1.0, b = 0.0,  c = - 1.9,  d = 0.4;
//static final float a = -1.0, b = 0.1,  c = 1.52,   d = -0.8;
static final float _a = -1.0, _b = 0.1,  _c = 1.6, _d = -0.8;
//static final float _a =  2.0,  _b = -0.2, _c = - 1.75, _d = 1.0;
//static final float _a = -2.0, _b = 0.0, _c = 2.6, _d = -0.5;
float x_pre = 0.01, y_pre = 0.01;

void setup(){
 size(1600, 1200);
 blendMode(ADD);
 background(0);
 stroke(124, 155, 255, 50);
}

void draw(){
  float A; 
  float x, y;
  
  for(int i=0; i<100; i++){
    A =  _a * (x_pre*x_pre + y_pre*y_pre) + _b * x_pre *(x_pre*x_pre - 3*y_pre*y_pre) + _c;
    x = A * x_pre + _d * (x_pre*x_pre - y_pre*y_pre);
    y = A * y_pre - 2 * _d * x_pre * y_pre;
    
    // print(x);
    point(x*300 + width/2, y*300 + height/2);
    
    x_pre = x;
    y_pre = y;
  }
  
  if(mousePressed){
    String path = "./choca_and_golvitzy.png";
    save(path);
  }
  
}