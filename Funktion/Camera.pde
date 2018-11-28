
boolean debug = true;

import java.awt.Robot;

class Camera {
  
  public Camera(float dist) {
    f = dist;
  }
  
  float f;
  
  void update() {
    
    if(debug)
      drawAxis();

    float xAng = map(mouseX, width, 0, -PI, PI);
    float yAng = map(mouseY, height, 0, 0.001-HALF_PI, HALF_PI - 0.001);
    
    float y = sin(yAng)*f;
    float perp = cos(yAng)*f;
    
    float x = sin(xAng)*perp;
    float z = cos(xAng)*perp;
    
    camera(x, y, z, 0, 0, 0, 0, 1, 0);
  }
  
  void drawAxis() {
    pushMatrix();
    stroke(#FF0000);
    line(-100, 0, 0, 150, 0, 0);
    stroke(#00FF00);
    line(0, -100, 0, 0, 150, 0);
    stroke(#0000FF);
    line(0, 0, -100, 0, 0, 150);
    popMatrix();
  }
}