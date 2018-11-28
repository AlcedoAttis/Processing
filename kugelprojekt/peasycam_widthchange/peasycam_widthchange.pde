import peasy.*;

PeasyCam cam;

void setup() {
  size(200,200,P3D);
  cam = new PeasyCam(this, 0,0,0,100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  surface.setResizable(true);
}
void draw() {
  background(0); stroke(255); strokeWeight(10);
  point(0,0);
  pushMatrix();
  translate(width/2,height/2);
  point(0,0);
  popMatrix();
}