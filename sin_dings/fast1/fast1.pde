import peasy.*;
PeasyCam cam;

int r = 10;  // "Radius" of Boxes
int h = 14;  // relative height of Boxes
float stretch = 0.05; // how streched sinuses? xD
float speed = 0.03; // speed of change

float phi;
float wid_m;
float hig_m;
float[][][] boxes;  // real_x,real_z, dist

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 200);
  cam.setMinimumDistance(150);
  cam.setMaximumDistance(500);

  phi = 0;
  wid_m = 50.0/r;
  hig_m = wid_m * h;
  boxes = new float[2*r+1][2*r+1][3];
  
  for (int x=-r; x<=r; x++) {
    for (int z=-r; z<=r; z++) {
      boxes[x+r][z+r][0]= wid_m*x;
      boxes[x+r][z+r][1]= wid_m*z;
      boxes[x+r][z+r][2]= stretch*wid_m*sqrt(sq(x)+sq(z)); // *wid_m nur für variablen und outputkonsitenz
    }
  }
}

void draw() {
  lights();
  rotateX(-.6);
  rotateY(-PI/6);
  background(10);
  fill(220);
  stroke(50);

  phi += speed;

  for (float[][] x : boxes) {
    for (float[] z : x) {
      translate(z[0], 0, z[1]);
      box(wid_m, hig_m*sin(z[2]+phi), wid_m);
      translate(-z[0], 0, -z[1]);
    }
  }
}