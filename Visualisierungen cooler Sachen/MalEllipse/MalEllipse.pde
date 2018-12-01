int size=10000;

void setup(){
  size(800,600,P3D);
}
  

void draw(){
  background(0);
  stroke(255);
  strokeWeight(10);
  point(300,300);
  point(500,300);
  strokeWeight(1);
  for(int i = 0;i<600;i++){   //y
    for(int j = 0;j<800;j++){ //x
      int diff =(int) (sqrt(sqr(300-j)+sqr(300-i))*sqrt(sqr(500-j)+sqr(300-i)));
      if(abs(size-diff)<25)
      point(j,i);
    } 
  }
  //size=size+10;
}

float sqr(int x){
  return x*x;
}