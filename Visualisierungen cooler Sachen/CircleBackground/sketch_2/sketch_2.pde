BufferedReader r;
PGraphics g;

void setup(){
  g = createGraphics(8000,4500);
  int[] xx = new int[10000];
  int[] yy = new int[10000];
  r = createReader("in.txt");
  
  for(int i=0; i<10000; i++){
    try {
      xx[i] = Integer.parseInt(r.readLine());
      yy[i] = Integer.parseInt(r.readLine());
      r.readLine();
    } catch (IOException e) {
    e.printStackTrace();
    }
  }
  
  int[][] lines = new int[10000][5];
  for(int i=0; i<10000; i++){
    float v1 = Float.MAX_VALUE; int w1=0;
    float v2 = Float.MAX_VALUE; int w2=0;
    float v3 = Float.MAX_VALUE; int w3=0;
    for(int j=0; j<10000; j++){
      if(i!=j){
        float dist = sq(xx[i]-xx[j])+sq(yy[i]-yy[j]);
        if(dist<v1){
          v3 = v2; v2 = v1; v1 = dist;
          w3 = w2; w2 = w1; w1 = j;
        } else if(dist<v2){
          v3 = v2; v2 = dist;
          w3 = w2; w2 = j;
        } else if(dist<v3){
          v3 = dist;
          w3 = j;
        }
      }
    }
    lines[i][0] = w1; lines[i][1] = w2; lines[i][2] = w3;
    lines[i][3] = (int) random(0,360);
    lines[i][4] = (int) map(sq(0.9*(xx[i]-8000))+sq(1.6*(yy[i]-4500)),0,30000000,1000,0);
  }
  
  
  g.beginDraw();
  g.colorMode(HSB, 360, 100, 100);
  g.background(0);
  for(int i=0; i<10000; i++){
    g.strokeWeight(2);
    g.stroke(lines[i][3], 50*(lines[i][4]/1000f), 100*(lines[i][4]/2000f));//g.stroke(150);
    g.line(xx[i]/2,yy[i]/2,xx[lines[i][0]]/2,yy[lines[i][0]]/2);
    g.line(xx[i]/2,yy[i]/2,xx[lines[i][1]]/2,yy[lines[i][1]]/2);
    g.line(xx[i]/2,yy[i]/2,xx[lines[i][2]]/2,yy[lines[i][2]]/2);  
  }
  for(int i=0; i<10000; i++){
    g.strokeWeight(10);
    g.stroke(lines[i][3], 100*(lines[i][4]/1000f), 100*(lines[i][4]/2000f));
    g.point(xx[i]/2,yy[i]/2);
  }
  
  g.endDraw();
  g.save("out.png");
  System.out.println("jo");
}