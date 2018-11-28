int h = 800;
int w = 400;

void setup(){
  size(400,800);
  stroke(255);
  strokeWeight(5);
  frameRate(1);
}

void draw(){
  translate(w/2,h/2);
  background(0);
  stroke(255); strokeWeight(1);
  for(int ty=-h/2; ty<h/2; ty++){
    point(tx(ty), ty);
    point(-tx(ty), ty);
  }
} 

float tx(int ty){
  // Fg = G*M*m / r^2
  // Ff = m*v^2 / r
  // |Fg-> + Ff->| = g
  
  // Vereinfachung: 2d
  // G, M, m, v = 1 , g = 0
  // koordinaten Sonne = (0,0)
  
  // Fg-> = 1/r1^2    |r1=sqrt(x^2+y^2)    |zu (0,0)
  // scale =  1/(x^2+y^2),  
  // Fgx = x/scale, Fgy = y/scale
  // Ff-> = 1/r2      |r2=x                |in x Richtung
  // Ffx = 1/r2,   FFy = 0
  
  // Fresx(rechts) = (y^2-1)/(x*y^2)
  // Fresy         = 1/(x^2*y)
  // Fres =  sqrt(sq((y^2-1)/(x*y^2))+sq(1/(x^2*y))) = 1

}