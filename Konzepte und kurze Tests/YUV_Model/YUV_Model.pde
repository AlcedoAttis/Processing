import peasy.*;

PeasyCam cam;

void setup() {
  //size(1000, 800, P3D);
  fullScreen(P3D);
  cam = new PeasyCam(this, 500);
  
  cam.rotateY(-HALF_PI);
  cam.rotateZ(-PI/4);
  
}

void draw() {
  background(0);
  // Coordinate System
  int n = 300;
  drawArrow(0, n, 0, 0, 0, 0);
  drawArrow(0, 0, 0, n, 0, 0);
  drawArrow(0, 0, 0, 0, 0, n);
  
  strokeWeight(10);
  int s = 8;
  for (int r=0; r<256/s; r++) {
    //int r = 100/s;
    for (int g=0; g<256/s; g++) {
      for (int b=0; b<256/s; b++) {
        float r2 = r*s;
        float g2 = g*s;
        float b2 = b*s;
        
        float y = 0.299*r2 + 0.587*g2 + 0.114*b2;
        float u = 0.492*(b2-y);
        float v = 0.877*(r2-y);
        
        //float y = 1f/3*r2+1f/3*g2+1f/3*b2;
        //float u = 2*(b2-y);
        //float v = 2*(r2-y);
        
        stroke(r2,g2,b2);
        point(y,u,v);
      }
    }
  }
}

void drawArrow(int x1, int x2, int y1, int y2, int z1, int z2) {
  strokeWeight(1);
  stroke(128+128*sign(x2-x1), 128+128*sign(y2-y1), 128+128*sign(z2-z1), 255);
  line(x1, y1, z1, x2, y2, z2);
  strokeWeight(10);
  point(x2, y2, z2);
  strokeWeight(1);  
  noStroke();
}

int sign(int x) {
  if (x>0) return 1;
  if (x<0) return 1;
  return 0;
}
//rotateX(-.5);
//rotateY(-.5);
//background(0);
//fill(255,0,0);
//box(30);
//pushMatrix();
//translate(0,0,20);
//fill(0,0,255);
//box(5);
//popMatrix();