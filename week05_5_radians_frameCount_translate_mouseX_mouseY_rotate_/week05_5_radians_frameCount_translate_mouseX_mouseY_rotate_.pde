//week05-5_radians_frameCount_translate_mouseX_mouseY_rotate_
//比較rotate與translate的順序
void setup(){
  size(400,400);
}
void draw(){
  background(204);
  //請座以下測試: 把下面2行，調一下順序
  //會發現: 兩行順序對調，一個公轉、一個自轉
  //在電腦圖學理，畫圖時，會照之前(累積的移動、旋轉)來放東西
  rotate(radians(frameCount));//1秒有60個frame，轉60度，要變radians單位
  translate(mouseX,mouseY);//移到mouse所在位子
  rect(-50,-5,100,10);//寬度100的棒子，但在左上角
}
