// print 
void prnt(int[][] wall) {
  println(wall);
  println();
}

// pprint
void pprnt(int[][] wall) {
  for (int l=0; l<wall.length; l++) {
    print("[ ");
    for (int b=0; b<wall[l].length; b++) {
      print(wall[l][b]+" ");
    }
    println("]");
  }
  println();
}

// ppprint
import java.util.Collections;
void ppprnt(int[][] wall) {
  ArrayList<Character> chars = new ArrayList<Character>();
  for (int i=33; i<127; i++) {
    chars.add((char) (i));
  }
  Collections.shuffle(chars);
  int counter = 0;

  for (int l=0; l<wall.length; l++) {
    for (int n=1; n<=wall[l].length; n++) {    // the order of blocks
      for (int b=0; b<wall[l].length; b++) {   // the length of blocks
        if (wall[l][b] == n) {
          for (int c=0; c<b+1; c++) {
            print(chars.get(counter));
          }
          counter++;
          if (counter==94) counter=0;
        }
      }
    }
    println();
  }
  println();
}

void drw(int m, int[][] wall) {
  background(255);
  stroke(0,0,0);
  fill(110);
  strokeWeight(6);
  
  float r = 0.02;          // edge of picture
  int wdt = ((m+1)*m)/2;  // width of the wall
  int hgt = m/2 + 1;      // height of the wall (simplified, n=1 yields 1)
  float bh = height*(1.0-2*r)/hgt; // blockheight
  float bw = width*(1.0-2*r)/wdt;  // blockwidth

  translate(r*width/1f, r*height/1f);

  for (int l=0; l<wall.length; l++) {
    pushMatrix();
    for (int n=1; n<=wall[l].length; n++) {    // the order of blocks
      for (int b=0; b<wall[l].length; b++) {   // the length of blocks
        if (wall[l][b] == n) {
          float w = (b+1)*bw;
          rect(0, 0, w, bh);
          translate(w, 0);
        }
      }
    }
    popMatrix();
    translate(0, bh);
  }
}