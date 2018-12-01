import peasy.*;
PeasyCam cam;
PVector[][] globe;
int r =200;
int detail=50;

void setup() {
  size(600, 600, P3D);
  cam= new PeasyCam(this, 200);

  globe = new PVector[detail+1][detail+1];
}

void draw() {
  background(0);
  fill(255);
  directionalLight(255,255,255,0,0,1);
  directionalLight(255,255,255,0,0,-1);
  directionalLight(255,000,255,0,1,-1);
  //noFill();
  noStroke();
  //translate(width/2, height/2);


  for (int i=0; i<detail+1; i++) {
    float latitude = map(i, 0, detail, -HALF_PI, HALF_PI);
    for (int j=0; j<detail+1; j++) {
      float longtitude = map(j, 0, detail, -PI, PI);
      float x = r*sin(longtitude)*cos(latitude);
      float y = r*sin(longtitude)*sin(latitude);
      float z = r*cos(longtitude);
      globe[i][j] = new PVector(x, y, z);
    }
  }

  for (int i=0; i<detail; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j=0; j<detail+1; j++) {
      PVector v = globe[i][j];
      //strokeWeight(2);
      //stroke(0,255,0);
      vertex(v.x,v.y,v.z);
      PVector w = globe[i+1][j];
      vertex(w.x,w.y,w.z);
    }
    endShape();
  }
}


/*
for (int i=0; i<detail; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j=0; j<detail+1; j++) {
      PVector v = globe[i][j];
      //strokeWeight(2);
      //stroke(0,255,0);
      vertex(v.x,v.y,v.z);
      PVector w = globe[i+1][j];
      vertex(w.x,w.y,w.z);
    }
    endShape();
  }
*/