 

class sandbox {
  int[][] box;
  float p;
  ArrayList<Integer> trail;
  ArrayList<Integer> trail2;
  int s;

  // constructor
  sandbox(int size, float prob) {
    this.box = new int[size][size];
    this.p = prob;
    this.trail = new ArrayList<Integer>();
    this.s=size;
  }

  // method
  void update() {
    trail2 = new ArrayList<Integer>();
    int tx = (int)(s/1.5);
    int ty = s/2;
    int tr;
    int go = 0;
    while(go>=0){
      if(trail.size()<=go) tr=-1;
      else tr=trail.get(go);
      int direction = look(tx,ty,tr,go);
      if(direction == -1){
        box[tx][ty]++;
        go = -100;
        trail=trail2;
      } else{
        if(direction==0) tx++;
        else if(direction==1) ty++;
        else if(direction==2) tx--;
        else ty--;
        go++;
      }
    }
    
  }
  
  int look(int x, int y, int tr, int go){
    //tr=trail rotation 0=x 1=y 2=-x 3=-y -1=not there
    boolean[] dir = new boolean[4];
    
    if(x+1<size){ //0
      if(box[x][y]-box[x+1][y]>0 || tr==0 && box[x][y]-box[x+1][y]>=0) dir[0]=true;
      else dir[0]=false;
    }
    if(y+1<size){ //1
      if(box[x][y]-box[x][y+1]>0 || tr==1 && box[x][y]-box[x][y+1]>=0) dir[1]=true;
      else dir[1]=false;
    }
    if(x-1>=0){ //2
      if(box[x][y]-box[x-1][y]>0 || tr==2 && box[x][y]-box[x-1][y]>=0) dir[2]=true;
      else dir[2]=false;
    }
    if(y-1>=0){ //3
      if(box[x][y]-box[x][y-1]>0 || tr==3 && box[x][y]-box[x][y-1]>=0) dir[3]=true;
      else dir[3]=false;
    }
    
    if(dir[0]==false&&dir[1]==false&&dir[2]==false&&dir[3]==false){
      return -1;
    }
    else if(tr==-1){
      while(true){
          int g = (int)(random(4));
          if(dir[g]==true){
            trail2.add(g);
            return g;
          }
        }
    }
    else if(dir[tr]==true){
      if(random(1)<p){
        trail2.add(tr);
        return tr;
      }
      else{
        while(true){
          int g = (int)(random(4));
          if(dir[g]==true){
            trail2.add(g);
            return g;
          }
        }
      }
    }
    else{
      while(true){
          int g = (int)(random(4));
          if(dir[g]==true){
            trail2.add(g);
            return g;
          }
        }
    }
    
    
    
    
  }
  
  int sc=3;
  float cg = 2.0;
  void draw(){
    fill(200);
    //stroke(255,0,0); line(0,0,0,s*.5,0,0);
    //stroke(0,255,0); line(0,0,0,0,s*.5,0);
    //stroke(0,0,255); line(0,0,0,0,0,s*.5);
    stroke(255); noStroke();
    translate(-(sc*s)/2.0,-(sc*s)/2.0,0);
    colorMode(HSB, size*1.0/cg, 1, 1);
    
    for(int x=0;x<box.length-1;x++){
      beginShape(TRIANGLE_STRIP);
      for(int y=0;y<box[0].length;y++){
        fill(box[x][y],1,1);
        if(box[x][y]==0) fill(0,0,0.5);
        vertex(sc*x,sc*y,sc*box[x][y]);
        vertex(sc*(x+1),sc*y,sc*box[x+1][y]);
        endShape();
      }
    }
    
    colorMode(RGB, 255,255,255);
  }
}