//PImage img;
int s = 840;
int a = s/60;

void setup(){
  //img = createImage(1200,1200,RGB);
  size(840,840);
  strokeWeight(3);
  //noSmooth();
  stroke(215,215,255);
  background(0,0,30);
  
    float lchance = 0.5;
    float lcm = 0.5;
  
  for(int x=0; x<s; x=x+a){
    pushMatrix();
    for(int y=0; y<s; y=y+a){
      if(random(1)<(lchance)){
        line(0,0,a,a);
        lchance = lcm;
      }
      else{
        line(a,0,0,a);
        lchance = 1-lcm;
      }
      translate(a,0);
    }
    popMatrix();
    translate(0,a);
  }
  
  save("kunst.png");
  //img.save("kunst.png");
}