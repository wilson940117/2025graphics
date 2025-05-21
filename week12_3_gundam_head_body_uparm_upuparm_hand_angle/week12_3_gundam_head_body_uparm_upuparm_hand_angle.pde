//week12-3-gundam-head-body-uparm-upuparm-hand-angle
//修改自week12-2

PShape body,head;
PShape uparm1,upuparm1,hand1;//week09-5
void setup(){
  size(400,400,P3D); 
  body = loadShape("body.obj");
  head = loadShape("head.obj");
  uparm1 = loadShape("uparm1.obj");//week09-5
  upuparm1 = loadShape("upuparm1.obj");//week09-5
  hand1 = loadShape("hand1.obj");//week09-5
}
float [] angleX = new float[10];
float [] angleY = new float[10];
int ID = 0;//0:頭 1:上上手臂 2:上手臂 3:手
void mouseDragged(){
  angleX[ID] += radians(mouseX - pmouseX);//左右拖曳
  angleY[ID] += radians(mouseY - pmouseY);//上下拖曳
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
}
