/**
 * This is the Editor class.
 * It stores every GUI-change to the Qubitscore(model) in the Qubitscore(classinstance).
 * It enables the user of the programm to insert code on a mouse based interface instead of changing the code.
 **/
class Editor {
  Qubitscore qs;
  int[][] gatepics = new int[SCOREWIDTH][SCORELENGTH]; // -1 means not used
  boolean hasgate = false;
  // 0:Identity i, 1:Bitflip x, 2:Bit&Phaseflip y, 3:Phaseflip z, 4:Hadamard h, 5:Pauli s, 6:Pauli_dagger sd, 7:Troffioli t, 8:Troffioli_dagger td, 9:cnot
  int gatetype;
  // saves if a C-Not control coordinates are set, but not their target coordinates.
  int CNOT_timestep;
  int CNOT_qubit;
  boolean CNOT_half_placed = false;

  // The constructor of editor creates a new Qubitscore.
  Editor() {
    qs = new Qubitscore();
    for (int i=0; i<SCOREWIDTH; i++) {
      for (int j=0; j<SCORELENGTH; j++) {
        gatepics[i][j]=-1;
      }
    }
  }

  // getData returns the saved Qubitscore.
  Qubitscore getData() {
    return qs;
  }

  // This method returns the state of the has_gate varibale, which describes if a gate is currently picked .
  boolean get_picked_up() {
    return hasgate;
  }

  // This method returns the state of the gatetype varibale, which describes what a gate is currently picked up
  int get_picked_type() {
    return gatetype;
  }

  // editorDraw is used to draw a GUI.
  void editorDraw() {
    float gateimage_height = CURR_HEIGHT/6;
    float gateimage_width = CURR_WIDTH/12;
    float lesser_const = min(gateimage_height, gateimage_width);
    background(50);
    stroke(0); 
    strokeWeight(1);
    imageMode(CENTER);
    fill(100); 
    rect(-1, -1, CURR_WIDTH+1, gateimage_height+1);
    pushMatrix();
    translate(gateimage_width/2.0, gateimage_height/2);
    translate(gateimage_width/4.0, 0);
    for (int i=0; i<11; i++) {
      if (i==10) translate(gateimage_width/2.0, 0); // one extra for trashexclusion
      image(pictures[i], 0, 0, 0.9*lesser_const, 0.9*lesser_const);
      translate(gateimage_width, 0);
    }
    popMatrix();
    float quscore_height = (CURR_HEIGHT - gateimage_height)*9.0/10.0;
    float quscore_width = CURR_WIDTH*4.0/5.0;
    float edge_gap = CURR_WIDTH/10.0;
    float line_gap = quscore_height/SCOREWIDTH;
    float point_gap = quscore_width/SCORELENGTH;
    float lesser_const2 = min(line_gap,point_gap);

    pushMatrix();
    translate(CURR_WIDTH/10.0, gateimage_height+quscore_height/18.0); // translation in the quscorearea
    translate(0, line_gap/2); // translation for an easier loop for the lines
    for (int i=0; i<SCOREWIDTH; i++) {
      noStroke();
      fill(100);
      triangle(quscore_width, line_gap/40.0+1, quscore_width, -line_gap/40.0, quscore_width+edge_gap/2, 0);
      stroke(100);
      strokeWeight(line_gap/20.0);
      line(0, 0, quscore_width, 0); // -edge_gap/2
      fill(222);
      textAlign(RIGHT, BASELINE); 
      textSize(lesser_const/2.0); 
      text("Q", -edge_gap/3.0, 0);
      textAlign(LEFT, TOP); 
      textSize(lesser_const/4.0); 
      text(i, -edge_gap/3.0, 0);
      pushMatrix();
      translate(point_gap/2, 0); // translation for an easier loop for the points
      for (int j=0; j<SCORELENGTH; j++) {
        strokeWeight(line_gap/10);
        stroke(222);
        point(0, 0);
        translate(point_gap, 0);
      }
      popMatrix();
      translate(0, line_gap);
    }
    popMatrix();
    // Draw a gate if it is in hand.
    imageMode(CENTER);
    // checks for normal gates
    if (hasgate==true && gatetype != 9) {
      image(pictures[gatetype], mouseX, mouseY, 0.5*lesser_const, 0.5*lesser_const);
    }
    // checks for CNot gates
    else if(hasgate==true && gatetype == 9){
      if(CNOT_half_placed==false) image(pictures[gatetype], mouseX, mouseY, 0.5*lesser_const, 0.5*lesser_const);
      else{
        float imX = point_gap*(CNOT_timestep+0.5)+CURR_WIDTH/10.0;
        float imY = line_gap*(CNOT_qubit+0.5)+gateimage_height+quscore_height/18.0;
        stroke(130, 231, 29); strokeWeight(max(line_gap/10, 0.9*lesser_const2)*0.8); point(imX, mouseY); // draws the targeting C-Not-gate part
        strokeWeight(0.1*lesser_const); line(imX, imY, imX, mouseY); // draws the line connecting both parts
        image(pictures[9], imX, imY, 0.9*lesser_const2, 0.9*lesser_const2); // draws the controling C-Not-gate part
      }
    }
    // Draw already placed gates
    pushMatrix();
    translate(CURR_WIDTH/10.0, gateimage_height+quscore_height/18.0); // translation in the quscorearea
    translate(point_gap/2, line_gap/2); // translation for an easier placement of the gates
    // checks for normal gates
    for (int i=0; i<SCOREWIDTH; i++) {
      for (int j=0; j<SCORELENGTH; j++) {
        if (qs.has_other(i, j)==true) {
          image(pictures[gatepics[i][j]], point_gap*j, line_gap*i, 0.9*lesser_const2, 0.9*lesser_const2);
        }
      }
    }
    // checks for C-Not gates
    // 9=Control, 11=Target
    for (int j=0; j<SCORELENGTH; j++) {
      if (qs.has_cnot(j)==true) {
        int control=0;
        int target=0;
        for (int i=0; i<SCOREWIDTH; i++) {
          if (gatepics[i][j]==11) target=i;
          if (gatepics[i][j]==9) control=i;
        }
        stroke(130, 231, 29); 
        strokeWeight(max(line_gap/10, 0.7*lesser_const2)); 
        point(point_gap*j, line_gap*target);
        strokeWeight(0.1*lesser_const); 
        line(point_gap*j, line_gap*target, point_gap*j, line_gap*control);
        image(pictures[9], point_gap*j, line_gap*control, 0.9*lesser_const2, 0.9*lesser_const2);
      }
    }
    popMatrix();
  }

