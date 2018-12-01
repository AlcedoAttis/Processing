void setup() {
  size(1500, 500);
  frameRate(1);
  noSmooth();
}

void draw() {
  int[][] wall = bt_helper(frameCount);
  drw(frameCount, wall);
  save("wall_"+frameCount+".png");
  if(frameCount>=14) exit();
  
  //prnt(wall);    // just for completion, prints memory address
  //pprnt(wall);   // prints the list of blocks per layer and when to place them
  //ppprnt(wall);  // prints a text version of the wall
}

int[][] bt_helper(int n) {
  if (n<1) {
    print("not a valid number");
    return null;
  }
  int wdt = ((n+1)*n)/2;  // width of the wall
  int hgt = n/2 + 1;      // height of the wall (simplified, n=1 yields 1)
  //int hgt = (((n+1)*n)/2-1)/(n-1); // the actually correct height, n=1 yields NaN

  // saves if(!=0) and when(2>1) blocks of different layers are used
  int[][] blocks = new int[hgt][n];
  int current_x_point = 0;
  return bt(n, wdt, hgt, blocks, current_x_point);
}

int[][] bt(int n, int wdt, int hgt, int[][] blocks, int x) {
  // finding the number of placed bricks of every layer
  int[] brick_number = new int[hgt];
  for (int i=0; i<hgt; i++) {
    brick_number[i] = 0; // redundant, but good for understanding
    for (int j=0; j<n; j++) {
      if (blocks[i][j] > brick_number[i]) brick_number[i] = blocks[i][j];
    }
  }

  // sort layers by current x coordinate of the right edge
  int[] max_x = new int[hgt];
  int[] sort_y = new int[hgt];
  int counter = 0;
  // finding the current x coordinate of every layer
  for (int i=0; i<hgt; i++) {
    for (int j=0; j<n; j++) {
      if (blocks[i][j]!=0) max_x[i] += j+1;
    }
  }
  // sorting the layers by length from small to large
  for (int i=0; i<wdt; i++) {
    for (int j=0; j<hgt; j++) {
      if (max_x[j]==i) {
        sort_y[counter]=j;
        counter++;
      }
    }
  }

  // for all the new x'es that could need a slit
  // for n%2==0 al slits need to be filled
  int edge_x = wdt;
  if (n%2==0) edge_x = x+1;
  for (int next_x=x+1; next_x<=edge_x; next_x++) {
    // for all layers, sorted from the ones lagging behind to the forefront
    for (int sort_layer=0; sort_layer<hgt; sort_layer++) {
      // check if the correct brick can still be placed
      int needed = next_x - max_x[sort_y[sort_layer]];
      if (needed<=n && blocks[sort_y[sort_layer]][needed-1]==0) {
        // place block
        blocks[sort_y[sort_layer]][needed-1] = brick_number[sort_y[sort_layer]] + 1;
        // check if end of wall is reached
        if (next_x == wdt) {
          // if, then check if the remaining blocks can fill the wall
          // == check if there is at most one block per layer left
          boolean possible_all = true;
          for (int i=0; i<hgt; i++) {
            int count_of_0 = 0; // each 0 per row is an unplaced block
            for (int j=0; j<n; j++) {
              if (blocks[i][j]==0) {
                count_of_0++;
              }
            }
            if (count_of_0>1) possible_all = false;
          }
          // if it can be finished, finish it
          if (possible_all) {
            for (int i=0; i<hgt; i++) {
              for (int j=0; j<n; j++) {
                if (blocks[i][j]==0) {
                  // replacing the 0'es with n'es as they are the last blocks
                  blocks[i][j] = n;
                }
              }
            }
            return blocks;
          }
        } else {
          // if not, then continue backtracking
          int[][] ret = bt(n, wdt, hgt, blocks, next_x);
          if (ret != null) return ret;
        }
        // NEED TO REVERSE BLOCKPLACING BECAUSE THE ARRAYDATA IS SHARED ! experimental
        // deplace block
        blocks[sort_y[sort_layer]][needed-1] = 0;
      }
    }
  }
  // if nothing is possible, then return null to swow it  
  return null;
}
