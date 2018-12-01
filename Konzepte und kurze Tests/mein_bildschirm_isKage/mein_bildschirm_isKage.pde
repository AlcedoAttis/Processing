void setup(){
 fullScreen();
 //frameRate(20);
 noStroke();
}

void draw(){
  if(frameCount%2==0){
    background(0);
    fill(255);
    rect(100,100,200,200);
  }
  else{
    background(255);
    fill(0);
    rect(100,100,200,200);
  }
}