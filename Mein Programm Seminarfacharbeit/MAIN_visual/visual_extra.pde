// This imports a mp3 player.
import ddf.minim.*;
Minim minim;
AudioPlayer player;

// checks if the window is resized and then updates the two size variables
void window_resized_update() {
  CURR_HEIGHT=height;
  CURR_WIDTH=width;
}

// This standard method triggers methods and classes by a call from userinteraction with the mouse buttons.
void mouseClicked() {
  // checks if the user used the right click
  // changes the DISPLAYTYPE/GRAPHTYPE if the user uses the right click
  // it calculates the endoutputarray.
  if (mouseButton == RIGHT) {
    player.play(); 
    player.rewind();
    // Change between different graphs in the Output
    if (DISPLAYTYPE == 2) {
      GRAPHTYPE = abs(GRAPHTYPE-1);
    }
    // Change from Editor to Output
    if (DISPLAYTYPE == 1) {
      q = new Qubits(SCOREWIDTH);
      endoutput = state_calculator();
      DISPLAYTYPE = 2;
    }
    // Change from Setup to Editor
    if (DISPLAYTYPE == 0) {
      // editor gets initialized with the legth and width parameters
      e = new Editor();
      DISPLAYTYPE = 1;
    }
  }
  //
  //
  if (mouseButton == LEFT) {
    // nothing
  }
}

// This mathod loads all of the gate-icons in PImage variables to be used in the editor.
// 0:Identity i, 1:Bitflip x, 2:Bit&Phaseflip y, 3:Phaseflip z, 4:Hadamard h, 5:Pauli s, 6:Pauli_dagger sd, 7:Troffioli t, 8:Troffioli_dagger td, 9:cnot, 10:trash
PImage[] pictures;
void load_gate_images() {
  pictures = new PImage[11];
  pictures[9] = loadImage("gates/cnot.png");
  pictures[0] = loadImage("gates/i.png");
  pictures[1] = loadImage("gates/x.png");
  pictures[2] = loadImage("gates/y.png");
  pictures[3] = loadImage("gates/z.png");
  pictures[4] = loadImage("gates/h.png");
  pictures[5] = loadImage("gates/s.png");
  pictures[6] = loadImage("gates/sd.png");
  pictures[7] = loadImage("gates/t.png");
  pictures[8] = loadImage("gates/td.png");
  pictures[10] = loadImage("icons/trash.png");
}

void check_if_too_small() {
  if (CURR_WIDTH<200 || CURR_HEIGHT<200) {
    background(255, 0, 0);
    if (CURR_WIDTH>550) {
      fill(0);
      translate(CURR_WIDTH/2, CURR_HEIGHT/2);
      textAlign(CENTER, CENTER);
      textSize(CURR_HEIGHT/2);
      text("TOO SMALL", 0, 0);
    }
  }
}

// This method convertes the gatenumbers to gates.
// without the cnot gate
// 0:Identity i, 1:Bitflip x, 2:Bit&Phaseflip y, 3:Phaseflip z, 4:Hadamard h, 5:Pauli s, 6:Pauli_dagger sd, 7:Troffioli t, 8:Troffioli_dagger td
c[][] gatenumbers_to_gates(int gatetype) {
  switch(gatetype) {
  case 0: 
    return g.i();
  case 1: 
    return g.x();
  case 2: 
    return g.y();
  case 3: 
    return g.z();
  case 4: 
    return g.h();
  case 5: 
    return g.s();
  case 6: 
    return g.sd();
  case 7: 
    return g.t();
  case 8: 
    return g.td();
  default:
    System.out.println("Number to gate conversion error");
    return g.i();
  }
}

// this method returns true one tim after a click has happend
boolean click = false;
boolean press = false;
void key_press_check() {
  if (click==true && mousePressed==true && press==true) click = false;
  if (click==false && mousePressed==true && press==false) { 
    click = true; 
    press = true;
  }
  if (mousePressed == false) press = false;
}