// checks if the window is resized and reloads
void windowResizedUpdate(){
  if(height!=currHeight || width!=currWidth){
    cam.reset();
  }
  currHeight=height;
  currWidth=width;
}

// checks if the user RIGHT_CLICKED
// sets cameramode accordingly to type of presented data
void mouseClicked() {
  if (mouseButton == RIGHT) {
    if (outputtype==0) {
      outputtype=1;
      cam.setActive(false);
    } else if (outputtype==1) {
      outputtype=0;
      cam.setActive(true);
    }
  }
}