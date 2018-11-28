void noiseWater(float noiseadd) {
  // Noise + Wasser
  for(int x=0; x<detail; x++){
    for(int y=0; y<detail; y++){
      for(int z=0; z<detail; z++){
        float h = noise((x-(noiseadd*xWalk))*v1,(y-(noiseadd*yWalk))*v1,z*v1*v5);
        h = map(h,0,1,0,detail);
        if(z<h) box[x][y][z]=1;
        else box[x][y][z]=0;
        
        if(z*1.0/detail<v3){
          if(box[x][y][z]==0) box[x][y][z]=-1; 
  }}}}
}

void surface(float noiseadd){
  // Oberfläche
  for(int x=0; x<detail; x++){
    for(int y=0; y<detail; y++){
      int gd = (int) (map(noiserandom((x-(noiseadd*xWalk))/dng,(y-(noiseadd*yWalk))/dng,2),0,1,v2/3,v2)+1); // Tiefe des Grases
      int dd = (int) ((map(noiserandom((x-(noiseadd*xWalk))/dne,(y-(noiseadd*yWalk))/dne,3),0,1,v2/2,v2*2)+1)*1.66-gd); // Tiefe der Erde
      int dirtdepth = dd;
      int grassdepth = gd;
      int type = 2; // Gras/Sand art
      for(int z=detail-1; z>=0; z--){
        
        if(box[x][y][z]==-1 && type==2) type = 3;
        if(box[x][y][z]==-1 && type==4) type = 5;
        
        if(box[x][y][z]==1){
          if(grassdepth>0){
            grassdepth--;
            box[x][y][z]=type;
          }
        }
        
        if(box[x][y][z]==0 && grassdepth < gd){
          grassdepth = gd;
          type = 4;
        }
        
        if(box[x][y][z]==-1 && grassdepth < gd){
          grassdepth = gd;
          type = 5;
        }
        
        if(grassdepth<=0 && box[x][y][z]==1){
          dirtdepth--;
          if(dirtdepth<0){
            box[x][y][z] = 6;
          }
        }
  }
  // baumplatzierung
  if(noise(100*x,100*y)<1/sq(size/10)){
    // TODO
  }
}}
}