//week03_05_mouse_cat_x_y
void setup(){
  size(400,400);
}
float x , y;
void draw(){
  background(255);
  ellipse(x,y,40,40);
  ellipse(mouseX,mouseY,40,20);
  x = (x*4 + mouseX) /5;
  y = (y*4 + mouseY) /5;
}//新的座標，舊的目標*14，目標*1
