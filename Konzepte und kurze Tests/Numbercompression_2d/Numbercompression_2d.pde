int b = 1000; // Anzahl der probierten bases 0 bis b-1
int n = 0; // Zahl
int[] data = new int[b];

void setup() {
  frameRate(5);
  size(800, 800, P3D);
}

void draw() {
  for (int i=0; i<b; i++) {
      data[i] = numbercompression(i,n);
  }
  background(0);
  float thickness = 800f/b;
  int maxnum = 0;
  for (int i=0; i<b; i++) {
      if(data[i]>maxnum) maxnum=data[i];
  }
  float heightmultiplier = 800f/(maxnum*1.1);
  
  noFill();
  for (int i=0; i<b; i++) {
    stroke(255,0,0); strokeWeight(3);
    if(data[i]!=-1) point(i*thickness,800-data[i]*heightmultiplier);
  }
  beginShape();
  for (int i=0; i<b; i++) {
    stroke(255,100); strokeWeight(1);
      if(data[i]!=-1) vertex(i*thickness,800-data[i]*heightmultiplier);
      else vertex(i*thickness,800-Integer.MAX_VALUE);
  }
  endShape();
  
  n++;
  b=n;
}

// good to know: 00 im 1er System ist 1 (base 10)
int numbercompression(int base,int num){
  if(base==0) return -1;
  else if(base==1) return num+1;
  else{
    int a = base;
    int b = floor(log(num)/log(base))+1;
    return a+b;
  }
}