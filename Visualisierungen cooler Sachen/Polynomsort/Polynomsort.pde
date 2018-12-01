import peasy.*;
ArrayList<int[]> P = new ArrayList<int[]>();
PeasyCam cam;
int counter;

int n = 3; // Vergrösserung
int m = 100; // Anzahl
boolean walk = true;
int l = 1; // Speed (inverse)
  
void setup() {
  fillList(m);
  //printList();
  noFill();
  fullScreen(P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  
  if(walk==true) counter = 0;
  else counter = P.size();
}

void draw() {
  background(0);
  stroke(255,0,0); line(0,0,0,1000,0,0); //X
  stroke(0,255,0); line(0,0,0,0,1000,0); //Y
  stroke(0,0,255); line(0,0,0,0,0,1000); //Z
  stroke(255);
  beginShape();
  for(int i=0; i<counter; i++){
    int[] t = P.get(i);
    vertex(n*t[0],n*t[1],n*t[2]);
  }
  endShape();
  if(walk==true && counter<P.size() && frameCount%l==0) counter++;
}

void fillList(int max_sum){
  int sum_counter = 0;
  while(sum_counter<=max_sum){
    for(int z=0; z<=sum_counter; z++){
    for(int y=0; y<=sum_counter; y++){
    for(int x=0; x<=sum_counter; x++){
      if(x+y+z==sum_counter){
        P.add(new int[]{x,y,z,sum_counter});
      }
    }}}
    sum_counter++;
  }
}

void printList(){
  for(int i=0; i<P.size(); i++){
    System.out.println("("+P.get(i)[0]+", "+P.get(i)[1]+", "+P.get(i)[2]+")");
  }
}
