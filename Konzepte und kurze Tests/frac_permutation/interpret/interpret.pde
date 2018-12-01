BufferedReader r;
PGraphics g;
int num = 362880;
int divx = 40;
int divy = 40;
// 120 minimum all information with noStroke()
// 60 minimum all information
// 40 minimum with tile bigger than stroke, maximum < 10000^2 pixels^2

// 2^7 * 3^4 * 5 * 7 <- must use only theese primes
// &
// 362880/[your Number] = 9*8*7*6*X  | X out of natural numbers
int[] fx = new int[num];
color white = color(255, 255, 255);
color black = color(0, 0, 0);

void setup() {
  g = createGraphics(362800/divx, 362800/divy);
  r = createReader("in2.txt");
  for (int i=0; i<num; i++) {
    try {
      fx[i] = Integer.parseInt(r.readLine());
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
  }

  g.noSmooth();
  g.beginDraw();
  g.background(#ffffff);
  g.rectMode(CORNERS);

  g.scale(1, -1);
  g.translate(0, -g.height);
  //g.noStroke();

  int mul1 = 9;
  int mul2 = 8;
  int mul3 = 7;
  int mul4 = 6;
  boolean[][] a = new boolean[mul1][mul1];
  boolean[][] b = new boolean[mul1*mul2][mul1*mul2];
  boolean[][] c = new boolean[mul1*mul2*mul3][mul1*mul2*mul3];
  boolean[][] d = new boolean[mul1*mul2*mul3*mul4][mul1*mul2*mul3*mul4];

  for (int i=0; i<fx.length; i++) {
    float x = (1f * i)/num;
    float y = (1f * fx[i])/num;

    a[floor(x*mul1)][floor(y*mul1)] = true;
    b[floor(x*mul1*mul2)][floor(y*mul1*mul2)] = true;
    c[floor(x*mul1*mul2*mul3)][floor(y*mul1*mul2*mul3)] = true;
    d[floor(x*mul1*mul2*mul3*mul4)][floor(y*mul1*mul2*mul3*mul4)] = true;
  }
  
  for (int x=0; x<mul1*mul2*mul3*mul4; x++) { // x2
    for (int y=0; y<mul1*mul2*mul3*mul4; y++) { // y2
      if (!d[x][y]) {
        g.fill(#4D0500);
        float x0 = 1f * num/(mul1*mul2*mul3*mul4*divx) * (x);
        float y0 = 1f * num/(mul1*mul2*mul3*mul4*divy) * (y);
        float x1 = 1f * num/(mul1*mul2*mul3*mul4*divx) * (x+1);
        float y1 = 1f * num/(mul1*mul2*mul3*mul4*divy) * (y+1);
        g.rect(round(x0), round(y0), round(x1), round(y1));
      }
    }
  }
  for (int x=0; x<mul1*mul2*mul3; x++) { // x2
    for (int y=0; y<mul1*mul2*mul3; y++) { // y2
      if (!c[x][y]) {
        g.fill(#972000);
        float x0 = 1f * num/(mul1*mul2*mul3*divx) * (x);
        float y0 = 1f * num/(mul1*mul2*mul3*divy) * (y);
        float x1 = 1f * num/(mul1*mul2*mul3*divx) * (x+1);
        float y1 = 1f * num/(mul1*mul2*mul3*divy) * (y+1);
        g.rect(round(x0), round(y0), round(x1), round(y1));
      }
    }
  }
  for (int x=0; x<mul1*mul2; x++) { // x1
    for (int y=0; y<mul1*mul2; y++) { // y1
      if (!b[x][y]) {
        g.fill(#D35E00);
        float x0 = 1f * num/(mul1*mul2*divx) * (x);
        float y0 = 1f * num/(mul1*mul2*divy) * (y);
        float x1 = 1f * num/(mul1*mul2*divx) * (x+1);
        float y1 = 1f * num/(mul1*mul2*divy) * (y+1);
        g.rect(round(x0), round(y0), round(x1), round(y1));
      }
    }
  }
  for (int x=0; x<mul1; x++) { // x0
    for (int y=0; y<mul1; y++) { // y0
      if (!a[x][y]) {
        g.fill(#FFBD00);
        float x0 = 1f * num/(mul1*divx) * x;
        float y0 = 1f * num/(mul1*divy) * y;
        float x1 = 1f * num/(mul1*divx) * (x+1);
        float y1 = 1f * num/(mul1*divy) * (y+1);
        g.rect(round(x0), round(y0), round(x1), round(y1));
      }
    }
  }

  g.endDraw();
  g.save("out.png");
  System.out.println("ferdsch");

  exit();
}


//g.stroke(100,0,0);
//  g.strokeWeight(16);
//  for (int i=1; i<fx.length; i++) {
//    g.point(1.0*i/divx, 1.0*fx[i]/divy);
//  }
//  g.stroke(170,70,0);
//  g.strokeWeight(8);
//  for (int i=1; i<fx.length; i++) {
//    g.point(1.0*i/divx, 1.0*fx[i]/divy);
//  }
//  g.stroke(200,110,0);
//  g.strokeWeight(4);
//  for (int i=1; i<fx.length; i++) {
//    g.point(1.0*i/divx, 1.0*fx[i]/divy);
//  }
//  g.stroke(220,160,0);
//  g.strokeWeight(2);
//  for (int i=1; i<fx.length; i++) {
//    g.point(1.0*i/divx, 1.0*fx[i]/divy);
//  }
//  g.stroke(250,220,0);
//  g.strokeWeight(1);
//  for (int i=1; i<fx.length; i++) {
//    g.point(1.0*i/divx, 1.0*fx[i]/divy);
//  }
//  g.fill(random(0, 255), random(0, 255), random(0, 255));