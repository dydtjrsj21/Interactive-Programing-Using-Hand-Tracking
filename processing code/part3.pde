import gab.opencv.*;
import processing.video.*;
import java.awt.*;
PImage src, dst;
Capture video;
OpenCV opencv;
ripple centerRipple;
boolean q=true;
void part3() {
  background(0);
  noTint();
  int t=millis()%56926;
  tint(255,255*(t-34000)/3000);
  imageMode(CENTER);
  image(imgBackground,width/2,height/2);
  if (centerRipple==null) {
    if (music.mix.level()*1000 > 110)
      centerRipple = new ripple(new PVector(width/2, height/2), 0, music.mix.level()*1000);
  } else {
    centerRipple.sizeUp2();
    centerRipple.show();
    if (centerRipple.check()) {
      centerRipple=null;
    }
  }
  for (int i =0; i<ripples.size(); i++) {
    ripple x = ripples.get(i);
    x.sizeUp();
    x.show();
    if (x.check()) {
      ripples.remove(i);
    }
  }
  for (starField i : starFields) {
    i.update();
    i.show();
  }
  for (star i : stars) {
    if (i.check) {
      i.b-=10;
      if (i.b>0) i.moveLikeFirefly();
    } else {
      i.show(true);
      i.gathering(new PVector(width/2, height/2), 1);
    }
  }
}
