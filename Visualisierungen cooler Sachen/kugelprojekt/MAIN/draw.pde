//
// Bloch-Sphere, Ansicht Nr. 1
//
void drawSphere() {
  // Setup
  stroke(255, 255, 150, 110);
  strokeWeight(0.5);
  ambientLight(255, 255, 255);
  fill(255, 255, 150, 70);
  background(50);
  sphere(200);

  // Coordinate System
  drawArrow(-240, 240, 0, 0, 0, 0);
  drawArrow(0, 0, -240, 240, 0, 0);
  drawArrow(0, 0, 0, 0, -240, 240);

  // drawing the Points
  for (int i=0; i<list.size(); i++) {
    list.get(i).paint();
  }
}

//
// Balkendiagramm, Ansicht Nr. 2
// Messung nur gegenn Z-Richtung --> -z=1, +z=0
//
void drawChart() {
  cam.reset(0);
  outcomes_update();
  background(50);
  pushMatrix();

  translate(-width/2.5, (height*3)/10+50);
  scale(1, -1);
  strokeWeight(1);
  stroke(100);
  // negative height for tags
  int linewidth = (int)(width*(4.0/5)/outcomes.length);
  float max_height =0;
  for (int i=0; i<outcomes.length; i++) if (outcomes[i]>max_height) max_height=outcomes[i];
  float coefficient=(height/1.5+10000/height)/max_height;
  textinformation(max_height, coefficient);
  stroke(100);
  int x=0;
  for (int i=0; i<outcomes.length; i++) {
    fill(coefficient*outcomes[i]*600/height);
    rect(x+1, 0, linewidth-2, coefficient*outcomes[i]);
    x=x+linewidth;
    
    lII(x-linewidth,x,i,outcomes[i],outcomes.length); //lineiterfaceinformation;
  }
  
  popMatrix();
}