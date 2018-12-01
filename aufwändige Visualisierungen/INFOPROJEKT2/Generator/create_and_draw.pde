void createWorld(int noiseadd) {
  noiseWater(noiseadd);
  surface(noiseadd);
}

void createSee() {
  for(int x=0; x<detail; x++){
    for(int y=0; y<detail; y++){
      for(int z=0; z<detail; z++){
        boolean seeable = false;
             if(x+1>=detail) seeable = true;
        else if(x - 1 < 0)   seeable = true;
        else if(y+1>=detail) seeable = true;
        else if(y - 1 < 0)   seeable = true;
        else if(z+1>=detail) seeable = true;
        else if(z - 1 < 0)   seeable = true;
        
        else if(box[x+1][y][z]==0 || box[x+1][y][z]==-1) seeable = true;
        else if(box[x-1][y][z]==0 || box[x-1][y][z]==-1) seeable = true;
        else if(box[x][y+1][z]==0 || box[x][y+1][z]==-1) seeable = true;
        else if(box[x][y-1][z]==0 || box[x][y-1][z]==-1) seeable = true;
        else if(box[x][y][z+1]==0 || box[x][y][z+1]==-1) seeable = true;
        else if(box[x][y][z-1]==0 || box[x][y][z-1]==-1) seeable = true;
        
        see[x][y][z] = seeable;
      }
    }
  }
}

void update(){
  counter++;
  createWorld(counter);
  createSee();
}

void paintBlock(int x,int y,int z,int c, boolean d){
  if(c!=0 && d==true){
    pushMatrix();
    translate(x*size,y*size,z*size);
    translate(size/2,size/2,size/2);
    fill(colorHelper(c,z));
    
    /*
    box() is die simple variante, aber ziemlich harzig und unoptimierbar
    außerdem malt die irgendwie nur die hälfte der Seiten. kp why
    es gibt hint(ENABLE_DEPTH_SORT), dass das fixt, aber das fickt die performance aufs übelste.
    */
    box(size/* *0.3 //probier das mal, das ist cool*/); 
    
    /*
    jede Seite einzeln zu malen is codemäßig richtig harzig und man könnte das ja streamlinen -> @clemens TODO
    aber ich bin zu faul und mach das grad nur weil box hart laggt.
    @clemens die Optimierung arbeitet Blockweise, nicht Seitenweise! Also wird bei jedem Block den man sieht alle Seiten gemalt!
    man sieht aber immer nur 1,2 oder 3, (exept wasser, weil wasser der übelste bodge ist) selten mehr Seiten, also könnte man den speed locker noch doppeln
    trotzdem isser insgesamt noch langsamer.
    setz dich mal mit int(DISABLE_DEPTH_TEST) [das is nicht das von oben] auseinander. das kann helfen, aber du musst alles in reihenfolge malen.
    */
    //outsourced_weil_haesslich(size/2);
    
    popMatrix();
  }
}

void outsourced_weil_haesslich(int s){
  // x+
  beginShape();
  vertex(s,-s,-s);
  vertex(s,-s,s);
  vertex(s,s,s);
  vertex(s,s,-s);
  endShape();
  
  // x-
  beginShape();
  vertex(-s,-s,-s);
  vertex(-s,-s,s);
  vertex(-s,s,s);
  vertex(-s,s,-s);
  endShape();
  
  // y+
  beginShape();
  vertex(-s,s,-s);
  vertex(-s,s,s);
  vertex(s,s,s);
  vertex(s,s,-s);
  endShape();
  
  // y-
  beginShape();
  vertex(-s,-s,-s);
  vertex(-s,-s,s);
  vertex(s,-s,s);
  vertex(s,-s,-s);
  endShape();
  
  // z+
  beginShape();
  vertex(-s,-s,s);
  vertex(s,-s,s);
  vertex(s,s,s);
  vertex(-s,s,s);
  endShape();
  
  // z-
  beginShape();
  vertex(-s,-s,-s);
  vertex(s,-s,-s);
  vertex(s,s,-s);
  vertex(-s,s,-s);
  endShape();
}