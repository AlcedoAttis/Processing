int wn; int hn; int n;
int[] superl[] = new int[2][];
ArrayList<Integer> listx1 = new ArrayList<Integer>();
ArrayList<Integer> listy1 = new ArrayList<Integer>();
ArrayList<Integer> listx2 = new ArrayList<Integer>();
ArrayList<Integer> listy2 = new ArrayList<Integer>();
int big = 0;

void setup(){
  //frameRate(1);
  background(0);
  wn = /*displayWidth;  // */2*255;
  hn = /*displayHeight; // */2*255;
  n = wn;
  //fullScreen();
  size(512,512,P3D);
  int listx[] = new int[n];
  int listy[] = new int[n];
  
  superl[0]=listx;
  superl[1]=listy;
  
  neu();
  
  for(int i=0;i<n;i++){
    for(int j=i+1;j<n;j++){
      if(dist(superl[0][i],superl[1][i],superl[0][j],superl[1][j])){
        /*int too_often = 0;
        int how_often = 0;
        for(int k=0;k<listx1.size();k++){
          if(superl[0][i]==listx1.get(k) && superl[1][i]==listy1.get(k)){
            how_often++;
            System.out.println("hg");
          }
        }
        if(how_often>big) too_often=1;
        how_often=0;
        for(int k=0;k<listx1.size();k++){
          if(superl[0][j]==listx2.get(k) && superl[1][j]==listy2.get(k)) how_often++;
        }
        if(how_often>big) too_often=1;
        
        if(too_often==0){*/
          listx1.add(superl[0][i]);
          listy1.add(superl[1][i]);
          listx2.add(superl[0][j]);
          listy2.add(superl[1][j]);
        //}
      }
    }
  }
  
  
}

void draw(){
  strokeWeight(1);
  for(int i=0;i<listx1.size();i++){
    float r=random(40,100); float g=r+random(0,105); float b;
    if(r>70){
      b=random(0,50);
      r=r+random(55,155);
      g=g+random(55,105);
    }
    else{
      b =random(50,255);}
    stroke(r,g,b);
    //line(listx1.get(i),listy1.get(i),listx2.get(i),listy2.get(i));
    point(2*r,2*g,2*b);
  }
  /*stroke(255,0,0);
  strokeWeight(5);
  for(int i=0;i<hn;i++){
    point(superl[0][i],superl[1][i]);
  }*/
}

void neu(){
 for(int i=0;i<wn;i++){
    superl[0][i]=int(random(wn));
    superl[1][i]=int(random(hn));
 }
}

boolean dist(int x1, int y1, int x2, int y2){
  float distance = sqrt(abs(x2-x1)*abs(x2-x1)+abs(y2-y1)*abs(y2-y1));
  if(distance<2*sqrt(n) && 2*distance>sqrt(n)){
    return true;
  }
  else{
    return false; 
  }
}