/**
 * family of 2 methods to calculate a kroeneckerproduct of arbitrary many matrices
 * kroenecker_mult parts the p*q*r matrix to p q*r marices and gives two of them or one and the return of the kroenecker_2 to kroenecker_2
 * kroenecker_2 multiplies 2 arbitrary 2d matrices the kroenecker way
 **/
// main method
// convertes the one big 3d Array to a 2d and a smaller 3d Array
// if it produces two 2d Arrays the endcase is reached
c[][] kroenecker_mult(c[][][] input) {
  if (input.length==2) {
    return kroenecker_2(input[0], input[1]);
  } else {
    c[][] first = input[0];
    c[][][] rest = new c[input.length-1][][];
    for (int i=1; i<input.length; i++) {
      rest[i-1] = input[i];
    }
    return kroenecker_2(first, kroenecker_mult(rest));
  }
}

// calculating method
// calculates the kroeneckerproduct of two 2d matrices of arbitrary sizes
c[][] kroenecker_2(c[][] to, c[][] from) {
  int w_to = to[0].length;
  int h_to = to.length;
  int w_from = from[0].length;
  int h_from = from.length;

  c[][] output = new c[h_to*h_from][w_to*w_from];

  for (int i=0; i<h_to; i++) {    // Iterates over first Array
    for (int j=0; j<w_to; j++) {  //
      for (int k=0; k<h_from; k++) {    // Iterates over second Array
        for (int l=0; l<w_from; l++) {  //
          int y = i*h_from + k;
          int x = j*w_from + l;

          output[y][x] = to[i][j].product(from[k][l]);
        }
      }
    }
  }
  return output;
}