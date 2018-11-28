int f(int x){
  int counter = 0;
  if(x==0) return 0;
  while(x!=1){
    if(x%2==0) x=x/2;
    else x=3*x+1;
    counter++;
  }
  return counter;
}

int onestep(int x){
  if(x==-1) return -1;
  if(x==0) return 0;
  if(x%2==0) return x/2;
  else return x=3*x+1;
}