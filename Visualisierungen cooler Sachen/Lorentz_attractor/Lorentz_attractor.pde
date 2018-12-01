import peasy.*;
PeasyCam cam;

void setup() {
  size(900,800,P3D);
  cam = new PeasyCam(this, 600);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(2000);
  cam.setSuppressRollRotationMode();
}
int counter = 0;
float[][] save;

float x = 8.5;
float y = 8.5;
float z = 26.5;

float a = 10;
float b = 28;
float c = 8f/3;

void draw() {
  float[][] array = new float[counter+1][3];
  for(int i=0; i<counter; i++){
    array[i]=save[i];
  }
  array[counter][0]=x;
  array[counter][1]=y;
  array[counter][2]=z;
  
  save = new float[counter+1][3];
  for(int i=0; i<counter+1; i++){
    save[i]=array[i];
  }
  
  background(0);
  
  float dx = a*(y-x);
  float dy = x*(b-z)-y;
  float dz = x*y-c*z;
  
  stroke(255);
  strokeWeight(1);
  noFill();
  
  //everything();
  //trace();
  rainbow();
  
  x=x+dx/100;
  y=y+dy/100;
  z=z+dz/100;
  
  counter++;
}

void trace(){
  beginShape();
  int counter2 = 255;
  for(int i=counter; i>=0; i--){
   if(counter2!=1) vertex(save[i][0]*5, save[i][1]*5, save[i][2]*5);
   stroke(counter2);
   if(counter2!=1) counter2=counter2-2;
  }
  endShape();
}

void everything(){
  beginShape();
  stroke(255);
  for(int i=0; i<save.length; i++){
   vertex(save[i][0]*5, save[i][1]*5, save[i][2]*5);
  }
  endShape();
}

void rainbow(){
  colorMode(HSB,255);
  beginShape();
  int counter2 = 0;
  for(int i=0; i<counter+1; i++){
   vertex(save[i][0]*5, save[i][1]*5, save[i][2]*5);
   color c = color(counter2,255,255);
   stroke(c);
   strokeWeight(5);
   counter2++;
   if(counter2==255) counter2=0;
  }
  endShape();
}