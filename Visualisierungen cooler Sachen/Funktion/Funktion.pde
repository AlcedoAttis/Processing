
int c = 50;

float groesse = 200;

final int lX = -c,
          lY = -c,
          lZ = -c,
          rX = c,
          rY = c,
          rZ = c;
          
float /*RENDER_*/SIZE = groesse/c;

Block scene[][][];

Camera cam;

void setup() {
  fullScreen(P3D);
  cam = new Camera(120f);
  
  noSmooth();
  
  scene = makeBlocks();
  
  float k = height/2;
  
  float fov = PI/3;
  float aspect = float(width)/height;
  
  float camZ = k / tan(fov/2);
  
  perspective(fov, aspect, camZ/100, camZ*5);
}

void draw() {
  background(0);
  
  lights();
  
  //sphere(20);
  
  //noStroke();
  stroke(0);
  drawBlocks(scene);
  
  cam.update();
}

void mouseWheel(MouseEvent e) {
  cam.f += e.getCount()*SIZE;
}