import peasy.*;
PeasyCam cam;
sandbox b;

int size = 200; //>=2
float probability = 0.0;

void setup() {
  //frameRate(1000);
  //size(800,600,P3D);
  fullScreen(P3D);
  cam = new PeasyCam(this, 350);
  //cam.setMinimumDistance(50);
  cam.setMaximumDistance(5000);

  b = new sandbox(size, probability);
}

void draw() {
  for(int i=0; i<64; i++){
      b.update();
  }
  rotateZ(3*HALF_PI);
  rotateY(0.5);
  //rotateZ(0.1);
  background(50);
  lights();
  System.out.println(frameRate);
  b.draw();
  saveFrame("Frms/line-######.png");
}