/**
 * This Class stores the Qubitscore_timesteps, whitch make up the whole Qubitscore.
 * It is used for determining the endqubitposition.
 **/
class Qubitscore {
  // Saves every QS_timestep instances in one Array.
  // separation because of the different requirements of the C-Not and normal gates 
  Qubitscore_timestep[] steps;

  // The constructor creates instances of Qubitscore_timestep in every part of the array.
  Qubitscore() {
    steps = new Qubitscore_timestep[SCORELENGTH];
    for (int i=0; i<steps.length; i++) {
      steps[i] = new Qubitscore_timestep();
    }
  }

  // Theese methods get, put and remove gates.
  // It is outsourced to Qubitscore_timestep.
  void put_other(c[][] gatematrix, int qubit_number, int timestep) {
    steps[timestep].put_other(gatematrix, qubit_number);
  }
  void put_cnot(int control_qubit, int target_qubit, int timestep) {
    steps[timestep].put_cnot(control_qubit, target_qubit);
  }
  void remove_other(int qubit_number, int timestep) {
    steps[timestep].remove_other(qubit_number);
  }
  void remove_cnot(int timestep) {
    steps[timestep].remove_cnot();
  }
  c[][] get_other(int qubit_number, int timestep) {
    return steps[timestep].get_other(qubit_number);
  }
  c[][] get_cnot(int timestep) {
    return steps[timestep].get_cnot();
  }
  int get_cnot_controlqubit(int timestep) {
    return steps[timestep].get_cnot_control();
  }
  int get_cnot_targetqubit(int timestep) {
    return steps[timestep].get_cnot_target();
  }
  String size() {
    return steps.length + " x " + steps[0].size();
  }

  // Theese methods determin if a gate is placed at specific coordinates.
  // It is outsourced to Qubitscore_timestep.
  boolean can_insert_cnot(int timestep) {
    return steps[timestep].can_insert_cnot();
  }
  boolean can_insert_other(int qubit_number, int timestep) {
    return steps[timestep].can_insert_other(qubit_number);
  }
  boolean has_cnot(int timestep) {
    return steps[timestep].stores_cnot();
  }
  boolean has_other(int qubit_number, int timestep) {
    return steps[timestep].has_other(qubit_number);
  }
}

/**
 * This Class stores gates, which make up the whole Qubitscore_timestep.
 * It differentiates between an array of normal gates, or a single C-Not gate.
 **/
class Qubitscore_timestep {
  // Stats of the possibility of saving a C-Not gate or other gates
  boolean cnot_stored = false; 
  boolean other_stored = false; 
  int count_other = 0;
  // reserved spaces for either one of them
  gate[] parallel = new gate[SCOREWIDTH];
  gate cnot; 
  int from; 
  int to;

  // The constructor creates instances of a placeholdergate in every part of the array.
  Qubitscore_timestep() {
    for (int i=0; i<parallel.length; i++) {
      parallel[i] = new gate();
    }
  }

  // Theese methods determine, which type of gate can be saved or is stored.
  // returns the possibility of saving a C-Not gate or another gate in this timestep
  boolean can_insert_cnot() {
    if (this.stores_cnot()==false) return !other_stored;
    else return false;
  }
  boolean can_insert_other(int qubit_number) {
    if (cnot_stored == true) {
      return false;
    } else {
      return (!parallel[qubit_number].isUsed());
    }
  }
  boolean has_other(int qubit_number) {
    if (cnot_stored == true) {
      return false;
    } else {
      return (parallel[qubit_number].isUsed());
    }
  }
  boolean stores_cnot() {
    return cnot_stored;
  }
  int get_cnot_control() {
    return from;
  }
  int get_cnot_target() {
    return to;
  }

  // theese methods put gates in this storage and detrmine the type of this storage
  void put_other(c[][] gatematrix, int qubit_number) {
    if (cnot_stored == false) {
      other_stored = true;
      parallel[qubit_number] = new gate(gatematrix, false);
      count_other++;
    } else System.out.println("Putting a normal gate in this storage is not possible, it already contains a C-Not gate");
  }
  void put_cnot(int control_qubit, int target_qubit) {
    if (other_stored == false) {
      cnot_stored = true;
      cnot = new gate(g.cnot(SCOREWIDTH, control_qubit, target_qubit), true);
      from = control_qubit;
      to = target_qubit;
    } else System.out.println("Putting a C-Not gate in this storage is not possible, it already contains a normal gate");
  }

  // theese methods remove gates from the storage
  void remove_other(int qubit_number) {
    if (other_stored == true) {
      if (count_other == 1) other_stored = false;
      parallel[qubit_number] = new gate();
      count_other--;
    } else System.out.println("You can't remove a nonexisting normal gate. (Or this contains a C-Not gate.)");
  }
  void remove_cnot() {
    if (cnot_stored == true) {
      cnot_stored = false;
      cnot = new gate();
      from = -1;
      to = -1;
    } else System.out.println("You can't remove a nonexisting C-Not gate. (Or this contains a normal gate.)");
  }

  // theese methods get gates from the storage
  c[][] get_other(int qubit_number) {
    if (cnot_stored == false) {
      return parallel[qubit_number].getArray();
    } else {
      System.out.println("error");
      return new c[0][0];
    }
  }
  c[][] get_cnot() {
    if (cnot_stored == true) {
      return cnot.getArray();
    } else {
      System.out.println("error");
      return new c[0][0];
    }
  }
  int size() {
    return parallel.length;
  }
}