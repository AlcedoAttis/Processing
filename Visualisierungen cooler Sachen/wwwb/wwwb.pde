
void setup() {
  size(512, 512, P3D);
  background(0);
  strokeWeight(1);
  stroke(255,100,100);
}

void draw() {
  drawArray(9);
}

void drawArray(int n){
  int twon = power(2,n); //4
  int[][] moin = new int[twon][twon];
  moin[0][0]=0;
  for(int i=1;i<=n;i++){
    int awidth=power(2,i)/2;
    for(int j=0;j<awidth;j++){
      for(int k=0;k<awidth;k++){
        if(moin[j][k]==0){
          moin[j+awidth][k+awidth]=1;
          moin[j+awidth][k]=1;
          moin[j][k+awidth]=1;
        }
        else{
          moin[j+awidth][k+awidth]=0;
          moin[j+awidth][k]=0;
          moin[j][k+awidth]=0;
        }
      }
    }
  }
  for(int i=1;i<twon;i++){
    for(int j=1;j<twon;j++){
      if(moin[i][j]==0){
        point(i,j);
      }
    }
  }
}

int power(int base, int exponent){
  int j=base;
  for(int i=1;i<exponent;i++){
    j=j*base;
  }
  return j;
}