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
  
  face(ArrayList<pointc> pts, int a, int b, int c){
    vert[0] = pts.get(a);
    vert[1] = pts.get(b);
    vert[2] = pts.get(c);
  }
  
  face(pointc a, pointc b, pointc c){
    vert[0] = a;
    vert[1] = b;
    vert[2] = c;
  }
}

// is an icosphere
class icosphere {
  ArrayList<pointc> pts;
  ArrayList<face> fcs;
  
  icosphere(){
    pts = new ArrayList<pointc>();
    fcs = new ArrayList<face>();
  }
}
