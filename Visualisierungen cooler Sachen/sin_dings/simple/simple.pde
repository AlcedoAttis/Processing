import peasy.*;
PeasyCam cam;

int r = 10;  // "Radius" of Boxes
int h = 14;  // relative height of Boxes
float stretch = 0.05; // how streched sinuses? xD
float speed = 0.03; // speed of change

float phi;
float wid_m;
float hig_m;

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 200);
  cam.setMinimumDistance(150);
  cam.setMaximumDistance(500);
  
  phi = 0;
  wid_m = 50.0/r;
  hig_m = wid_m * h;
}

void draw() {
  lights();
  rotateX(-.6);
  rotateY(-PI/6);
  background(10);
  fill(220);
  stroke(50);
  
  phi += speed;
  
  for (int x=-r; x<=r; x++) {
    for (int z=-r; z<=r; z++) {
      drawBox(phi, x*wid_m, z*wid_m);
    }
  }
  
}

void drawBox(float phi, float x, float z) {
  float val = (sin(((sqrt(sq(x)+sq(z)))*stretch)+phi)) * hig_m;
  
  translate(x, 0, z);
  box(wid_m, val, wid_m);
  translate(-x, 0, -z);
}


/*
fill(255,0,0);
 box(30);
 pushMatrix();
 translate(0,0,20);
 fill(0,0,255);
 box(5);
 popMatrix();
 */