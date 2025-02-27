//week02-3_void_setup_void_draw_stroke_if_mousePressed
void setup(){//一開始，設定1次(貼上week02-2的程式)
  size(400,400);
  background(255);
  fill(238);
  noStroke();
  int s = 400/14;//計算每個格子的大小
  for(int i=0; i<14; i++){//左手i對應y座標
    for(int j=0;j<14;j++){//右手j對應x座標
    //rect(0, i*s*2, s, s);
    if((i+j)%2==0)  rect(i*s, j*s, s, s);
    }
  }
}
void draw(){//每秒畫60次
  stroke(255,0,0);//紅色的線
  if(mousePressed) line(mouseX,mouseY,pmouseX,pmouseY);
}//如果mouse按下去，就畫線，給兩個座標: 現在mouse 和 之前的mouse
