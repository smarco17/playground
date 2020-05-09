// default
float _a = 0.9, _b = -0.6013, _c = 2.0, _d = 0.5;
float x, x_pre = -0.5;
float y, y_pre = 0.0;
float noise = 0.0;

void setup(){
  size(1600, 1200, OPENGL);
  blendMode(ADD);
  background(0);
  stroke(124, 155, 255, 255);
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), 
  width/2.0, height/2.0, 0,
  0, 1, 0);
}

void draw(){
  // frameRate(100000);
  float noise_x = 20 * noise(noise);
  float noise_y = 20 * noise(noise);
  
  x = x_pre * x_pre - y_pre * y_pre + _a * x_pre + _b * y_pre;
  y = 2 * x_pre * y_pre + _c * x_pre + _d * y_pre;
  // print(x);
  point(x * 500 + width * 0.7, y * 500 + height * 0.7);
  // point(x * 500 + width * 0.7+ noise_x, y * 500 + height * 0.7 + noise_y);
    
  x_pre = x;
  y_pre = y;
  
  noise++;
  
  if(mousePressed){
    String path = "./tinkerbell.png";
    save(path);
  }
  
}