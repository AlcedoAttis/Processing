// The signum of a given Number
int sign(int x) {
  if (x>0) return 1;
  if (x<0) return 1;
  return 0;
}

// Draws an Arrow
void drawArrow(int x1, int x2, int y1, int y2, int z1, int z2) {
  stroke(128+128*sign(x2-x1), 128+128*sign(y2-y1), 128+128*sign(z2-z1), 255);
  line(x1, y1, z1, x2, y2, z2);
  strokeWeight(10);
  point(x2, y2, z2);
  strokeWeight(1);  
  noStroke();
}

// squares, duh
float sqr(float x) {
  return x*x;
}

// creates a sorted part-probabilitylist of the Qubitstates
// sorted in a way, that the first inserted Qubit has the most value
// e.g. Qubits a,b in this Order --> Outputorientation a0b0, a0b1, a1b0, a1b1
void outcomes_update() {
  // the probabilities of the parts are (luckily) the products of all the involved qubits and the inverse probability of the uninvolved ones
  // so binary listing is needed

  for (int i=0; i<outcomes.length; i++) { // 0 to 2^list.size
    float probability=1;
    int power_of_two = 0;
    int ocfl=outcomes.length/2; // outcomes-flexible
    int ifl = i;                // i-flexible
    while (ocfl>=1) {
      if (ifl-ocfl<0) { // 0
        probability*=(1-list.get(power_of_two).zProbability());
        ocfl=ocfl/2;
        power_of_two++;
      } else {           // 1
        probability*=(list.get(power_of_two).zProbability());
        ifl=ifl-ocfl;
        ocfl=ocfl/2;
        power_of_two++;
      }
    }
    //System.out.println();
    outcomes[i]=probability;
  }
}

// draws the lines for the additional information of the linegraph
void textinformation(float max_height, float coefficient) {
  textSize(32);
  fill(255);
  stroke(200);
  int lw = (int)(width*(4.0/5));
  
  line(-50, (height/1.5+10000/height), lw+50, (height/1.5+10000/height));
  pushMatrix();
  scale(1, -1);
  text(max_height*100+"%", -50, -(height/1.5+10000/height));
  popMatrix();
  
  line(-50, coefficient, lw+50, coefficient);
  pushMatrix();
  scale(1, -1);
  text("100%", -50, -coefficient);
  popMatrix();
  
  line(-50, 0, lw+50, 0);
  pushMatrix();
  scale(1, -1);
  text("0%", -50, 0);
  popMatrix();
}

void lII(int start, int stop, int number, float size, int inversetextthickness){
  float sz = (220/inversetextthickness)*width/900*sqrt(outcomes.length/32.0);
  if(outcomes.length==8) sz=sz*1.5;
  if(outcomes.length==16) sz=sz*1.25;
    textSize(sz);
  fill(255);
  pushMatrix();
  scale(1, -1);
  String sn = binary(number,list.size());
    text(" "+sn, start, (sz));
    text(size, start, (2*sz));
  popMatrix();
}