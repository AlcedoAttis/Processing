// safe 6
// global variables for the size of the window
int CURR_WIDTH;
int CURR_HEIGHT;
// global variables for the type of visualisation
// If GRAPHTYPE is 0, then it swows a bar graph of the probabilites of all possible quantum states.
// If GRAPHTYPE is 1, then it swows a bar graph of every Qubits probability to be 0 or 1.
int GRAPHTYPE = 0;
// If DISPLAYTYPE is 0, then it shows the the menu for changing the timesteps and the qubitcount.
// If DISPLAYTYPE is 1, then it shows the the editor for the Qubitscore.
// If DISPLAYTYPE is 2, then it shows the the charts from GRAPHTYPE.
int DISPLAYTYPE = 0; // starts as 1, gets set to 0 when the user hits ok and gets set to two after the save gets updated
// The Editor class gets initialized (parameters are given when the Editor is used after the setup)
Editor e;
// Probabilitys for every quamtum position
float[] endoutput;

/**
 * Intitalizes the window with a hardcoded standard size and makes it possible to change the parameters.
 * Initializes the mp3 player.
 * It sets the application-icon and the name of the application, too.
 * Needs to be used in processing.
 **/
void setup() {
  //size(900, 600);
  fullScreen();
  minim = new Minim(this);
  player = minim.loadFile("sounds/click.wav");
  surface.setResizable(true);
  PImage titlebaricon = loadImage("icons/icon.png");
  surface.setIcon(titlebaricon);
  surface.setTitle("Quantumcomputersimulation");
  load_gate_images();
}

/**
 * This method is the standard update method of processing.
 * It triggers 60times per second if possible.
 * Depending on the typevariables, it's showing differend parts of the programm-GUI.
 * Methods, which only need to be activated once, are outsourced to the mouse_clicked() method.
 **/
void draw() {
  //System.out.println(DISPLAYTYPE);
  window_resized_update();
  // Setup
  if (DISPLAYTYPE == 0) drawSetup();
  // Editor
  if (DISPLAYTYPE == 1) {
    key_press_check();
    e.editorDraw();
    e.check_for_action();
  }
  // Graphs
  if (DISPLAYTYPE == 2) {
    if (GRAPHTYPE == 0) drawBarchart(endoutput);
    if (GRAPHTYPE == 1) drawQubitchart(endoutput);
  }
  check_if_too_small();
}