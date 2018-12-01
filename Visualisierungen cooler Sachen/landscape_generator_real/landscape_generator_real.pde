import peasy.*;
PeasyCam cam;

int dm = 5;
int bm = 5;
int em = 1;
int l = 50;
float thickness = 1000f/l;
float scalar = 100f/l;
float[][] data = new float[l][l];
boolean[][] flow = new boolean[l][l];

void setup() {
  //frameRate(1);
  //fullScreen(P3D);
  size(800, 800, P3D);
  noStroke();
  //stroke(0);
  cam = new PeasyCam(this, 2000);
  cam.setSuppressRollRotationMode();
  for (int breath=0; breath<data.length; breath++) {
    for (int depth=0; depth<data[0].length; depth++) {
      // calculation for the Startfunction
      data[breath][depth] = em*l+dm*depth+bm*abs(data.length/2-breath);
    }
  }
}

int cou = 0;
void draw() {
  frameRate(300);
  System.out.println(frameRate);
  
  boxdraw();
  //triangledraw();
  
  topple();
  erdrutsch();
  //if(cou % 300 == 0) lazorz();
  
  //if(cou%10==0) saveFrame("Frames/line-######.png");
  cou++;
}

void lazorz(){
  int rb = int(random(0, data.length));
  int rd = int(random(0, data[1].length));
  
  data[rb][rd] += 1000;
}

void triangledraw(){
  background(0);
  directionalLight(190,190,190,-0.3,-0.2,-1);
  directionalLight(190,190,190,0.3,-0.2,-1);
  pushMatrix();
  rotateZ(PI);
  rotateX(-1);
  translate(-l*thickness/2, -l*thickness/2, 0);
  for (int y = 0; y < data.length-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < data[0].length; x++) {
      vertex(x*thickness, y*thickness, data[x][y]*scalar);
      vertex(x*thickness, (y+1)*thickness, data[x][y+1]*scalar);
    }
    endShape();
  }
  popMatrix();
}

void boxdraw(){
  rotateX(-0.5);
  rotateY(0.5);
  background(0);
  translate(-l*thickness/2, 0, l*thickness/2);
  for (int breath=0; breath<data.length; breath++) {
    pushMatrix();
    for (int depth=0; depth<data[0].length; depth++) {
      pushMatrix();
      translate(0, -data[breath][depth]*scalar/2f, 0);
      fill(map(data[breath][depth],0,(em+dm+bm/2)*l,20,255));
      if(flow[breath][depth]==true) fill(0,0,255);
      box(thickness, data[breath][depth]*scalar, thickness);
      if(data[breath][depth]<0) data[breath][depth]=0;
      popMatrix();
      translate(0, 0, -thickness);
    }
    popMatrix();
    translate(thickness, 0, 0);
  }
}

void erdrutsch(){
  // diff von 7 is standart
  int godif = 3*(dm+bm/2);
  for (int breath=0; breath<data.length; breath++) {
    for (int depth=0; depth<data[0].length; depth++) {
      if(breath+1<data.length) if(data[breath+1][depth] >= godif+data[breath][depth]) {
        data[breath][depth] += godif/2;
        data[breath+1][depth] -= godif/2;
      }
      if(breath-1>=0) if(data[breath-1][depth] >= godif+data[breath][depth]) {
        data[breath][depth] += godif/2;
        data[breath-1][depth] -= godif/2;
      }
      if(depth+1<data[0].length) if(data[breath][depth+1] >= godif+data[breath][depth]) {
        data[breath][depth] += godif/2;
        data[breath][depth+1] -= godif/2;
      }
      if(depth-1>=0) if(data[breath][depth-1] >= godif+data[breath][depth]) {
        data[breath][depth] += godif/2;
        data[breath][depth-1] -= godif/2;
      }
    }
  }
}

void topple() {
  boolean[][] tempflow = new boolean[l][l];
  int rb = int(random(0, data.length));
  int rd = int(random(0, data[1].length));
  /*
  int rb = 0;
  int rd = 0;
  int l1 = int(random(3));
  if(l1==0){
    rb = int(random(1, data.length-1));
    rd = int(random(data.length*2/3,data.length-2));
  } else if(l1==1){
    rb = int(random(1, data.length/3));
    rd = int(random(1, data[1].length-1));
  } else if(l1==2){
    rb = int(random(data.length*2/3, data.length-1));
    rd = int(random(1, data[1].length-1));
  }*/
  
  
  int abtrag = 0;

  boolean stilltopple = true;
  while (stilltopple == true) {
    tempflow[rb][rd] = true;
    if (rb==0 || rb==(data.length-1) || rd==0 || rd==(data[1].length-1)) {
      stilltopple = false;
      data[rb][rd]--;
    } else {
      float dr = max(0, data[rb][rd]-data[rb+1][rd]);
      float dl = max(0, data[rb][rd]-data[rb-1][rd]);
      float dv = max(0, data[rb][rd]-data[rb][rd+1]);
      float dh = max(0, data[rb][rd]-data[rb][rd-1]);
      float sum = dr+dl+dv+dh;
      float r = random(0, sum);
      float r2 = 0;
      //float r2 = random(0,0.3*l); // Wasserweg ~ 1.2*l --> Abtrag bei 0.3*l sicher, davor gewichtet random (so niedrig wegen schon vorheriger Abtragung)
      float r3 = random(0.2,0.8);
      
      //data[rb][rd]--;
      if(sum!=0) {
        data[rb][rd]--;
        abtrag += 1;
        if (r<dr) {
          if(r2<abtrag){
            data[rb+1][rd] += r3;
            abtrag -= r3;
          }
          rb++;
        } else if (r<dr+dl) {
          if(r2<abtrag){
            data[rb-1][rd] += r3;
            abtrag -= r3;
          }
          rb--;
        } else if (r<dr+dl+dv) {
          if(r2<abtrag){
            data[rb][rd+1] += r3;
            abtrag -= r3;
          }
          rd++;
        } else {
          if(r2<abtrag){
            data[rb][rd-1] += r3;
            abtrag -= r3;
          }
          rd--;
        }
      }
      else stilltopple = false;
    }
  }
  flow = tempflow; //ABSICHT, SHALLOWCOPY GEWOLLT
}