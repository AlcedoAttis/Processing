/**
 * Calculates a C-Not gate whitch is as big as the kroeneckerproduct of all the possible gates in one timeinstant
 * e controls the size, because it gives the number of qubits in the system
 * c and t describe the important qubits
 * only usefull for c!=t and e>c and e>t
 * IMPORTANT: c and t count from 0
 * TODO: fix the reverse code issue (not important)
 **/
c[][] cnot_builder(int e, int c, int t) {
  // entanglementsize, controlqubit, targetqubit

  // code hack
  // wrote code for other direction, so I need to reverse the qubits to obtain the right C-Not gate
  t=e-t-1;
  c=e-c-1;
  // builds two Arrays with the positions before and after the CNOT
  int p = (int) pow(2, e);     //positionscount
  int[][] sp = new int[p][e];  //superposition
  int[][] spa = new int[p][e]; //superposition after cnot

  // creates all the positions (binary count up)
  for (int i=0; i<p; i++) {
    int b = Integer.parseInt(binary(i));
    for (int j=0; j<e; j++) {
      sp[i][j] = b%10;
      b=b/10;
    }
  }

  // creates all the positions after the C-Not gate
  // same as the binary count up, but when the nuber at the magnitude of c is one, then the number at the magnitude of t will get reversed
  for (int i=0; i<p; i++) {
    spa[i] = sp[i].clone();
    if (sp[i][c]==1) {
      if (spa[i][t]==1) spa[i][t]=0;
      else if (spa[i][t]==0) spa[i][t]=1;
    }
  }

  // Creates and fills a third p by 2 array, which contains the position of every type of qubitposition in the sp array on the left column
  //  and the corresponding position of the same qubitposition in the spa array in the right column.
  // left collum in order!
  int[][] ones = new int[p][2]; 
  for (int i=0; i<p; i++) {
    for (int j=0; j<p; j++) {
      if (Arrays.equals(sp[i], spa[j])) {
        ones[i][0]=i; // redundant because of the orderedness of the left collumn, but good for better understanding
        ones[i][1]=j; // the position of the corresponding qubitposition
      }
    }
  }

  // builds the output CNOT matrix with the size of 2 to the power of e squared
  c[][] output = new c[p][p];
  for (int i=0; i<p; i++) {
    for (int j=0; j<p; j++) {
      output[i][j] = new c(0, 0);
    }
  }

  // sets the ones based on the "ones" array
  for (int i=0; i<p; i++) {
    output[ ones[i][0] ][ ones[i][1] ].update(1, 0);
  }

  return output;
}