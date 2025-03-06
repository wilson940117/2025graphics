//week03_1_translate_rotateY_radiansbox
void setup(){
  size(400,400,P3D);
}
void draw(){
  background(128);
  translate(mouseX,mouseY);
  rotateY(radians(frameCount));
  box(200);
}
