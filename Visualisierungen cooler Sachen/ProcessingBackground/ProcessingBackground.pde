int n = 150; //anzahl
int m = 50; //abstand
int s = 800; //size
int l = 120; //linedistance
ArrayList<int[]> points = new ArrayList(); // 0=x 1=y

void settings(){
  size(s,s);
}

void setup(){
  stroke(255);
  background(0);
  strokeWeight(1);
  frameRate(2);
  
  for(int i=0; i<n; i++){
    int k = 0;
    int x=0;
    int y=0;
    while(k==0){
      k=1;
      x = (int) random(0,s);
      y = (int) random(0,s);
      
      for(int j=0;j<points.size();j++){
        float diff = sqrt(sqr(points.get(j)[0]-x)+sqr(points.get(j)[1]-y));
        if(diff<m){
          j=j+100000000;
          k=0;
        }
      }
    }
    int lulz[] = new int[2];
    lulz[0]=x; lulz[1]=y;
    points.add(lulz);
  }
  
  for(int i=0; i<n; i++){
    point(points.get(i)[0],points.get(i)[1]);
  }
  
  for(int i=0;i<points.size();i++){
    for(int j=0;j<points.size();j++){
      float dist = sqrt(sqr(points.get(j)[0]-points.get(i)[0])+sqr(points.get(j)[1]-points.get(i)[1]));
      if(dist<l){
        float r=random(40,100); float g=r+random(0,105); float b;
        if(r>70){
          b=random(0,50);
          r=r+random(55,155);
          g=g+random(55,105);
        }
        else{
          b =random(50,255);}
        stroke(r,g,b);
        line(points.get(j)[0],points.get(j)[1],points.get(i)[0],points.get(i)[1]);
      }
    }
  }
}

void draw(){
  
  
  
}

float sqr(float x){
  return x*x;
}