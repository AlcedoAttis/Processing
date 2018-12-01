import peasy.*;
//Richtung Rot ist Basis
//Richtung Grün ist Zahl
//Richtung Blau ist Daten

PeasyCam cam;
int l = 100;
float th = 1000f/l;
int[][] data = new int[l][l];

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 1500);
  for (int i=0; i<data.length; i++) {
    for (int j=0; j<data[0].length; j++) {
      data[i][j] = numbercompression(i,j);
    }
  }
}
void draw() {
  background(0);
  rotateZ(-HALF_PI);
  rotateY(HALF_PI);
  
  translate(-l*th/2f,-l*th/2f,0);
  stroke(255,0,0); line(0,0,0,sqrt(l)*2,0,0);//x
  stroke(0,255,0); line(0,0,0,0,1000,0);//y
  stroke(0,0,255); line(0,0,0,0,0,1000);//z
  stroke(255);
  
  for (int j=0; j<data[0].length; j++) {
    for (int i=0; i<sqrt(j)*2; i++) {
      // -1 stands for not defined
      if(data[i][j]!=-1) point(i*th,j*th,data[i][j]*th);
    }
  }
}

// good to know: 00 im 1er System ist 1 (base 10)
int numbercompression(int num){
  int minstorage = Integer.MAX_VALUE;
  for(int tempbase=0; tempbase<data.length; tempbase++){
    int basedata = tempbase;
    int numberdata = floor(log(num)/log(tempbase))+1;
    if(basedata+numberdata>minstorage){
      minstorage = basedata+numberdata;
    }
  }
  return minstorage;
}
int numbercompression(int base,int num){
  if(base==0) return -1;
  else if(base==1) return num+1;
  else{
    int a = base;
    int b = floor(log(num)/log(base))+1;
    return a+b;
  }
}
