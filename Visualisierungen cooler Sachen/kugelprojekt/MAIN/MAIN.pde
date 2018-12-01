void setup() {
  // Tiefenrendering
  hint(ENABLE_DEPTH_TEST);
  hint(ENABLE_DEPTH_SORT);

  // GUI
  currWidth = width;
  currHeight = height;
  size(900, 600, P3D);
  surface.setResizable(true);
  background(0);
  stroke(155);
  strokeWeight(1);
  noStroke();

  // Camera
  cam= new PeasyCam(this, 0, 0, 0, 700);
  cam.setSuppressRollRotationMode();

  // Point- and Line Array
  // Qubit(r, phi, tht)
  // PHYSICS-style: phi is azimuthal
    //list.add(new Qubit(0,acos(1f/3)));
    //list.add(new Qubit(4*PI/3, acos(1f/3)));
    //list.add(new Qubit(0, acos(1f/3)));
    //list.add(new Qubit(2*PI/3, acos(1f/3)));
    //list.add(new Qubit(0, HALF_PI));
    //list.add(new Qubit(0, HALF_PI));
    list.add(new Qubit(1, 0, HALF_PI));
    list.add(new Qubit(1, 0, (PI/4)));


  // Tablepreparations
  outcomes = new float[int(pow(2, list.size()))];
}

void draw() {
  windowResizedUpdate();
  if (outputtype==0) drawSphere();
  if (outputtype==1) drawChart();
}