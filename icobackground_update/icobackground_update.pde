void setup() {
  fullScreen(P3D);
  //hint(ENABLE_DEPTH_SORT);
  float cameraZ = ((height/2.0) / tan(PI*60.0/360.0));
  perspective(PI/3.0, 16f/9, cameraZ/100.0, cameraZ*10.0);
  cam = new PeasyCam(this, 75);
  cam.setMinimumDistance(5);
  cam.setMaximumDistance(500);
  
  for(int i=0; i<spheres.length; i++){
    spheres[i] = new icosphere();
    setter(spheres[i]);
  }
}

void draw() {

  background(10);
  lights();
  noStroke();
  for(int i=0; i<spheres.length; i++){
    float v = 10;
    if(i==0) fill(0,255,0);
    else{
      fill(0,0,255,150);
     // v *= 1.01 - (i-1f)/(2*spheres.length); 
    }
    pushMatrix();
    //translate(0,0,i*10);
    for (face f : spheres[i].fcs) {
      beginShape(TRIANGLES);
      vertex(v*f.vert[0].x, v*f.vert[0].y, v*f.vert[0].z);
      vertex(v*f.vert[1].x, v*f.vert[1].y, v*f.vert[1].z);
      vertex(v*f.vert[2].x, v*f.vert[2].y, v*f.vert[2].z);
      endShape();
      
      //stroke(255, 0, 0);
      //strokeWeight(2);
      //point(v*f.vert[0].x, v*f.vert[0].y, v*f.vert[0].z);
      //point(v*f.vert[1].x, v*f.vert[1].y, v*f.vert[1].z);
      //point(v*f.vert[2].x, v*f.vert[2].y, v*f.vert[2].z);
      //noStroke();
    }
    popMatrix();
  }
}
