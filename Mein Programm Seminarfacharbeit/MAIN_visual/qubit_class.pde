/**
 * Creates the qubitstartstate and contains all the qubitstates that get calculated
 * works only for positive sizes
 **/
class Qubits {
  c[] states;
  int size;
  int pow2;

  // constructs a qubitstate with every qubit in the |0> position
  Qubits(int size) {
    this.size=size;
    pow2 = (int) pow(2, size);
    states = new c[pow2];
    for (int i=0; i<pow2; i++) {
      states[i] = new c(0, 0);
    }
    states[0].update(1, 0);
  }

  // sets the Qubitstate on request
  void update(c[] a) {
    states=a;
  }

  // returns the qubitstate on request
  // unused
  c[] getArray() {
    return states;
  }

  // returns the qubitstate with every entry as the complex conjugate product of the original entry
  float[] getProbabilities() {
    float[] output = new float[pow2];
    for (int i=0; i<pow2; i++) {
      output[i] = states[i].float_complex_conjugate_square();
    }
    return output;
  }

  // prints the qubitstateamplitude
  // unused
  void printAmplitudes() {
    for (int i=0; i<pow2; i++) {
      System.out.println(states[i].print());
    }
  }

  // prints the qubitstate with every entry as the complex conjugate product of the original entry to console
  // IMPORTANT: it rounds the probabilities to 3 decimal places to get rid of 99.999999999% for example
  void printProbabilities() {
    float[][] output = new float[pow2][2];
    for (int i=0; i<pow2; i++) {
      output[i][0] = states[i].float_complex_conjugate_square();
      output[i][1] = Integer.parseInt(binary(i));

      // code for filling in the zeroes before the first one and converting the float to an int
      int fill0 = (int) pow(10, size);
      int with1 = fill0+(int) output[i][1];
      String withS1 = Integer.toString(with1);
      String no1 = withS1.substring(1);

      // code for rounding a number to 3 decimal places
      float times100000 = output[i][0] * 100000;
      int round100000 = round(times100000);
      float roundNormal = round100000 / 1000.0;

      System.out.println("|"+no1+"> : "+roundNormal+"%");
    }
  }
}