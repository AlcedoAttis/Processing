int pixl[][];

int x0;
int y0;

void setup() {
  pixl = new int[width][height];
  size(640, 640, P2D); 
  stroke(255);
  noFill();
  ellipseMode(RADIUS);
  
  x0 = width/2;
  y0 = height/2;
  
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      if(sqrt(sqr(x-x0)+sqr(y-y0))<200){ 
        pixl[x][y]=1;
      }
    }
  }
}

void draw() {
  //translate(width/2,height/2);
  background(0);
  ellipse(x0,y0,205,205);
  
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      if(pixl[x][y]==1) point(x,y);
    }
  }
}

float sqr(float x){
  return x*x;
}