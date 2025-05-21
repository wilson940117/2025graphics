//week13-6
//把今天教的加進來
//圖檔影片檔拉進來
import processing.video.*;//要使用影片外掛
Movie movie;//要放影片變數
PImage img;
void setup() {
  size(400, 400, P3D); 
  img = loadImage("chessboard.png");
  movie = new Movie(this, "street.mov");
  movie.loop();
  textureMode(NORMAL);
  video = new Capture(this,640,480);
  video.start();
}
Capture video;
void draw() {
  camera(200,200,200,200+cos(radians(frameCount)),200,200+sin(radians(frameCount)),0,1,0);
  background(128);
  if (movie.available()) movie.read();//有新畫面 就讀入
  beginShape();//front 正前方
  texture(img);
    vertex(0,0,0,0,0);
    vertex(400,0,0,1,0);
    vertex(400,400,1,1);
    vertex(0,400,0,0,1);
  endShape();
  translate(0,0,1);
  image(movie,0,0,360,240);
  if (video.available()) video.read();//有新畫面 就讀入
  beginShape();//left左方
    texture(video);
    vertex(0,0,0,0,0);//x y z u v
    vertex(0,400,0,1,0);
    vertex(0,400,400,1,1);
    vertex(0,0,400,0,1);
  endShape();
  beginShape();
    texture(video);
}
