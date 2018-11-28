import peasy.*;
PeasyCam cam;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 600);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1000);
  
  int[][][] array = block_baum(20);
  
  for(int a=0; a<array.length; a++){
    for(int b=0; b<array[0].length; b++){
      for(int c=0; c<array[0][0].length; c++){
        System.out.print(array[b][c][a]+",");
      }
      System.out.println();
    }
    System.out.println();
  }
}

void draw() {
  background(255);
}