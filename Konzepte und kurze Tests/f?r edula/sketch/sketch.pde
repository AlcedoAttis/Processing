PImage img;
int y = 2016;
int m = 1;
int d = 0;

int g = 4;

int counter = 0;

// 1536,1152
void setup(){
 size(100,100);
 frameRate(1);
 
 boolean a = true;
 while(a == true){
   img = newImg();
   if(img == null) a = false;
   else {
     String num = new String(""+counter);
     int len0 = 5-num.length();
     String fin = new String("");
     for(int i=0; i<len0; i++){
       fin = fin+"0";
     }
     fin = fin+num;
     img.save("frames/"+fin+".jpg");
     counter++;
     
     String num2 = new String(""+counter);
     int len02 = 5-num2.length();
     String fin2 = new String("");
     for(int i=0; i<len02; i++){
       fin2 = fin2+"0";
     }
     fin2 = fin2+num2;
     img.save("frames/"+fin2+".jpg");
     counter++;
   }
 }
 println(counter);
 exit();
}

PImage newImg(){
  while(y<=2017){
    while(m<=12){
      while(d<30){
        d++;
        if(loadImage("A"+g+" Verteidigung/A"+g+" "+d+"."+m+"."+y+".jpg")!=null) return loadImage("A"+g+" Verteidigung/A"+g+" "+d+"."+m+"."+y+".jpg");
        if(loadImage("A"+g+" Verteidigung/a"+g+" "+d+"."+m+"."+y+".jpg")!=null) return loadImage("A"+g+" Verteidigung/a"+g+" "+d+"."+m+"."+y+".jpg");
        if(loadImage("A"+g+" Verteidigung/A"+g+" "+d+"."+m+"."+(y-2000)+".jpg")!=null) return loadImage("A"+g+" Verteidigung/A"+g+" "+d+"."+m+"."+(y-2000)+".jpg");
        if(loadImage("A"+g+" Verteidigung/a"+g+" "+d+"."+m+"."+(y-2000)+".jpg")!=null) return loadImage("A"+g+" Verteidigung/a"+g+" "+d+"."+m+"."+(y-2000)+".jpg");
      }
      d=0; m++;
    }
    m=1; y++;
  }
  return null;
}