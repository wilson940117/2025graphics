//week13-5-camera-keyPressed-keyCode-x-y-z-angle-cos-sin
//修改自week13-4
PImage img;
void setup(){
  size(400,400,P3D); 
  img = loadImage("chessboard.png");//要拉入圖檔
  textureMode(NORMAL); 
}
float x=200,y=200,z=200,angle=180;
void keyPressed(){
  if(keyCode==LEFT) angle--;
  if(keyCode==RIGHT) angle++;
  if(keyCode==UP){
     x+=cos(radians(angle));
     z+=sin(radians(angle));//是Z不是Y
  }
  if(keyCode==DOWN){
     x-=cos(radians(angle));
     z-=sin(radians(angle));
  }
}
void draw(){//攝影機往前方看 左右前後移動
  if(keyPressed) keyPressed();//補強 按鍵按下去不斷更新
  //camera(mouseX,200,mouseY,mouseX,200,mouseY-10,0,1,0);
  camera(x,y,z,x+cos(radians(angle)),y,z+sin(radians(angle)),0,1,0);
  background(128);
  beginShape();//front 正前方
  texture(img);
    vertex(0,0,0,0,0);
    vertex(400,0,0,1,0);
    vertex(400,400,1,1);
    vertex(0,400,0,0,1);
  endShape();
  beginShape();//left左方
    texture(img);
    vertex(0,0,0,0,0);//x y z u v
    vertex(0,400,0,1,0);
    vertex(0,400,400,1,1);
    vertex(0,0,400,0,1);
  endShape();
}
