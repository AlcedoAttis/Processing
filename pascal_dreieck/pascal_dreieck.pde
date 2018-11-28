// Pascalsches Dreieck
// so skaliert, das die Durchschnittshöhe in jeder Zeile 1*scale beträgt
// ohne BigDecimal gehts nur bis max=24
// Das finden der Normalverteilung ist eine Aufgabe für den Leser

import peasy.*;
import java.math.BigDecimal;
PeasyCam cam;
int max = 20;
int scale = 20;
float[][] facs = new float[max][max];

void setup() {
  size(900, 600, P3D);
  cam = new PeasyCam(this, 200);
  cam.setMinimumDistance(150);
  cam.setMaximumDistance(700);
  colorMode(HSB, 100, 1, 1);

  for (int i=0; i<max; i++) {
    for (int j=0; j<=i; j++) {
      facs[i][j] = func(i, j);
    }
  }
  for (int i=0; i<max; i++) {
    float sum = 0;
    for (int j=0; j<=i; j++) {
      sum += facs[i][j];
    }
    sum /= i+1;
    for (int j=0; j<=i; j++) {
      facs[i][j] /= sum;
    }
  }
}

void draw() {
  translate(-10*(max*0.5), 0, 0);
  lights();
  background(10);
  fill(220);
  stroke(50);

  for (int i=0; i<max; i++) {
    for (int j=0; j<=i; j++) {
      pushMatrix();
      float h = scale * facs[i][j] ;
      fill(h%100, 1, 1);
      translate(0, 0, h*0.5);
      box(10, 10, -h);
      popMatrix();
      translate(0, 10, 0);
    }
    translate(10, -(i+1.5)*10, 0);
  }
}

float func(int n, int k) {
  return fac(n).divide(  fac(k).multiply(fac(n-k))  ).floatValue();
}

BigDecimal fac(int n) {
  if (n==0) return new BigDecimal("1");
  else return fac(n-1).multiply(new BigDecimal(Integer.toString(n)));
}

void keyPressed() {
  if (key==' ') ortho();
  else perspective();
}
