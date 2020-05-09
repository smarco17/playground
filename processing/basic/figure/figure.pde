void setup(){
  // ディスプレイのサイズ
  size(800, 600);
  // background(0, 0, 0) or background(0)
  background(255);
  color c1 = color(210, 100, 50, 50);
  color c2 = color(230, 54, 99, 80);
  color c3 = color(230, 240, 250, 255);
  color c4 = color(150, 23, 65, 120);
  color c5 = color(70, 230, 110, 140);
  color c6 = color(180, 120, 200, 160);
  color c7 = color(120, 80, 10, 180);
  
  // 図形の枠線を書かない
  noStroke();
  // 図形を塗りつぶす色を指定
  fill(c1);
  // rect(x, y, lengthX, lengthY)
  rect(100, 100, 600, 400);
  
  fill(c2);
  // triangle(x1, y1, x2 ,y2, x3, y3)
  triangle(200, 200, 300, 300, 200, 500);
  
  stroke(c3);
  fill(c3);
  // point(x, y)
  point(500, 500);
  
  stroke(c4);
  fill(c4);
  // line(x1, y1, x2, y2)
  line(500, 200, 400, 400);
  
  stroke(c5);
  fill(c5);
  // ellipse(x, y, radiusA, radiusB)
  ellipse(500, 300, 100, 200);
  
  stroke(c6);
  fill(c6);
  // arc(x, y, radiusA, radiusB, angle_initial, angle_end)
  arc(400, 300, 100, 100, PI/4, 7*PI/4);
  
  stroke(c7);
  fill(c7);
  // quad(x1, y1, x2, y2, x3, y3, x4, y4)
  quad(100, 200, 400, 200, 300, 400, 200, 400);
  
  
  
}

void draw(){
}