  void check_for_action() {
    float gate_width = CURR_WIDTH/12.0;
    float gateimage_height = CURR_HEIGHT/6;
    float quscore_height = (CURR_HEIGHT - gateimage_height)*9.0/10.0;
    // if you press your mouse in the gatemenu to pick up a gate
    if (mouseY < CURR_HEIGHT/6.0 && mouseX>gate_width/4.0 && mouseX<gate_width*10.25 && mousePressed==true && hasgate==false) {
      float temp_x = mouseX - gate_width/4.0;
      int gate_type = floor(temp_x/gate_width);
      hasgate = true;
      gatetype = gate_type;
    }
    // if you press your mouse over the trash button
    if (mouseY < CURR_HEIGHT/6.0 && mouseX>gate_width*10.75 && mouseX<gate_width*11.75 && mousePressed==true && hasgate==true) {
      hasgate = false;
      gatetype = -1;
    }
    // if you press your mouse with a normal gate over the qubitscore
    if (mouseX > CURR_WIDTH/10.0 && mouseX < CURR_WIDTH*9.0/10.0 && mouseY > gateimage_height+quscore_height/18.0 && mouseY < gateimage_height+quscore_height*19.0/18.0 && mousePressed==true) {
      // maps mousecoordinates in the qubitscore to normed values boetween 0 and 1
      // map(cuurent value, lower current bound, upper current bound, lower target bound, upper target bound)
      float temp_x_rel = map(mouseX, CURR_WIDTH/10.0, CURR_WIDTH*9.0/10.0, 0, 1);
      float temp_y_rel = map(mouseY, gateimage_height+quscore_height/18.0, gateimage_height+quscore_height*19.0/18.0, 0, 1);
      int curr_timestep = floor(temp_x_rel*SCORELENGTH);
      int curr_qubit = floor(temp_y_rel*SCOREWIDTH);
      // sets borders, so only exact presses count
      boolean exact_enough = true;
      if ((temp_x_rel*SCORELENGTH)%1<0.25 || (temp_x_rel*SCORELENGTH)%1>0.75 || (temp_y_rel*SCOREWIDTH)%1<0.25 || (temp_y_rel*SCOREWIDTH)%1>0.75) exact_enough = false;
      // this checks for the placing of normal gates and stops picking gates up directly after they have been placed
      if (click==true) {
        boolean tempp = false; // is used to stop deplacing a gate directly after placing it
        if (exact_enough == true && hasgate==true && gatetype!=9) {
          if (qs.can_insert_other(curr_qubit, curr_timestep)==true) {
            qs.put_other(gatenumbers_to_gates(gatetype), curr_qubit, curr_timestep);
            gatepics[curr_qubit][curr_timestep] = gatetype;
            hasgate = false;
            gatetype = -1;
            tempp = true;
          }
        }
        // this checks for the deplacing of normal gates
        if (exact_enough == true && hasgate==false && tempp==false) {
          if (qs.has_other(curr_qubit, curr_timestep)) {
            qs.remove_other(curr_qubit, curr_timestep);
            gatetype = gatepics[curr_qubit][curr_timestep];
            gatepics[curr_qubit][curr_timestep] = -1;
            hasgate = true;
          }
        }
        // this checks for the placing of C-Not gates
        if (exact_enough == true && hasgate==true && gatetype==9) {
          if (qs.can_insert_cnot(curr_timestep)==true) {
            tempp = false;
            // first C-Not part
            if (CNOT_half_placed==false) {
              CNOT_timestep = curr_timestep;
              CNOT_qubit = curr_qubit;
              CNOT_half_placed = true;
              tempp = true;
            }
            // second C-Not part
            if (tempp==false && CNOT_half_placed==true && curr_timestep==CNOT_timestep && curr_qubit!=CNOT_qubit) {
              gatepics[CNOT_qubit][CNOT_timestep] = 9;
              gatepics[curr_qubit][CNOT_timestep] = 11;
              qs.put_cnot(CNOT_qubit, curr_qubit, CNOT_timestep);
              CNOT_half_placed = false;
              hasgate = false;
            }
          }
          tempp=true;
        }
        // this checks for the deplacing of C-Not gates
        if (exact_enough == true && hasgate==false && tempp==false) {
          if (qs.has_cnot(curr_timestep)==true) {
            if (curr_qubit==qs.get_cnot_controlqubit(curr_timestep)) {
              // this runs when you sucsessfully clicked to remove a C-Not gate
              gatetype = gatepics[curr_qubit][curr_timestep];
              gatepics[qs.get_cnot_controlqubit(curr_timestep)][curr_timestep] = -1;
              gatepics[qs.get_cnot_targetqubit(curr_timestep)][curr_timestep] = -1;
              qs.remove_cnot(curr_timestep);
              hasgate = true;
            }
          }
        }
      }
    }
  }
}

