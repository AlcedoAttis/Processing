import peasy.*;

PeasyCam cam;
 
void setup() {
  //fullScreen(P3D);
  
  size(900,600,P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void draw() {
  if(frameCount>20) mouseinWindow();
}

void keyPressed() {
  if(key == ' '){
    System.out.println("gg");
  }
}

void mouseinWindow() {
  if(mouseX>=width-1 || mouseX<=0 || mouseY>=height-1 || mouseY<=0){
    System.out.println("out");
    exit();
  }
  else{
    System.out.println("in"+mouseX);
  }
}

/*
rotateX(-.5);
  rotateY(-.5);
  background(0);
  fill(255,0,0);
  box(30);
  pushMatrix();
  translate(0,0,20);
  fill(0,0,255);
  box(5);
  popMatrix();
*/