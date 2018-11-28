void setup() {
  //hint(ENABLE_DEPTH_SORT);
  //frameRate(5);
  noStroke();
  fullScreen(P3D);
  //size(500,500,P3D);
  cam = new PeasyCam(this, 1.5*volume);
  cam.setMinimumDistance(1.2*volume);
  cam.setMaximumDistance(3*volume);
  cam.setSuppressRollRotationMode();
  
  /// varchanges siehe imports_and_globals
  v1 = v1 / detail;
  v2 = v2 * detail;
  v3 = v3 / 100;
  v4 = v4 / 100;
  ground = color(#68FA21);
  
  update();
}
 
void draw() {
  if(rotate==true){
    rc += 0.01;
  }
  rotateX(0.9); rotateZ(rc);
  translate(0,0,300);
  pointLight(255,230,10,volume/3,volume/2,volume/1.5);
  ambientLight(70,70,70);
  translate(-volume/2,-volume/2,-volume/2);
  background(0);
  
  for(int z=0; z<detail; z++){
    for(int x=0; x<detail; x++){
      for(int y=0; y<detail; y++){
        paintBlock(x,y,z,box[x][y][z],see[x][y][z]);
      }
    }
  }
  
  if(walk==true) update();
  //saveFrame("Frames/line-######.png");
  //System.out.println(frameRate);
  // damit kannste videos machen, voll cool :-)
}