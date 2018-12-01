import peasy.*;
PeasyCam cam;
int z = 500;
float towers[][] = new float[z][4];
int j = 0;

void setup(){
  //frameRate(1);
  //hint(ENABLE_DEPTH_TEST);
  //hint(ENABLE_DEPTH_SORT);
  size(600,600,P3D);
  cam = new PeasyCam(this, 600);
  
  for(int i=0;i<z;i++){
    float l = random(1.82,3.13)*random(1.82,3.13)*random(1.82,3.13)*random(1.82,3.13)*random(1.82,3.13);
    towers[i][0]= 20+l*l*l/40000; //height
    towers[i][1]= random(-100,100); //middle x
    towers[i][2]= random(-100,100); //middle y
    towers[i][3]=(int) random(150,200); //color
  }
  
  stroke(40);
}

void draw(){
  j++;
  
  if(j==2) j=0;
  if(j==0){
    fill(100);  strokeWeight(10);
    background(0);
    box(300,300,5);
    strokeWeight(1);
    
    for(int i=0;i<z;i++){
      pushMatrix();
      fill(towers[i][3]+random(-50,50),towers[i][3]+random(-50,50),towers[i][3]+random(-50,50),150);
      translate(towers[i][1],towers[i][2],towers[i][0]/2);
      box(10,10,towers[i][0]);
      popMatrix();
    }
  }
}