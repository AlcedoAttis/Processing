import peasy.*;
PeasyCam cam;

PrintWriter v_out;
PrintWriter f_out;

final float PHI = (1.0 + sqrt(5.0)) / 2.0;
int gen = 1;
int gen_new = 1;

// arraylists for all data
ArrayList<pointc> pts = new ArrayList<pointc>(); 
ArrayList<face> fcs = new ArrayList<face>(); 


void setup() {
  //fullScreen(P3D);
  size(900, 600, P3D);
  cam = new PeasyCam(this, 50);
  cam.setMinimumDistance(75);
  cam.setMaximumDistance(500);

  stroke(255, 0, 0);
  //noStroke();
  strokeWeight(10);
  fill(0, 255, 0);

  v_out = createWriter("vertices_out.txt"); 
  f_out = createWriter("faces_out.txt");

  setter();
}

void draw() {
  if (gen_new>gen) {
    incr_gen();
  }
  gen = gen_new;

  background(10);
  lights();
  int v = 10;
  stroke(255, 0, 0);
  for (pointc p : pts) point(v*p.x, v*p.y, v*p.z);
  noStroke();
  for (face f : fcs) {
    beginShape(TRIANGLES);
    vertex(v*f.vert[0].x, v*f.vert[0].y, v*f.vert[0].z);
    vertex(v*f.vert[1].x, v*f.vert[1].y, v*f.vert[1].z);
    vertex(v*f.vert[2].x, v*f.vert[2].y, v*f.vert[2].z);
    endShape();
  }
}

void keyPressed() {
  if (key == ' ') {
    gen_new++;
  }
}
