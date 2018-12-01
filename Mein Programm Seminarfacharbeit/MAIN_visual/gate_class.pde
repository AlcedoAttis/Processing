/**
 * contains all the gates
 * creation of the CNOT is outsourced
 * instead cnot gives an array back that tells the system that a C-Not gate is needed
 **/
class Gates {
  float v = 1.0/sqrt(2);
  c[][] i;
  c[][] x;
  c[][] y;
  c[][] z;
  c[][] h;
  c[][] s;
  c[][] sd;
  c[][] t;
  c[][] td;
  c[][] cnot;

  // Constructs every gate
  Gates() {
    //Identity
    this.i = new c[][] {
      {new c(1, 0), new c(0, 0)}, 
      {new c(0, 0), new c(1, 0)}};
    //Bitflip
    this.x = new c[][] {
      {new c(0, 0), new c(1, 0)}, 
      {new c(1, 0), new c(0, 0)}};
    // Phase&Bitflip
    this.y = new c[][] {
      {new c(0, 0), new c(0, -1)}, 
      {new c(0, 1), new c(0, 0)}};
    // Phaseflip
    this.z = new c[][] {
      {new c(1, 0), new c(0, 0)}, 
      {new c(0, 0), new c(-1, 0)}}; 
    // Hadamard
    this.h = new c[][] {
      {new c(v, 0), new c(v, 0)}, 
      {new c(v, 0), new c(-v, 0)}};
    // Pauli
    this.s = new c[][] {
      {new c(1, 0), new c(0, 0)}, 
      {new c(0, 0), new c(0, 1)}};
    // Pauli dagger
    this.sd = new c[][] {
      {new c(1, 0), new c(0, 0)}, 
      {new c(0, 0), new c(0, -1)}};
    // Troffioli
    this.t = new c[][] {
      {new c(1, 0), new c(0, 0)}, 
      {new c(0, 0), new c(v, v)}};
    // Troffioli dagger
    this.td = new c[][] {
      {new c(1, 0), new c(0, 0)}, 
      {new c(0, 0), new c(-v, -v)}};
  }

  // all of theese return their gate counterpart
  c[][] i() {
    return i;
  }
  c[][] x() {
    return x;
  }
  c[][] y() {
    return y;
  }
  c[][] z() {
    return z;
  }
  c[][] h() {
    return h;
  }
  c[][] s() {
    return s;
  }
  c[][] sd() {
    return sd;
  }
  c[][] t() {
    return t;
  }
  c[][] td() {
    return td;
  }
  c[][] cnot(int e, int c, int t) {
    return cnot_builder(e, c, t);
  }
}

/**
 * saves a single quantum gate
 * e.g.: gate x = new gate(g.cnot(SCOREWIDTH, 0, 2), true); saves a specific C-Not gate.
 * Also saves if the gate is a CNOT gate.
 **/
class gate {
  c[][] storage;
  boolean isCnot;
  boolean isUsed;

  // Double Costructor
  // You may only call this method with gate(*GATESCLASS*.*GATE*,true/false);. e.g: gate(g.t,false);
  gate(c[][] in, boolean isCnot) {
    this.storage = in;
    this.isCnot = isCnot;
    this.isUsed = true;
  }
  // If no parameter is given, gate{} is marked as unused
  gate() {
    this.storage = g.i();
    this.isUsed = false;
  }
  // Theese methods return the saved data in the class-instance
  c[][] getArray() {
    return storage;
  }
  boolean cnot() {
    return isCnot;
  }
  boolean isUsed() {
    return isUsed;
  }
}