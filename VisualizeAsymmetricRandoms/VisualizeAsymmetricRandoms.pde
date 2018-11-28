int z  = 100000;
float towers[] = new float[z];
float e = 2.7182818284590452353602874;
double avr=0;

void setup(){
  size(600,600,P2D);
  
  for(int i=0;i<z;i++){
    //towers[i]=random(0,600);                                                  // 300  |---------|
    //towers[i] = random(0,sqrt(600))*random(0,sqrt(600));                      // 150  |***---...|
    //towers[i]=random(0,random(0,(600)));                                      // 150  |***---...|
    //towers[i]=-1; while(towers[i]<0){towers[i]=random(0,600)-random(0,300);}  // 233.3|*******-.|
    //towers[i]=-1; while(towers[i]<0){towers[i]=random(0,600)-600+random(0,random(0,(600)));}  // 133.33 |**---....|
    //towers[i]=random(0,600)*random(0,1);                                      // 150 |***---...|
    //towers[i]=random(0,600)*random(0,1)*random(0,1);                          // 75 |*--,......|
    float x=random(0,600); towers[i]=((x*x/600)*(x*x/600)/600)*((x*x/600)*(x*x/600)/600)/600; // 66
  }
  
  stroke(255);
  
  background(0);
  
  for(int i=0;i<z;i=i+2){
    point(towers[i],towers[i+1]);
    avr+=towers[i]+towers[i+1];
  }
  
  System.out.println(avr/z);
}

void draw(){
  
}