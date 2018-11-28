int[][][] block_baum (int size) {
  int[][][] out = new int[size][size][size];
  
  for(int h=0; h<size; h++){
    // trunk
    float rand = random(-h/3f,h/3f);
    float rad = map(h+rand,0,size,size/15f,-size/30f);
    out = sph(size/2f,size/2f,h,rad,42,out);
  }
  
  for(int h=0; h<size; h=h+size/8){
    // leaves
    if(h>2){
      for(int trys=0; trys<3; trys++){
        float xdiff = map(random(1),0,1,-(size-h)/8f,(size-h)/8f);
        float ydiff = map(random(1),0,1,-(size-h)/8f,(size-h)/8f);
        float rad = (size-h/1.8)/10f*random(0.6,1.4);
        out = sph(size/2f+xdiff,size/2f+ydiff,h,rad,41,out);
      }
    }
  }
  return out;
}


// color 41 = baumgrün
// color 42 = baumbraun
int[][][] sph(float x, float y, float z, float r,int col, int[][][] array) {
  if(r>0){
  for(int a=0; a<array.length; a++){
  for(int b=0; b<array[0].length; b++){
  for(int c=0; c<array[0][0].length; c++){
    float dist = sqrt(sq(a-x)+sq(b-y)+sq(c-z));
    if(dist<r) array[a][b][c]=col;
  }}}}
  
  return array;
}