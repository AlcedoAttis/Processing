// is a point
class pointc {
  float x;
  float y;
  float z;
  
  pointc(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
}

// is a face
class face {
  pointc[] vert = new pointc[3];
  int[] ind = new int[3];
  
  face(int a, int b, int c){
    vert[0] = pts.get(a);
    vert[1] = pts.get(b);
    vert[2] = pts.get(c);
    
    ind[0] = a;
    ind[1] = b;
    ind[2] = c;
  }
}