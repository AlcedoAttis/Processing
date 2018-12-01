import peasy.*;
PeasyCam cam;

final float PHI = (1.0 + sqrt(5.0)) / 2.0;
icosphere[] spheres = new icosphere[2]; //only in cojunction with depthsort

void keyPressed() {
  if (key == 'e') {
    // bigger world
    incr_gen(spheres[0]);
  }
  if (key == 'w') {
    // bigger water
    for(int i=1; i<spheres.length; i++){
      incr_gen(spheres[i]);
    }
  }
  if (key == 'd') {
    // distort world
    distort(spheres[0]);
  }
  if(key=='q'){
    try{
      exit();
    }
    catch(Exception e){}
  }
}

void incr_gen(icosphere i) { 
  ArrayList<face> n_fcs = new ArrayList<face>();
  for(face f : i.fcs){
    pointc a = f.vert[0];
    pointc b = f.vert[1];
    pointc c = f.vert[2];
    
    float str;
    float ds = sqrt(1+sq(PHI)); // defined stretch 
    //ds = ((sqrt(sq(a.x)+sq(a.y)+sq(a.z)))+(sqrt(sq(b.x)+sq(b.y)+sq(b.z))))/2f;
    pointc _ab = new pointc((a.x+b.x)/2.0, (a.y+b.y)/2.0, (a.z+b.z)/2.0);
    str = sqrt(sq(_ab.x)+sq(_ab.y)+sq(_ab.z));
    _ab.x = ds*_ab.x/str;
    _ab.y = ds*_ab.y/str;
    _ab.z = ds*_ab.z/str;
    //ds = ((sqrt(sq(a.x)+sq(a.y)+sq(a.z)))+(sqrt(sq(c.x)+sq(c.y)+sq(c.z))))/2f;
    pointc _ac = new pointc((a.x+c.x)/2.0, (a.y+c.y)/2.0, (a.z+c.z)/2.0);
    str = sqrt(sq(_ac.x)+sq(_ac.y)+sq(_ac.z));
    _ac.x = ds*_ac.x/str;
    _ac.y = ds*_ac.y/str;
    _ac.z = ds*_ac.z/str;
    //ds = ((sqrt(sq(c.x)+sq(c.y)+sq(c.z)))+(sqrt(sq(b.x)+sq(b.y)+sq(b.z))))/2f;e
    pointc _bc = new pointc((c.x+b.x)/2.0, (c.y+b.y)/2.0, (c.z+b.z)/2.0);
    str = sqrt(sq(_bc.x)+sq(_bc.y)+sq(_bc.z));
    _bc.x = ds*_bc.x/str;
    _bc.y = ds*_bc.y/str;
    _bc.z = ds*_bc.z/str;
    
    i.pts.add(_ab);
    i.pts.add(_ac);
    i.pts.add(_bc);
    
    n_fcs.add(new face(a,_ab,_ac));
    n_fcs.add(new face(c,_bc,_ac));
    n_fcs.add(new face(b,_ab,_bc));
    n_fcs.add(new face(_ab,_bc,_ac));
  }
  
  i.fcs = n_fcs;
}

void distort(icosphere i){
  float m = 1;
  for(pointc pt : i.pts){
    float mult = map(noise(m*pt.x+222,m*pt.y+111,m*pt.z+333),0,1,0.9,1.1); //additions for nonsymmetry
    pt.x = mult*pt.x;
    pt.y = mult*pt.y;
    pt.z = mult*pt.z;
  }
}
