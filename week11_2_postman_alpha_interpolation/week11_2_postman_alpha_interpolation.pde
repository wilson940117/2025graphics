//week11-2-postman-alpha-interpolation

PImage postman, head,body,uparm1,hand1,uparm2,hand2;
float [] angle = new float[20];//prepare 20 關節的變數
int ID = 0;//現 在要處理的關節
void mouseDragged(){
  angle[ID] += mouseX-pmouseX;
}
void keyPressed(){
  if(key=='1') ID = 1;//leftarm
  if(key=='2') ID = 2;//lefthand
  if(key=='3') ID = 3;//rightarm
  if(key=='4') ID = 4;//righthand
  if(key=='5') ID = 5;
  if(key=='6') ID = 6;
  if(key=='0') ID = 0;//head
  
  if(key=='s'){//begin here每按一次 就存一組
    String now = "";//要放現在全部關節的值
    for(int i=0;i<20;i++){
      now+=angle[i]+" ";//全部塞到now 裡
    }
    lines.add(now);//這行加到line 裡
    String [] arr = new String[lines.size()];
    lines.toArray(arr);
    saveStrings("angles.txt",arr);
  }
  if(key=='r'){//讀入
    if(R==0){//如果目前沒檔案
            String [] file = loadStrings("angles.txt");
            if (file != null){//如果有讀到檔案
              for(int i=0;i<file.length;i++){//就檔案內容逐行
                lines.add(file[i]);//加到lines資料結構裡
              }
            }
        }
      if(R<lines.size()){
          float[]now = float(split(lines.get(R),' '));
          for(int i=0;i<20;i++) angle[i] = now[i];
          R=(R+1)%lines.size();
      }
  }
}
int R=0;
ArrayList<String> lines = new ArrayList<String>();//put the result of move
void setup(){
  size(560,560);
  postman = loadImage("postman.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
  uparm1 = loadImage("uparm1.png");
  hand1 = loadImage("hand1.png");
  uparm2 = loadImage("uparm2.png");
  hand2 = loadImage("hand2.png");
  
}
void draw(){
  background(#FFFFF2);
  image(postman,0,0);//基礎郵差
  fill(255,0,255,128);//半透明紫色
  rect(0,0,560,560);//蓋上去
  pushMatrix();
    translate(+197,+262);//放回正確位置
    rotate(radians(angle[1]));
    translate(-197,-262);//arm的旋轉中心放到(0,0)
    image(uparm1,0,0);
    pushMatrix();
      translate(+119,+265);//放回正確位置
      rotate(radians(angle[2]));
      translate(-119,-265);//arm的旋轉中心放到(0,0)
      image(hand1,0,0);
    popMatrix();
  popMatrix();
   pushMatrix();
    translate(+289,+260);//放回正確位置
    rotate(radians(angle[3]));
    translate(-289,-260);//arm的旋轉中心放到(0,0)
    image(uparm2,0,0);
    pushMatrix();
      translate(+355,+258);//放回正確位置
      rotate(radians(angle[4]));
      translate(-355,-258);//arm的旋轉中心放到(0,0)
      image(hand2,0,0);
    popMatrix();
  popMatrix();
  pushMatrix();
    translate(+233,+230);//放回正確位置
    rotate(radians(angle[0]));
    translate(-233,-230);//頭的旋轉中心放到(0,0)
    image(head,0,0);//在畫頭
  popMatrix();
  image(body,0,0);//在畫身體
}
