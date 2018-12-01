/**
 * family of 2 methods to calculate a matrixproduct of arbitrary many reglemented matrices with an 1d matrix
 * matrix_mult parts the p*q*r matrix to p q*r marices and gives two of one and the return of the last matrix_mult_2 to matrix_mult_2
 * matrix_mult_2 multiplies a reglemented 2d matrix with an 1d matrix
 **/
// main method
// convertes the one big 3d Array to many 2d arrays
// then it multiplies all of them with the qubitstate
Qubits matrix_mult(Qubits qubits, c[][][] kgates) {
  for (int i=0; i<kgates.length; i++) {
    qubits = matrix_mult_2(qubits, kgates[i]);
  }
  return qubits;
}

// calculating method
// calculates the matrixproduct of two 2d matrices of reglemented sizes
Qubits matrix_mult_2(Qubits qubits, c[][] kgate) {
  c[] q = qubits.getArray();
  c[] out = new c[q.length];
  // tests if the matrices are multiplicateable
  if (q.length == kgate[0].length) {
    int l = 1;                           // width of first matrix
    int m = kgate.length;                // height of the second array
    int n = kgate[0].length;             // width of the second array and height of the first array

    for (int _l=0; _l<l; _l++) {         // redundant, but for better understanding
      for (int _m=0; _m<m; _m++) {
        c partSum = new c(0, 0);
        for (int _n=0; _n<n; _n++) {
          partSum = partSum.sum(q[_n].product(kgate[_m][_n]));
        }
        out[_m] = partSum;
      }
    }

    qubits.update(out);
    return qubits;
  } else {
    System.out.println("Error in matrix multiplication! The given matrices are not multiplicateable!");
    return qubits;
  }
}