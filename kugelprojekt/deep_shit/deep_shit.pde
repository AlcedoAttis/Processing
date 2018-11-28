int wn; int hn; int n;
int[] superl[] = new int[2][];
ArrayList<Integer> listx1 = new ArrayList<Integer>();
ArrayList<Integer> listy1 = new ArrayList<Integer>();
ArrayList<Integer> listx2 = new ArrayList<Integer>();
ArrayList<Integer> listy2 = new ArrayList<Integer>();
int big = 0;

import peasy.*;
PeasyCam cam;

void setup(){
  cam = new PeasyCam(this, 1000);
  //frameRate(1);
  background(0);
  wn = /*displayWidth;  // */2*255;
  hn = /*displayHeight; // */2*255;
  n = wn;
  //fullScreen();
  size(510,510,P3D);
  int listx[] = new int[n];
  int listy[] = new int[n];
  
  superl[0]=listx;
  superl[1]=listy;
  
  neu();
  
  for(int i=0;i<n;i++){
    for(int j=i+1;j<n;j++){
      if(dist(superl[0][i],superl[1][i],superl[0][j],superl[1][j])){
          listx1.add(superl[0][i]);
          listy1.add(superl[1][i]);
          listx2.add(superl[0][j]);
          listy2.add(superl[1][j]);
      }
    }
  }
}

void mouseClicked() {
  if (mouseButton == RIGHT) {
    background(0);
  }
}

void draw(){
  translate(-255,-255);
  strokeWeight(1);
  for(int i=0;i<listx1.size();i++){
    float r=random(40,100); float g=r+random(0,105); float b=r+10;
    stroke(r,g,b);
    point(2*r,2*g,2*b);
  }
}

void neu(){
 for(int i=0;i<wn;i++){
    superl[0][i]=int(random(wn));
    superl[1][i]=int(random(hn));
 }
}

boolean dist(int x1, int y1, int x2, int y2){
  float distance = sqrt(abs(x2-x1)*abs(x2-x1)+abs(y2-y1)*abs(y2-y1));
  if(distance<2*sqrt(n) && 2*distance>sqrt(n)){
    return true;
  }
  else{
    return false; 
  }
}