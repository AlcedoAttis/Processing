int[][] field, new_field;
boolean paused, showRaster;
int ALIVE = 1, DEAD = 0;
int simulationFPS;

void setup() {
  size(1000, 1000);
  noCursor();
  noStroke();
  
  field = new int[50][50];
  paused = true;
  showRaster = false;
  
  simulationFPS = 5;
}

void draw() {
  if (!paused) {
    frameRate(simulationFPS);
    nextGeneration();    
  }
  else frameRate(100);
  
  background(255);
  
  if (mousePressed) {
    int x = mouseX / 20;
    int y = mouseY / 20;
    int state = 0;
    
    if (mouseButton == LEFT) state = ALIVE;
    if (mouseButton == RIGHT) state = DEAD;
    
    try {
      field[x][y] = state;
    }
    catch (ArrayIndexOutOfBoundsException e) {}
}
  
  if (paused) drawSelection();
  if (showRaster) drawRaster();
  
  fill(255, 0, 0);
  for (int x=0; x<50; x++) {
      for (int y=0; y<50; y++) {
       if (isAlive(x, y)) drawTile(x, y);
    }
  }  
}

void keyReleased() {
  if (key == ' ') paused = (!paused);
  if (key == 'g') nextGeneration();
  if (key == 'c') field = new int[50][50];
  if (key == '+') simulationFPS += 5;
  if (key == '-') simulationFPS = max(2, simulationFPS-5);
  if (keyCode == LEFT) mouseX -= 20;
  if (keyCode == RIGHT) mouseX += 20;
  if (keyCode == UP) mouseY -= 20;
  if (keyCode == DOWN) mouseY += 20;
  if (key == 'r') showRaster = (!showRaster);
}

boolean isAlive(int x, int y) {
  if (x < 0 || x > 49 || y < 0 || y > 49) return false;
  
  if (field[x][y] == ALIVE) return true;
  else return false;
}

int countNeighbours(int x, int y) {
  int count = 0;
  
  if (isAlive(x, y+1))   count ++;
  if (isAlive(x, y-1))   count ++;
  if (isAlive(x+1, y))   count ++;
  if (isAlive(x+1, y+1)) count ++;
  if (isAlive(x+1, y-1)) count ++;
  if (isAlive(x-1, y))   count ++;
  if (isAlive(x-1, y+1)) count ++;
  if (isAlive(x-1, y-1)) count ++;
  
  return count;
}


void drawTile(int x, int y) {
  fill(255, 0, 0);
  rect(x*20+2, y*20+2, 16, 16);
}

void drawSelection() {
  
  fill(0, 0, 255);
  int x = 20*int(mouseX/20);
  int y = 20*int(mouseY/20);
  rect(x, y, 20, 20);
  fill(255);
  if (!showRaster) rect(x+2, y+2, 16, 16);
}


void drawRaster() {
  fill(0);
  for (int x=0; x<width; x+=20) {
    rect(x-1, 0, 2, height);
    rect(0-1, x-1, width, 2);
  }
}

void nextGeneration() {
  new_field = new int[50][50];
    
  for (int x=0; x<50; x++) {
    for (int y=0; y<50; y++) {    
      boolean alive = isAlive(x, y);
      int state = DEAD;
      
      int neighbours = countNeighbours(x, y);
      
      if (alive && neighbours < 2) state = DEAD;
      if (alive && neighbours > 3) state = DEAD;
      if (alive && (neighbours == 2 || neighbours == 3)) state = ALIVE;
      if (!alive && neighbours == 3) state = ALIVE;
      
      new_field[x][y] = state;
    }
  }
  field = new_field;
}
