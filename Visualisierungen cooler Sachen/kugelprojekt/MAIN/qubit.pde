// azimuthal angle :    phi
// polar angle :        theta / tht
// radius, constant :   r = 200+

class Qubit {
  float phi;
  float tht;
  float r;
  float paintr;
  float x;
  float y;
  float z;

  Qubit(float r, float phi, float tht) { // Point
    this.phi=phi;
    this.tht=tht;
    this.r=r;
    this.paintr=r*200;
  }

  float zProbability() {
    return sqr(sin(tht/2));
  }

  // optional
  void increment(float radphi, float radtht) {
    phi+=radphi;
    tht+=radtht;
  }

  void paint() {
    x=paintr*sin(tht)*cos(phi);
    y=paintr*sin(tht)*sin(phi);
    z=paintr*cos(tht);

    strokeWeight(2); 
    stroke(0);
    line(0f, 0f, 0f, x, y, z);
    strokeWeight(10); 
    stroke(255, 0, 0);
    point(x, y, z);
    strokeWeight(1); 
    stroke(255);
    noStroke();
  }
}