ArrayList<float[]> stars;

void setup(){
  colorMode(HSB, 360, 100, 100);
  fullScreen();
  stars = new ArrayList();
  background(0);
}

void draw(){
  ArrayList<float[]> tbr = new ArrayList();
  for(float[] star : stars){
    if(abs(star[0])>width/2 || abs(star[1])>height/2){
      tbr.add(star);
    }
  }
  for(float[] t : tbr){
    stars.remove(t);
  }
  
  while(stars.size()<750){
    float[] star = new float[2];
    star[0] = random(-10,10);
    star[1] = random(-10,10);
    stars.add(star);
  }
  
  //background(0);
  noStroke(); fill(0,0,0,50); rect(0,0,width,height);
  stroke(255);
  translate(width/2,height/2);
  
  for(float[] star : stars){
    float size = map(sqrt(sq(star[0])+sq(star[1])),0,sqrt(sq(width/2)+sq(height/2)),0,20);
    star[0] *= 1.02;
    star[1] *= 1.02;
    strokeWeight(size);
    point(star[0],star[1]);
  }
}