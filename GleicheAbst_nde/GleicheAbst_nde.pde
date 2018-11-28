int n = 1; //anzahl
int m = 50; //abstand
ArrayList<int[]> points = new ArrayList(); // 0=x 1=y

void setup(){
  size(500,500);
  stroke(255);
  strokeWeight(5);
  frameRate(1);
}

void draw(){
  points.clear();
  background(0);
  
  for(int i=0; i<n; i++){
    int k = 0;
    int x=0;
    int y=0;
    while(k==0){
      k=1;
      x = (int) random(0,500);
      y = (int) random(0,500);
      
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
  
  n++;
}

float sqr(float x){
  return x*x;
}