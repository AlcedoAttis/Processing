void setup() {
  fullScreen();
  rectMode(RADIUS);
  frameRate(12);
  //smooth(8);
  //noSmooth();
}

void draw() {
  background(255, 182, 99);
  stroke(0, 9, 25);
  strokeWeight(1.5);
  fill(0, 9, 25);

  float a = map(pow(sin(frameCount*0.02),3),-1,1,HALF_PI*(0.25),HALF_PI*(0.75));
  float b = map(pow(cos(frameCount*0.02),3),-1,1,HALF_PI*(0.25),HALF_PI*(0.75));
  float s = 42/(0.5+pow((sin(frameCount*0.02)),6));
  float t = 42/(0.5+pow((cos(frameCount*0.02)),6));
  
  translate(width/2, height/1.12);
  
  rect(0,100,s,100+a);
  tree(s, a);
  //translate(width/2.5, 100);
  //tree(t/2, b);
  //translate(-width/2.5, -100);
  //translate(-width/2.5, 100);
  //tree(t/2, HALF_PI-b);
  //translate(width/2.5, -100);
  
  //saveFrame("frames/#####.png");
}

void tree(float radius, float angle) {
  if (radius<5) strokeWeight(0);
  if (radius>=1) {
    rect(0, 0, radius, radius);
    translate(0, -radius);
    triangle(-radius,0,radius,0,radius*(sq(cos(angle))-sq(sin(angle))),-2*radius*sin(angle)*cos(angle));
    rotate(-angle);
    translate(0, -radius*(sin(angle)+cos(angle)));
    tree(radius*cos(angle),HALF_PI-angle);
    translate(0, radius*(sin(angle)+cos(angle)));
    rotate(HALF_PI);
    translate(0, -radius*(sin(angle)+cos(angle)));
    tree(radius*sin(angle),HALF_PI-angle);
    translate(0, radius*(sin(angle)+cos(angle)));
    rotate(angle-HALF_PI);
    translate(0, radius);
  }
  if(radius<5) strokeWeight(1.5);
}