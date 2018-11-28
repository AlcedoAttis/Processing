

enum Block {
  GRASS, STONE, NONE
}

Block[][][] makeBlocks() {
  int xdim = abs(lX - rX);
  int ydim = abs(lY - rY);
  int zdim = abs(lZ - rZ);
  
  Block[][][] res = new Block[xdim][ydim][zdim];
  
  for(int x = lX; x < rX; x++)
    for(int y = lY; y < rY; y++)
      for(int z = lZ; z < rZ; z++)
        if(z == floor(f(x, y)))
          res[x-lX][y-lY][z-lZ] = Block.GRASS;
         //else if(z < floor(f(x, y)))
         // res[x][y][z] = Block.STONE;
         else 
           res[x-lX][y-lY][z-lZ] = Block.NONE;
  
  return res;
  
}

float f(float x, float y) {
  return x+y;
}

void drawBlocks(Block[][][] scene) {
  rotateX(HALF_PI);
  pushMatrix();
  int xdim = abs(lX - rX);
  int ydim = abs(lY - rY);
  int zdim = abs(lZ - rZ);
  
  translate(SIZE*lX, SIZE*lY, SIZE*lZ);
  
  for(int x = lX; x < rX; x++) {
    for(int y = lY; y < rY; y++) {
      for(int z = lZ; z < rZ; z++) {
      
        switch(scene[x-lX][y-lY][z-lZ]) {
          case GRASS:
            fill(#00FF00); break;
          case STONE:
            fill(#A0A0A0); break;
           default: fill(255);
        }
        
        if(scene[x-lX][y-lY][z-lZ] != Block.NONE)
          box(SIZE);
        
        translate(0, 0, SIZE);
      }
      
      translate(0, SIZE, -zdim*SIZE);
    }
    
    translate(SIZE, -ydim*SIZE, 0);
  }
  
  popMatrix();
  
}
