ArrayList<float[]> triangles;
float miniL = 20.0;
int n = 8;
int wdt; int hgt;

void setup(){
  fullScreen();
  frameRate(10);
  background(0);
  stroke(255);
  strokeWeight(1);
  noFill();
  wdt = width-1;
  hgt = height-1;
}

void draw(){
  if(frameCount % 100 == 1){
    newTriangles_generate();
    background(0);
    newTriangles_show();
  }
}

void newTriangles_generate(){
  triangles = new ArrayList<float[]>();
  float[][][] dots = new float[n+1][n+1][2];
  for(int x=0; x<=n; x++){
    for(int y=0; y<=n; y++){
      if(x==0 || x==n) dots[x][y][0] = x*wdt*1.0/n;
      else dots[x][y][0] = x*wdt*1.0/n+random(-wdt/(3*n),wdt/(3*n));
      if(y==0 || y==n) dots[x][y][1] = y*hgt*1.0/n;
      else dots[x][y][1] = y*hgt*1.0/n+random(-hgt/(3*n),hgt/(3*n));
    }
  }
  for(int x=0; x<n; x++){
    for(int y=0; y<n; y++){
      triangles.add(new float[]{dots[x][y][0],dots[x][y][1],dots[x+1][y][0],dots[x+1][y][1],dots[x][y+1][0],dots[x][y+1][1]});
      triangles.add(new float[]{dots[x+1][y+1][0],dots[x+1][y+1][1],dots[x+1][y][0],dots[x+1][y][1],dots[x][y+1][0],dots[x][y+1][1]});
    }
  }
}

void newTriangles_show(){
  for(float[] tri : triangles){
    drawTri_rec(tri);
  }
}

void drawTri_rec(float[] tri){
  beginShape();
    vertex(tri[0],tri[1]);
    vertex(tri[2],tri[3]);
    vertex(tri[4],tri[5]);
  endShape(CLOSE);
  
  // if all lengths are bigger than miniL
  if(sq(tri[0]-tri[2])+sq(tri[1]-tri[3])>sq(miniL) && sq(tri[2]-tri[4])+sq(tri[3]-tri[5])>sq(miniL) && sq(tri[4]-tri[0])+sq(tri[5]-tri[1])>sq(miniL)){
    float[] triN = new float[6];
    
    for(int i=0; i<6; i++){
      // relative distances
      float k = random(0.05,0.2); // put global
      triN[i] = (1-k)*tri[i]+k*tri[(i+2)%6];
    }
    
    //for(int i=0; i<3; i++){
    //  float distx = abs(tri[((2*i)+2)%6]-tri[(2*i)]);
    //  float disty = abs(tri[((2*i+1)+2)%6]-tri[(2*i+1)]);
    //  float facX = distx/(distx+disty);
    //  float facY = disty/(distx+disty);
      
    //  if(tri[((2*i)+2)%6] > tri[(2*i)]) triN[(2*i)]=tri[(2*i)]+miniL*facX;
    //  else triN[(2*i)]=tri[(2*i)]-miniL*facX;
    //  if(tri[((2*i+1)+2)%6] > tri[(2*i+1)]) triN[(2*i+1)]=tri[(2*i+1)]+miniL*facY;
    //  else triN[(2*i+1)]=tri[(2*i+1)]-miniL*facY;
      
    //}
    drawTri_rec(triN);
  }
}
