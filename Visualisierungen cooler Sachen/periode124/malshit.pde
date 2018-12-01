void malshit(boolean iterate){
  noFill();
    background(0);
  
  int x = y;
  int maxv = x;
  int steps = f(y);
  while(x!=-1){
    if(x==1) x=-1;
    x=onestep(x);
    if(x>maxv) maxv = x;
  }
  
  x = y;
  int counter = 0;
  beginShape();
  while(x!=-1){
    int xcoor = counter*width/(steps);
    int ycoor = height-((x-1)*(height)/maxv);
    if(x==1) x=-1;
    stroke(255,0,0);
    strokeWeight(3);
    point(xcoor,ycoor);
    strokeWeight(1);
    stroke(255);
    vertex(xcoor,ycoor);
    x=onestep(x);
    counter++;
  }
  endShape();
  
  //System.out.println("Startzahl: "+y);
  //System.out.println("Anzahl der Teilrechnungen: "+steps);
  //System.out.println("Höchster Punkt: "+maxv);
  //System.out.println("");
  
  fill(200);
  textSize(32);
  text("Startzahl: "+y,0,32);
  text("Anzahl der Teilrechnungen: "+steps,0,66);
  text("Höchster Punkt: "+maxv,0,100);
  
  if(iterate) y++;
}