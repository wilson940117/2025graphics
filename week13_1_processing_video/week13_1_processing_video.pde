//week13-1_processing_video
import processing.video.*;
Capture video;
Movie movie;
void setup(){
  size(640,960);
  video = new Capture(this, 640,480);
  video.start();
  movie = new Movie(this, "street.mov");
  movie.loop();
}
void draw(){
  if(video.available()) video.read();
  image(video,0,480);
  if(movie.available()) movie.read();
  image(movie,0,0);
}
