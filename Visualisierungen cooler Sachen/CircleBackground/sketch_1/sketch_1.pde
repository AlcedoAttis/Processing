int n = 1000;
Dot[] dots = new Dot[n];
PrintWriter output;

void setup() {
  fullScreen();  // 1600*900
  //size(1000,1000);
  strokeWeight(2); stroke(255);
  output = createWriter("in.txt");
  
  for(int i=0; i<n; i++){
    dots[i] = new Dot(random(0,width),random(0,height));
  }
}

void draw() {
  if(frameCount <= 400){
    System.out.println(frameCount);
    background(50);
    for(int i=0; i<n; i++){
      point(dots[i].x,dots[i].y);
    }
    for(int i=0; i<n; i++){
        dots[i].update(dots,i);
    }
  } else if(frameCount == 401) {
    for(int i=0; i<n; i++){
      output.println((int) (10*dots[i].x));
      output.println((int) (10*dots[i].y));
      output.println("");
    }
    System.out.println("hi");
    output.flush();
  }
}

/*if(frameCount <= 200){
    for(int i=0; i<n; i++){
      dots[i].update(dots,i);
    }
  } else {
    strokeWeight(1); stroke(180);
    for(int i=0; i<n; i++){     // dot1
      for(int j=0; j<=i; j++){  // dot2
        if(sqrt(sq(dots[i].x-dots[j].x)+sq(dots[i].y-dots[j].y))<=25){
          line(dots[i].x,dots[i].y,dots[j].x,dots[j].y);
        }
      }
    }
    strokeWeight(2); stroke(255);
  }*/