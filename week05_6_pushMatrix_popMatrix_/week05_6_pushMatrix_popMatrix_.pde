//week05-6_pushMatrix_popMatrix_
//因為有很多的移動、旋轉，大腦會當掉，所以用(分階層)做事
void setup(){
  size(400,400);
}
void draw(){
  background(200);
  pushMatrix();
  translate(width/2,height/2);//(把下面這坨)移到畫面中心
  rotate(radians(frameCount)*10);
  rect(-50,-5,100,10);//好的
  popMatrix();
  
  pushMatrix();
   translate(width/2-100,height/2);//(把下面這坨)移到畫面中心
  rotate(radians(frameCount)*10);
  rect(-50,-5,100,10);
  popMatrix();
}
