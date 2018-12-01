void setter(icosphere i) {
  
  // defining vertices
  i.pts.add(new pointc(-1, PHI, 0));
  i.pts.add(new pointc( 1, PHI, 0));
  i.pts.add(new pointc(-1, -PHI, 0));
  i.pts.add(new pointc( 1, -PHI, 0));

  i.pts.add(new pointc( 0, -1, PHI));
  i.pts.add(new pointc( 0, 1, PHI));
  i.pts.add(new pointc( 0, -1, -PHI));
  i.pts.add(new pointc( 0, 1, -PHI));

  i.pts.add(new pointc( PHI, 0, -1));
  i.pts.add(new pointc( PHI, 0, 1));
  i.pts.add(new pointc(-PHI, 0, -1));
  i.pts.add(new pointc(-PHI, 0, 1));

  // defining faces
  // 5 faces around point 0
  i.fcs.add(new face(i.pts, 0, 11, 5));
  i.fcs.add(new face(i.pts, 0, 5, 1));
  i.fcs.add(new face(i.pts, 0, 1, 7));
  i.fcs.add(new face(i.pts, 0, 7, 10));
  i.fcs.add(new face(i.pts, 0, 10, 11));

  // 5 adjacent faces
  i.fcs.add(new face(i.pts, 1, 5, 9));
  i.fcs.add(new face(i.pts, 5, 11, 4));
  i.fcs.add(new face(i.pts, 11, 10, 2));
  i.fcs.add(new face(i.pts, 10, 7, 6));
  i.fcs.add(new face(i.pts, 7, 1, 8));

  // 5 faces around point 3
  i.fcs.add(new face(i.pts, 3, 9, 4));
  i.fcs.add(new face(i.pts, 3, 4, 2));
  i.fcs.add(new face(i.pts, 3, 2, 6));
  i.fcs.add(new face(i.pts, 3, 6, 8));
  i.fcs.add(new face(i.pts, 3, 8, 9));

  // 5 adjacent faces
  i.fcs.add(new face(i.pts, 4, 9, 5));
  i.fcs.add(new face(i.pts, 2, 4, 11));
  i.fcs.add(new face(i.pts, 6, 2, 10));
  i.fcs.add(new face(i.pts, 8, 6, 7));
  i.fcs.add(new face(i.pts, 9, 8, 1));
}
