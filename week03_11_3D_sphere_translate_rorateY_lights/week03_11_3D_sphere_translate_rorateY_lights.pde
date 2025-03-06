//week03_11_3D_sphere_translate_rorateY_lights
void setup(){
  size(400,400,P3D);  
}
void draw(){
  background(128);
  translate(mouseX, mouseY);
  rotateY(radians(frameCount));
  sphere(200);
}