/**
 * This method builds the foundation for the editor.
 * It is the first part of the GUI, used to set the two Main Parameters SCOREWIDTH and SCORELENGTH for later use through the user
 **/
boolean noMore = false;
void drawSetup() {
  float th = CURR_HEIGHT/10; // textheight
  float heightdiff = -CURR_HEIGHT/80.0; // needed for centered text
  // textparameters
  background(50);
  fill(180); 
  stroke(255);
  textAlign(CENTER, CENTER);
  // drawfunction
  pushMatrix();
  // Programinformation
  translate(CURR_WIDTH/2, CURR_HEIGHT/3);
  textSize(th/3);
  text("This program is a simulation of a quantum computer.", 0, th*3.25);
  text("Interact with the left mouse button and continue by using the right click.", 0, th*3.75);
  text("You can change the qubitscorevariables in this tab, and use gates on it thereafter.", 0, th*4.25);
  text("At last, you will be able to look at the results as two charts.", 0, th*4.75);
  textSize(th);
  if (mousePressed == false && noMore==true) noMore = false;
  // Scorelength
  pushMatrix();
  translate(-CURR_WIDTH/6, 0);
  float trmouseX = mouseX-CURR_WIDTH/3.0; // needed for mousecoordinates
  float trmouseY = mouseY-CURR_HEIGHT/3.0;
  text(SCORELENGTH, 0, heightdiff);
  textSize(th/2);
  text("Timesteps", 0, -2*th);
  textSize(th);
  triangle(-th/2.0, th/2.0, th/2.0, th/2.0, 0, 1.5*th);
  if (trmouseX<th/2.0 && trmouseX>-th/2.0 && trmouseY<1.5*th && trmouseY>th/2.0 && mousePressed == true && noMore == false) { 
    SCORELENGTH--;
    player.play(); 
    player.rewind();
    noMore=true;
  }
  triangle(-th/2.0, -th/2.0, th/2.0, -th/2.0, 0, -1.5*th);
  if (trmouseX<th/2.0 && trmouseX>-th/2.0 && trmouseY>-1.5*th && trmouseY<-th/2.0 && mousePressed == true && noMore == false) { 
    SCORELENGTH++;
    player.play(); 
    player.rewind();
    noMore=true;
  }
  if (SCORELENGTH>20) SCORELENGTH=20;
  if (SCORELENGTH<1) SCORELENGTH=1;
  popMatrix();
  // Scorewidth
  pushMatrix();
  translate(CURR_WIDTH/6, 0);
  trmouseX = mouseX-2*CURR_WIDTH/3.0; // needed for mousecoordinates
  trmouseY = mouseY-CURR_HEIGHT/3.0;
  text(SCOREWIDTH, 0, heightdiff);
  textSize(th/2);
  text("Qubits", 0, -2*th);
  textSize(th);
  triangle(-th/2.0, th/2.0, th/2.0, th/2.0, 0, 1.5*th);
  if (trmouseX<th/2.0 && trmouseX>-th/2.0 && trmouseY<1.5*th && trmouseY>th/2.0 && mousePressed == true && noMore == false) { 
    SCOREWIDTH--;
    player.play(); 
    player.rewind();
    noMore=true;
  }
  triangle(-th/2.0, -th/2.0, th/2.0, -th/2.0, 0, -1.5*th);
  if (trmouseX<th/2.0 & trmouseY<-th/2.0 && mousePressed == true && noMore == false) { 
    SCOREWIDTH++;
    player.play(); 
    player.rewind();
    noMore=true;
  }
  if (SCOREWIDTH>5) SCOREWIDTH=5;
  if (SCOREWIDTH<2) SCOREWIDTH=2;
  popMatrix();
  popMatrix();
}