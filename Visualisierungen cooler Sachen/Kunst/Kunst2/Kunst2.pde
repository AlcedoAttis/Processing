//PImage img;
int s = 840;  // s7b needs to be int
int b = 56;
int a = s/b;

float rs = 0.553;
float sum_rs = 0;
float count_rs = 0;

boolean[][] r = new boolean[b][b];

void setup(){
  //img = createImage(1200,1200,RGB);
  //save("kunst.png");
  //img.save("kunst.png");
  size(840, 840);
  strokeWeight(4);
  noSmooth();
  stroke(215, 215, 255);
  frameRate(4);
}

void draw(){
  background(0, 0, 30);
  
  for (int x=0; x<b; x++) {
    for (int y=0; y<b; y++) {
      float rnd = random(1);
      
      if(x>0 && y>0 && r[x-1][y-1] && !r[x-1][y] && !r[x][y-1]) r[x][y] = false;
      else if (rnd<rs) r[x][y] = true;
      else r[x][y] = false;
    }
  }
  
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
  
  int c_all = b*b;
  int c_true = 0;
  for (int x=0; x<b; x++) {
    for (int y=0; y<b; y++) {
      if(r[x][y]) c_true++;
    }
  }
  float new_rs = 1.0 * c_true/c_all;
  System.out.println(new_rs + " for "+rs+"   best: "+sum_rs/count_rs);
  rs = rs + (0.5 - new_rs)/100.0;
  
  sum_rs += rs;
  count_rs++;
  
  if(frameCount == 100) save("kunst.png");
}