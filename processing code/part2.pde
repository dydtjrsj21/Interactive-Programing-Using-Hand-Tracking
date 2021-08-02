float numberOfRipple = 0.3;
int textOrder=0;
float textSizeGr=0;
void part2() {
  background(0);
  if (random(1)<numberOfRipple) {
    ripples.add(new ripple(new PVector(random(width), random(height)), 0, random(50, 100)) );
  }
  for (int i =0; i<ripples.size(); i++) {
    ripple x = ripples.get(i);
    x.sizeUp();
    x.show();
    if (x.check()) {
      ripples.remove(i);
    }
  }
  for (textPop i : textPops) {
    if (i.check)
      i.show();
  }
  boolean check=true;
  for (star i : stars){
    if(i.check==false) check=false;
  }
  if(check){
    textAlign(CENTER,CENTER);
    fill(255);
    textSize(25+2*sin(textSizeGr));
    textSizeGr+=PI/180;
    text("Bring your hand to the fireflies",width/2,height/2);
  }
  for (star i : stars) {
    if (i.check) {
      i.moveLikeFirefly();
      i.close();
      if (i.check==false) { 
        numberOfRipple-=0.3/stars.size();
        textPops.get(textOrder).check=true;
        textOrder++;
      }
    } else {
      i.show(true);
    }
  }
}
