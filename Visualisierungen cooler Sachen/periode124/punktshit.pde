float maxdiv = 0;

void punktshit(){
  int x = y;
  int maxv = x;
  while(x!=-1){
    if(x==1) x=-1;
    x=onestep(x);
    if(x>maxv) maxv = x;
  }
  
  float div = 1.0*maxv/y;
  if(div>maxdiv){
    maxdiv=div;
    System.out.println("Zahl:"+y+" Max:"+maxv+" div:"+div);
  }
  
  y++;
}