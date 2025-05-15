//week13-2_camra_movie_eye_center_up
//電腦圖學在繪圖時，會設定camra的相關係數
import processing.video.*;//要使用影片外掛
Movie movie;//要放影片的變數
void setup(){
  size(720,480,P3D);//要記得加上P3D才能有OpenGL 3D功能
  movie = new Movie(this, "street.mov");
  movie.loop();//回圈播放  影片解析度720x480
}
void draw(){
  background(128);
  camera(mouseX,mouseY,500,360,240,0,0,1,0);
  if(movie.available()) movie.read();//有新畫面，就讀入
  image(movie,0,0);//放影片，放在0, 0
}
