//week12-5-gundam-head-body-push-trt-pop-again
//修改自week12-4

PShape body,head;
PShape uparm1,upuparm1,hand1;
PShape uparm2,upuparm2,hand2;
void setup(){
  size(400,400,P3D); 
  body = loadShape("body.obj");
  head = loadShape("head.obj");
  uparm1 = loadShape("uparm1.obj");//week09-5
  upuparm1 = loadShape("upuparm1.obj");//week09-5
  hand1 = loadShape("hand1.obj");//week09-5
  uparm2 = loadShape("uparm2.obj");
  upuparm2 = loadShape("upuparm2.obj");
  hand2 = loadShape("hand2.obj");
}
float [] angleX = new float[10];
float [] angleY = new float[10];
int ID = 0;//0:頭 1:上上手臂 2:上手臂 3:手
void mouseDragged(){
  angleX[ID] += radians(mouseX - pmouseX);//左右拖曳
  angleY[ID] += radians(mouseY - pmouseY);//上下拖曳
}
void keyPressed(){
  if(key=='1') ID = 1; //上上手臂還沒好
  if(key=='2') ID = 2; //ok上手臂
  if(key=='3') ID = 3; //ok手
  if(key=='4') ID = 4; 
  if(key=='5') ID = 5;
  if(key=='6') ID = 6; 
  if(key=='7') ID = 7; 
  if(key=='8') ID = 8; 
  if(key=='9') ID = 9; 
  if(key=='0') ID = 0;//ok頭
}
void draw(){
  translate(200,300);
  background(204);
  sphere(10);//原點的球
  
  scale(10,-10,10);
  
  shape(body,0,0);
  pushMatrix();
    translate(0,22.5);
    rotateY(angleX[0]);//x方向 左右拖曳 是對Y軸轉
    rotateX(angleY[0]);//y方向 上下拖曳 是對X軸轉
    translate(0,-22.5);
    shape(head,0,0); 
  popMatrix();
  
  pushMatrix();
    translate(-2.9,20.8);
    rotateY(angleX[1]);
    rotateX(angleY[1]);
    translate(2.9,-20.8);
    shape(upuparm1,0,0); //上上手臂
    pushMatrix();
      translate(-4.1,19.9);//再掛回去原本的位置
      rotateZ(angleY[2]);
      rotateY(angleX[2]);
      translate(4.1,-19.9);//把物體旋轉中心 放到座標中心
      shape(uparm1,0,0);//上手臂
      pushMatrix();
        translate(-4.5,16.9);
        rotateX(angleY[3]);
        rotateY(angleX[3]);
        translate(4.5,-16.9);//剛剛把手移到座標中心的移動量
        shape(hand1,0,0);
      popMatrix();
    popMatrix();
  popMatrix();
  
  pushMatrix();
    translate(2.9,20.8);
    rotateY(angleX[4]);
    rotateX(angleY[4]);
    translate(-2.9,-20.8);
    shape(upuparm2,0,0); //上上手臂
    pushMatrix();
      translate(4.1,19.9);//再掛回去原本的位置
      rotateZ(angleY[5]);
      rotateY(angleX[5]);
      translate(-4.1,-19.9);//把物體旋轉中心 放到座標中心
      shape(uparm2,0,0);//上手臂
      pushMatrix();
        translate(4.5,16.9);
        rotateX(angleY[6]);
        rotateY(angleX[6]);
        translate(-4.5,-16.9);//剛剛把手移到座標中心的移動量
        shape(hand2,0,0);
      popMatrix();
    popMatrix();
  popMatrix();
}

//week12-6-sound
//要有聲音 需要聲音的Library函式庫
//Sketch-Library-Managed Libraries找sound
import processing.sound.*;//抄範例
SoundFile mySound;
void setup(){
  size(400,400);
  mySound = new SoundFile(this, "music.mp3");
  mySound.play();
}
void draw(){
  
}

//week12-7-sound-intro-ingame-sword
import processing.sound.*;
SoundFile sndInGame,sndIntro,sndMonkey,sndSword;
void setup(){
  size(400,400);
  sndInGame = new SoundFile(this, "In Game Music.mp3");
  sndIntro = new SoundFile(this, "Intro Song_Final.mp3");
  sndMonkey = new SoundFile(this, "Monkey 1.mp3");
  sndSword = new SoundFile(this, "sword slash.mp3");
  sndIntro.play();
}
boolean playingIntro = true;
void keyPressed(){
  if(playingIntro){
    sndIntro.stop();
    sndInGame.play();
    playingIntro = false;
  }
  else{
    sndInGame.stop();
    sndIntro.play();
    playingIntro = true;
  }
}
void mousePressed(){
  if(mouseButton==LEFT) sndSword.play();
  if(mouseButton==RIGHT) sndMonkey.play();
}
void draw(){
  
}
