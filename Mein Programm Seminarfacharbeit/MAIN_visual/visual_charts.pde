/**
 * draws a barchart with all the poosible qubitpositions
 * writes the positions under the bars
 **/
void drawBarchart(float[] in) {
  // sets all the needed constants
  background(50);
  strokeWeight(1);
  int horizontal_space = CURR_WIDTH/8;
  int text_space = CURR_HEIGHT/6;
  int vertical_space = CURR_HEIGHT/8;
  translate(0, CURR_HEIGHT);                               // set the coordinate sytem to the bottom left corner
  translate(horizontal_space, -text_space-vertical_space);  // translate the canvas according to the speces
  int max_x = CURR_WIDTH-2*horizontal_space;
  int max_y = CURR_HEIGHT-text_space-2*vertical_space; // maximum absolute y
  int count = in.length;
  float thickness = 1.0*max_x/count;

  // searches the biggest probability
  float max_prob = 0;
  for (int i=0; i<count; i++) {
    if (max_prob < in[i]) max_prob = in[i];
  }

  // draws the barchart
  stroke(200);
  pushMatrix();
  for (int i=0; i<count; i++) {
    float bar_height = in[i] * max_y/max_prob;
    fill(map(in[i], 0, 1, 60, 255));
    rect(0, 0, thickness-5, -bar_height);
    fill(180);
    textSize(thickness/6);
    text("|"+binary(i, SCOREWIDTH)+">", 0, thickness*1.1/6);
    textSize(thickness/3.5);
    text(round(in[i]*100000)/1000.0+"%", 0, thickness*1.1/2.4);
    translate(thickness, 0);
  }
  popMatrix();

  // draws the percentagelines
  stroke(108, 100);
  fill(222, 100);
  textAlign(LEFT);
  textSize(CURR_WIDTH/32);
  line(-horizontal_space*2/3, -max_y/(max_prob), max_x+horizontal_space/2, -max_y/(max_prob));                 // 100%
  text("100%", -horizontal_space*2/3, -max_y/(max_prob)-3);
  line(-horizontal_space*2/3, -max_y/(max_prob*1.33333), max_x+horizontal_space/2, -max_y/(max_prob*1.33333)); // 75%
  text("75%", -horizontal_space*2/3, -max_y/(max_prob*1.33333)-3);
  line(-horizontal_space*2/3, -max_y/(max_prob*2.0), max_x+horizontal_space/2, -max_y/(max_prob*2.0));         // 50%
  text("50%", -horizontal_space*2/3, -max_y/(max_prob*2.0)-3);
  line(-horizontal_space*2/3, -max_y/(max_prob*4.0), max_x+horizontal_space/2, -max_y/(max_prob*4.0));         // 25%
  text("25%", -horizontal_space*2/3, -max_y/(max_prob*4.0)-3);
}

/**
 * draws as many twotype charts as there are qubits
 * every twotype chart visualises the chance of the two possible measurements of the qubit
 **/
void drawQubitchart(float[] in) {
  // sets all the needed constants
  background(50);
  int horizontal_space = CURR_WIDTH/8;
  int text_space = CURR_HEIGHT/6;
  int vertical_space = CURR_HEIGHT/8;
  translate(0, CURR_HEIGHT);                               // set the coordinate sytem to the bottom left corner
  translate(horizontal_space, -text_space-vertical_space);  // translate the canvas according to the speces
  int max_x = CURR_WIDTH-2*horizontal_space;
  int max_y = CURR_HEIGHT-text_space-2*vertical_space; // maximum absolute y
  float number_of_bars = SCOREWIDTH*3-1;
  float bar_thickness = max_x/number_of_bars;
  float space_thickness = max_x/number_of_bars;

  // calculates the probabilities
  float[] qubit_prob = new float[SCOREWIDTH];
  for (int i=0; i<SCOREWIDTH; i++) {
    float prob_sum = 0;
    for (int j=0; j<in.length; j++) {
      String s = binary(j, SCOREWIDTH);
      if (s.charAt(i)=='0') {
        prob_sum = prob_sum + in[j];
      }
    }
    qubit_prob[i] = prob_sum;
  }
  
  // searches the biggest probability
  float max_prob = 0;
  for (int i=0; i<SCOREWIDTH; i++) {
    if (max_prob < qubit_prob[i]) max_prob = qubit_prob[i];
    if (max_prob < 1-qubit_prob[i]) max_prob = 1-qubit_prob[i];
  }

  // draws the barchart
  pushMatrix();
  stroke(200);
  textSize(bar_thickness/6);
  for (int i=0; i<SCOREWIDTH; i++) {
    float bar_height = qubit_prob[i] * max_y/max_prob;
    fill(map(qubit_prob[i], 0, 1, 60, 255));
    rect(0, 0, bar_thickness-5, -bar_height);
    fill(180);
    text("Qubit Nr. "+(i+1), 0, bar_thickness*1.1/3);
    text(round(qubit_prob[i]*100000)/1000.0+"%", 0, bar_thickness*1.1/6);
    fill(0);
    text("|0>", 0, -8);
    translate(bar_thickness, 0);
    bar_height = (1-qubit_prob[i]) * max_y/max_prob;
    fill(map(1-qubit_prob[i], 0, 1, 60, 255));
    rect(0, 0, bar_thickness-5, -bar_height);
    fill(180);
    text(round((1-qubit_prob[i])*100000)/1000.0+"%", 0, bar_thickness*1.1/6);
    fill(0);
    text("|1>", 0, -8);
    translate(bar_thickness, 0);
    translate(space_thickness, 0);
  }
  popMatrix();

  // draws the percentagelines
  stroke(108, 100);
  fill(222, 100);
  textAlign(LEFT);
  textSize(CURR_WIDTH/32);
  line(-horizontal_space*2/3, -max_y/(max_prob), max_x+horizontal_space/2, -max_y/(max_prob));                 // 100%
  text("100%", -horizontal_space*2/3, -max_y/(max_prob)-3);
  line(-horizontal_space*2/3, -max_y/(max_prob*1.33333), max_x+horizontal_space/2, -max_y/(max_prob*1.33333)); // 75%
  text("75%", -horizontal_space*2/3, -max_y/(max_prob*1.33333)-3);
  line(-horizontal_space*2/3, -max_y/(max_prob*2.0), max_x+horizontal_space/2, -max_y/(max_prob*2.0));         // 50%
  text("50%", -horizontal_space*2/3, -max_y/(max_prob*2.0)-3);
  line(-horizontal_space*2/3, -max_y/(max_prob*4.0), max_x+horizontal_space/2, -max_y/(max_prob*4.0));         // 25%
  text("25%", -horizontal_space*2/3, -max_y/(max_prob*4.0)-3);
}