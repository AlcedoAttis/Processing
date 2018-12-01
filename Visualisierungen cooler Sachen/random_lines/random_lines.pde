ArrayList<float[]> lines;

void setup(){
  colorMode(HSB, 360, 100, 100);
  fullScreen();
  lines = new ArrayList();
}

void draw(){
  background(0);
  translate(width/2,height/2);
  float[] temp = new float[5];
  float temp_1 = random(2*PI);
  //temp[0] = map(random(1),0,1,180,220)*sin(temp_1);
  //temp[1] = map(random(1),0,1,180,220)*cos(temp_1);
  temp[0] = randomGaussian()*150*sin(temp_1);
  temp[1] = randomGaussian()*150*cos(temp_1);
  temp[2] = random(360);
  lines.add(temp);
  
  if(lines.size() > 200){
    lines.remove(0);
  }
  
  for(float[] x : lines){
    stroke(x[2],100,100);
    line(0,0,x[0],x[1]);
  }
}