void setup(){
  fullScreen();
  //frameRate(1);
  background(10,0,40);
  stroke(250,150,0);
}

// [-1,1]
/*void draw(){
  float edge = 0.01;
  translate(width*0.5,0);
  int den = frameCount;
  float y = (height*0.5*edge)+(height*(1.0-edge))*(1-1.0/den);
  float dx = ((width*(1.0-edge))*0.5)*(1.0/den);
  
  for(int i=0; i<=den; ++i){
    if(gcd(i, den)==1){
      strokeWeight(100.0/(den+1));
      point(i*dx,y);
      point(-i*dx,y);
    }
  }
}*/

// ]0,1[
void draw(){
  float edge = 0.01;
  translate(0,-height);
  int den = frameCount;
  float y = (height*edge)+2*(height*(1.0-edge))*(1-1.0/den);
  float dx = ((width*(1.0-edge)))*(1.0/den);
  
  for(int i=0+1; i<den; ++i){
    if(gcd(i, den)==1){
      strokeWeight(100.0/(den));
      point(i*dx,y);
    }
  }
}

int gcd(int a, int b){
    if(b!=0) return gcd(b, a % b);
    else return a;
}
