import java.util.Arrays;

// The program is totaly ok with changing theese values als long as the scorewidth is bigger than 1 !!!
// But the visualisation depends on these values and will go haywire when you change them, so only change the values when you use the program internally
int SCORELENGTH = 10;  // Timesteps
int SCOREWIDTH = 3;   // Qubitcount
// initializes main classes
Qubits q;
Gates g = new Gates();

/**
 * This Method needs a Qubitscore as an input and uses it on an new Instance of Qubits.
 * It uses SCOREWIDTH and SCOREHEIGHT as global parameters to determine the length and breadth of its action on the Qubits
 * It returns the probability for every quantum position
 **/
float[] state_calculator() {

  // infuses the score with all the needed gates
  Qubitscore qscore = e.getData();

  // calculates the kroeneckerproduct of every timestep and saves it
  c[][][] after_kroenecker = new c[SCORELENGTH][(int) pow(2, SCOREWIDTH)][(int) pow(2, SCOREWIDTH)];
  for (int i=0; i<SCORELENGTH; i++) {
    // special case of a C-Not gate
    // can just copy
    if (qscore.has_cnot(i) == true) {
      after_kroenecker[i] = qscore.get_cnot(i);
    }
    // normal case of an arrangement of gates
    // can copy the kroeneckerproduct
    else {
      c[][][] normal_gates = new c[SCOREWIDTH][][];
      for (int j=0; j<normal_gates.length; j++) {
        normal_gates[j] = qscore.get_other(j, i);
      }
      after_kroenecker[i] = kroenecker_mult(normal_gates);
    }
  }
  // calculates the matrixproduct of the Qubitstate and all of the matrices
  Qubits after_product = new Qubits(SCOREWIDTH);
  after_product = matrix_mult(q, after_kroenecker);

  // outputs the probabilities of the qubitpositions
  //after_product.printProbabilities();

  //returns the endresult
  return after_product.getProbabilities();
}