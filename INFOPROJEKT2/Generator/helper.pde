color colorHelper(int c, int h){
  switch(c){
    case -1: return color(#21C2FA,1500/detail); // Wasser
    case 0: return 0;
    case 1: return color(#6C3F07); // Erde
    case 2: return grassColorHelper(h); // Gras
    case 3: return color(#F5E448); // Sand
    case 4: return color(#357911); // dunkles Gras
    case 5: return color(#716823); // dunkler Sand
    case 6: return color(#646159); // Stein
    
    default: return color(255,0,255);
  }
}

float noiserandom(float x,float y,int z){
  float n = noise(x,y,z);
  return n;
}

color ground;
color top = color(255);

color grassColorHelper(int h){ // minheight = v3*detail maxheight= detail
  
  if(h < (v4+v3)*detail) return ground;
  
  float red = map(h, (v4+v3)*detail, detail, 0xFF & (ground >> 16), 0xFF & (top >> 16));
  float green = map(h, (v4+v3)*detail, detail, 0xFF & (ground >> 8), 0xFF & (top >> 8));
  float blue = map(h, (v4+v3)*detail, detail, 0xFF & ground, 0xFF & top);
  
  return color(red, green, blue);
}