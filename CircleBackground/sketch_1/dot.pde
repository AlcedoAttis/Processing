float stretch = 16f/5;

class Dot {
  float x;
  float y;
  
  Dot(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void update(Dot[] in, int itself){
    float dx = 0;
    float dy = 0;
    
    for(int i=0; i<in.length; i++){
      if(i != itself){
        float xdiff = in[i].x - x;
        float ydiff = in[i].y - y;
        float diff = sqrt(sq(xdiff)+stretch*sq(ydiff));
        float c = (1f/(40*n))*((log(0.001*diff)/(0.001*diff))+0.001*diff);
        dx += c*xdiff;
        dy += c*ydiff;
      }
    }
    
    x += dx;
    y += dy;
  }
}