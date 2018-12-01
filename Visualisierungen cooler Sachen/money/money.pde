ArrayList<Integer> y = new ArrayList<Integer>();
ArrayList<Integer> sum_at_y = new ArrayList<Integer>();
int max = 0;

// Geldscheine
int k = 3;

void setup() {
  fullScreen();
  //size(900,600);
  stroke(#BF6D08);
  fill(#BF6D08);
  textSize(height*1.0/900*50);
  //textFont();
  
  frameRate(10);
}

void draw() {
  background(0, 0, 50);
  
  strokeWeight(3);
  line(0.95*width,0.95*height, 0.05*width, 0.95*height);
  strokeWeight(10);
  
  if(check(frameCount) == false){
   println("Kackidee, geht nicht bei "+frameCount);
   exit(); 
  }
  sum_at_y.add(y.size());
  if (y.size() > max) max = y.size();
  float dy = 1.0/max;
  float dx = 1.0/sum_at_y.size();

  float hgt = 0.9*height;
  float wdt = 0.9*width;

  text("count: "+sum_at_y.size(), 0.05*width, 3*0.05*height);
  text("bills:   "+max, 0.05*width, 4*0.05*height);
  text("ratio:  "+max*1.0/sum_at_y.size(), 0.05*width, 2*0.05*height);
  text("k:      "+k, 0.05*width, 5*0.05*height);

  // flip to mathe system
  scale(1, -1);
  translate(0, -height);
  
  int skip = ceil(sum_at_y.size()*1.0/200);
  translate(0.05*width, 0.05*height);
  for (int i=0; i<frameCount; i += skip) {
    pushMatrix();
    translate(0, sum_at_y.get(i)*hgt*dy);
    point(0, 0);
    popMatrix();
    translate(skip*wdt*dx, 0);
  }
}

// i = maximale Zahl der Scheine
// sum_of_cash = aktuelle Geldsumme
// to_reach = zu erreichende Geldsumme
boolean rec_ranz(int i, int sum_of_cash, int to_reach){
  if(i > 0){
    if(sum_of_cash == to_reach) return true;
    for(int j=0; j<y.size(); j++){
      if(rec_ranz(i-1, sum_of_cash+y.get(j), to_reach)) return true;
    }
    return false;
  }
  else{
    if(sum_of_cash == to_reach) return true;
    else return false;
  }
}