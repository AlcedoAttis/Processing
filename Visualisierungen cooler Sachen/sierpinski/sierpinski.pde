void setup() {
  fullScreen();
  //size(900,600);
  background(0);
  strokeWeight(1);
  noSmooth();
  stroke(255);
  fill(0,0,0,1);
  //frameRate(10);
  rectMode(CORNERS);

  xx = random(0, width);
  yy = random(0, height);
}
float xx = 0;
float yy = 0;

void draw() {
  //rect(-10,-10,width+10,height+10);
  
  for(int i=0; i<frameRate; i++){
    int r = (int)random(3);
  
    if (r==0) {
      float px = width/2;
      float py = 0;
  
      xx = ((xx+px)/2);
      yy = ((yy+py)/2);
  
      point((int)xx, (int)yy);
    } else if (r==1) {
      float px = width/2+(height/sqrt(3));
      float py = height;
  
      xx = ((xx+px)/2);
      yy = ((yy+py)/2);
  
      point((int)xx, (int)yy);
    } else {
      float px = width/2-(height/sqrt(2));
      float py = height;
  
      xx = ((xx+px)/2);
      yy = ((yy+py)/2);
  
      point((int)xx, (int)yy);
    }
  }
}