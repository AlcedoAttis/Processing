// Generation of an Icosahedron
// ----------------------------

void setter() {

  // defining vertices
  pts.add(new pointc(-1, PHI, 0));
  pts.add(new pointc( 1, PHI, 0));
  pts.add(new pointc(-1, -PHI, 0));
  pts.add(new pointc( 1, -PHI, 0));

  pts.add(new pointc( 0, -1, PHI));
  pts.add(new pointc( 0, 1, PHI));
  pts.add(new pointc( 0, -1, -PHI));
  pts.add(new pointc( 0, 1, -PHI));

  pts.add(new pointc( PHI, 0, -1));
  pts.add(new pointc( PHI, 0, 1));
  pts.add(new pointc(-PHI, 0, -1));
  pts.add(new pointc(-PHI, 0, 1));

  // defining faces
  // 5 faces around point 0
  fcs.add(new face(0, 11, 5));
  fcs.add(new face(0, 5, 1));
  fcs.add(new face(0, 1, 7));
  fcs.add(new face(0, 7, 10));
  fcs.add(new face(0, 10, 11));

  // 5 adjacent faces
  fcs.add(new face(1, 5, 9));
  fcs.add(new face(5, 11, 4));
  fcs.add(new face(11, 10, 2));
  fcs.add(new face(10, 7, 6));
  fcs.add(new face(7, 1, 8));

  // 5 faces around point 3
  fcs.add(new face(3, 9, 4));
  fcs.add(new face(3, 4, 2));
  fcs.add(new face(3, 2, 6));
  fcs.add(new face(3, 6, 8));
  fcs.add(new face(3, 8, 9));

  // 5 adjacent faces
  fcs.add(new face(4, 9, 5));
  fcs.add(new face(2, 4, 11));
  fcs.add(new face(6, 2, 10));
  fcs.add(new face(8, 6, 7));
  fcs.add(new face(9, 8, 1));
}

void incr_gen() { 
  ArrayList<face> n_fcs = new ArrayList<face>();
  for(face f : fcs){
    pointc a = f.vert[0];
    pointc b = f.vert[1];
    pointc c = f.vert[2];
    
    float str;
    pointc _ab = new pointc((a.x+b.x)/2.0, (a.y+b.y)/2.0, (a.z+b.z)/2.0);
    str = sqrt(sq(_ab.x)+sq(_ab.y)+sq(_ab.z));
    _ab.x = sqrt(1+sq(PHI))*_ab.x/str;
    _ab.y = sqrt(1+sq(PHI))*_ab.y/str;
    _ab.z = sqrt(1+sq(PHI))*_ab.z/str;
    pointc _ac = new pointc((a.x+c.x)/2.0, (a.y+c.y)/2.0, (a.z+c.z)/2.0);
    str = sqrt(sq(_ac.x)+sq(_ac.y)+sq(_ac.z));
    _ac.x = sqrt(1+sq(PHI))*_ac.x/str;
    _ac.y = sqrt(1+sq(PHI))*_ac.y/str;
    _ac.z = sqrt(1+sq(PHI))*_ac.z/str;
    pointc _bc = new pointc((c.x+b.x)/2.0, (c.y+b.y)/2.0, (c.z+b.z)/2.0);
    str = sqrt(sq(_bc.x)+sq(_bc.y)+sq(_bc.z));
    _bc.x = sqrt(1+sq(PHI))*_bc.x/str;
    _bc.y = sqrt(1+sq(PHI))*_bc.y/str;
    _bc.z = sqrt(1+sq(PHI))*_bc.z/str;
    
    pts.add(_ab);
    pts.add(_ac);
    pts.add(_bc);
    
    int aa = f.ind[0];
    int bb = f.ind[1];
    int cc = f.ind[2];
    
    int ab = pts.size()-3;
    int ac = pts.size()-2;
    int bc = pts.size()-1;
    
    n_fcs.add(new face(aa,ab,ac));
    n_fcs.add(new face(cc,bc,ac));
    n_fcs.add(new face(bb,ab,bc));
    n_fcs.add(new face(ab,bc,ac));
  }
  
  fcs = n_fcs;
  //System.out.println(a.get(0));
  
}