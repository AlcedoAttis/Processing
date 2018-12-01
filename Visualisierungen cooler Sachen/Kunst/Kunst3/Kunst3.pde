//PImage img;
int s = 840;  // s/b needs to be int
int b = 56;
int a = 15; // a = s/b
int B = 3*b;
float rs = 0.5530;
int min_length = (int) (B*B*0.283);

boolean[][] r = new boolean[b][b];
int[][] o = new int[3*b][3*b];

void setup() {
  size(840, 840);
  strokeWeight(4);
  noSmooth();
  stroke(215, 215, 255);
}

void draw() {
  while (true) {
    for (int x=0; x<b; x++) {
      for (int y=0; y<b; y++) {
        float rnd = random(1);

        if (x>0 && y>0 && r[x-1][y-1] && !r[x-1][y] && !r[x][y-1]) r[x][y] = false;
        else if (rnd<rs) r[x][y] = true;
        else r[x][y] = false;
      }
    }
    if (check_length(r)) break;
  }
  
  background(0, 0, 30);
  for (int x=0; x<b; x++) {
    pushMatrix();
    for (int y=0; y<b; y++) {
      if (r[x][y]) line(a, 0, 0, a);
      else line(0, 0, a, a);
      translate(a, 0);
    }
    popMatrix();
    translate(0, a);
  }
  save("kunst.png");
  //exit();
}