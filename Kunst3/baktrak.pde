boolean check_length(boolean in[][]) { // is aber garkein backtrack trollolololo
  // make new board
  for (int x=0; x<b; x++) {
    for (int y=0; y<b; y++) {
      if (in[x][y]) { // -/-
        o[3*x  ][3*y  ]=0; 
        o[3*x+1][3*y  ]=0; 
        o[3*x+2][3*y  ]=8;
        o[3*x  ][3*y+1]=0; 
        o[3*x+1][3*y+1]=8; 
        o[3*x+2][3*y+1]=0;
        o[3*x  ][3*y+2]=8; 
        o[3*x+1][3*y+2]=0; 
        o[3*x+2][3*y+2]=0;
      } else {     // -\-
        o[3*x  ][3*y  ]=8; 
        o[3*x+1][3*y  ]=0; 
        o[3*x+2][3*y  ]=0;
        o[3*x  ][3*y+1]=0; 
        o[3*x+1][3*y+1]=8; 
        o[3*x+2][3*y+1]=0;
        o[3*x  ][3*y+2]=0; 
        o[3*x+1][3*y+2]=0; 
        o[3*x+2][3*y+2]=8;
      }
    }
  }

  // FLOODFILL  board
  int max_l=0;
  for (int x=0; x<B; x++) {
    for (int y=0; y<B; y++) {
      if (o[x][y]==0) {
        o[x][y] = 1;
        int _l = flood(x, y);
        if (_l>max_l) max_l = _l;
      }
    }
  }
  
  //if(temp_max < max_l) temp_max = max_l;
  //System.out.println(temp_max);
  if(max_l >= /*min_length*/ temp_max){
    System.out.println(temp_max);
    temp_max = max_l;
    return true;
  }
  else return false;
}

int flood(int x, int y){
  int sum = 1;
  int[] ewsn = {0,0,0,0};
  if(in_bounds(x+1,y)){ o[x+1][y]=1; ewsn[0]=1;}
  if(in_bounds(x-1,y)){ o[x-1][y]=1; ewsn[1]=1;}
  if(in_bounds(x,y+1)){ o[x][y+1]=1; ewsn[2]=1;}
  if(in_bounds(x,y-1)){ o[x][y-1]=1; ewsn[3]=1;}
  
  if(ewsn[0]==1) sum += flood(x+1,y);
  if(ewsn[1]==1) sum += flood(x-1,y);
  if(ewsn[2]==1) sum += flood(x,y+1);
  if(ewsn[3]==1) sum += flood(x,y-1);
  
  return sum;
}

boolean in_bounds(int x,int y){
  if(x>=0 && x<B && y>=0 && y<B && ( o[x][y]==0 ) ) return true;
  return false;
}

int temp_max = 0;