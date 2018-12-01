int box[][] = new int[399][399];
int boxcopy[][] = new int[399][399];

void setup() {
  size(399, 399, P2D);
  
  box[399/2][399/2] = 10000;
  
  //box[150][150] = 100000;
  box[248][248] = 100000;
} 

void draw () {
  frameRate(200);
  //System.out.println(frameRate);
  background(0);
  //box[399/2][399/2] += 4;
  
  for(int i=0;i<box.length;i++){
    for(int j=0;j<box[0].length;j++){
      boxcopy[i][j] = box[i][j];
    }
  }
  
  boolean change = false;
  for(int i=0;i<box.length;i++){
    for(int j=0;j<box[0].length;j++){
      if(boxcopy[i][j]>=4){
        topple(i,j,boxcopy[i][j]);
        change = true;
      }
    }
  }
  
  loadPixels();
  for(int i=0;i<box.length;i++){
    for(int j=0;j<box[0].length;j++){
      if(box[i][j]<4){
        if(box[i][j]==0) pixels[i*399+j]=color(0);
        if(box[i][j]==1) pixels[i*399+j]=color(255,0,0);
        if(box[i][j]==2) pixels[i*399+j]=color(0,255,0);
        if(box[i][j]==3) pixels[i*399+j]=color(0,0,255);
      }
      else{
        if(box[i][j]%4==0) pixels[i*399+j]=color(180);
        if(box[i][j]%4==1) pixels[i*399+j]=color(180,0,0);
        if(box[i][j]%4==2) pixels[i*399+j]=color(0,180,0);
        if(box[i][j]%4==3) pixels[i*399+j]=color(0,0,180);
      }
    }
  }
  updatePixels();
  
  // System.out.println(frameRate+" "+box[399/2][399/2]);
  //if(change==true)  saveFrame("Frames/line-######.png");
}

void topple (int x, int y, int n) {
  //possibility 1,topple everything
  int topplesize = n/4;//
  if(x+1<box.length) box[x+1][y] += topplesize;
  if(x-1>=0) box[x-1][y] += topplesize;
  if(y+1<box[0].length) box[x][y+1] += topplesize;
  if(y-1>=0) box[x][y-1] += topplesize;
  box[x][y] -= 4*topplesize;
  
  //possibility 2,only topple 4 every time
  /*if(x+1<box.length) box[x+1][y] += 1;
  if(x-1>=0) box[x-1][y] += 1;
  if(y+1<box[0].length) box[x][y+1] += 1;
  if(y-1>=0) box[x][y-1] += 1;
  box[x][y] -= 4;*/
}
