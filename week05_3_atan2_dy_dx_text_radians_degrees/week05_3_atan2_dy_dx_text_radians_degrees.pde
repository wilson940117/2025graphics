//week05-3_atan2_dy_dx_text_radians_degrees
//degress vs. radians 結合 week04-1和week05-2
void setup(){
  size(400,400);
}
void draw(){
  background(120);
  line(200,200,400,200);
  line(200,200,mouseX,mouseY);
  float dx = mouseX-200, dy = mouseY-200;
  float a = atan2(dy ,dx);//神奇的三角函數， 可找到arc弧的radians
  //atan2()出來的值，介於-PI...+PI中間
  arc(200,200,200,200,0,a,PIE);//把算出來的arc radians 拿出來
  textSize(30);
  text("radians"+a,100,100);//radians弧度/弳度
  text("degrees"+degrees(a),100,130);//drgees 度
}
