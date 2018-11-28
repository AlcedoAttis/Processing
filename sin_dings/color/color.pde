import peasy.*;
PeasyCam cam;

int r = 9;  // "Radius" of Boxes
int h = 5;  // relative height of Boxes
float stretch = 0.05; // how streched sinuses? xD
float speed = 0.025; // speed of change

float phi;
float wid_m;
float hig_m;
float[][][] boxes;  // real_x,real_z, dist

void setup() {
  size(800, 800, P3D);
  //fullScreen(P3D);
  cam = new PeasyCam(this, 200);
  cam.setMinimumDistance(150);
  cam.setMaximumDistance(5000);

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
  noStroke();

  phi += -speed;

  for (float[][] x : boxes) {
    for (float[] z : x) {
      translate(z[0], 0, z[1]);

      //box(wid_m, hig_m*sin(z[2]+phi), wid_m);
      boox(wid_m, wid_m, hig_m*(0.3+sq(sin(z[2]+phi))));

      translate(-z[0], 0, -z[1]);
    }
  }
}


void boox(float w1, float w2, float h) {
  w1 *= 0.5;
  w2 *= 0.5;
  
  color c1 = color(#D0F4DE);
  color c2 = color(#E3655B);
  color c3 = color(#FAF2A1);

  fill(c1);
  beginShape();
  vertex(w1, h, w2);
  vertex(-w1, h, w2);
  vertex(-w1, h, -w2);
  vertex(w1, h, -w2);
  endShape(CLOSE);

  beginShape();
  vertex(w1, -h, w2);
  vertex(-w1, -h, w2);
  vertex(-w1, -h, -w2);
  vertex(w1, -h, -w2);
  endShape(CLOSE);
  
  
  fill(c2);
  beginShape();
  vertex(w1, h, w2);
  vertex(w1, -h, w2);
  vertex(w1, -h, -w2);
  vertex(w1, h, -w2);
  endShape(CLOSE);

  beginShape();
  vertex(-w1, h, w2);
  vertex(-w1, -h, w2);
  vertex(-w1, -h, -w2);
  vertex(-w1, h, -w2);
  endShape(CLOSE);
  
  
  fill(c3);
  beginShape();
  vertex(w1, h, w2);
  vertex(-w1, h, w2);
  vertex(-w1, -h, w2);
  vertex(w1, -h, w2);
  endShape(CLOSE);

  beginShape();
  vertex(w1, h, -w2);
  vertex(-w1, h, -w2);
  vertex(-w1, -h, -w2);
  vertex(w1, -h, -w2);
  endShape(CLOSE);
}
