void part4() {
  background(0);
  noTint();
  imageMode(CENTER);
  image(imgBackground,width/2,height/2);
  if (centerRipple!=null) {
    centerRipple.sizeUp2();
    centerRipple.show();
    if (centerRipple.check()) {
      centerRipple=null;
    }
  }

  for (starField i : starFields) {
    if (starFields.indexOf(i)>50) i.deUpdate();
    else i.update();
    i.show();
  }

  for (star i : stars) {
    if (i.check==false) {
      i.show(false);
      i.gathering(new PVector(width/2, height/2),1);
    }
  }
  
  for (starField i : starPen) {
    i.update();
    i.show();
  }
  
  int t=millis()%56926;
  if(t>43000) text1.show();
  if(t>46000) text1.bt=0;
  if(t>44000) text2.show();
  if(t>47000) text2.bt=0;
  if(t>46000) text3.show();
  if(t>49000) text3.bt=0;
  if(t>47000) text4.show();
  if(t>50000) text4.bt=0;
  if(t>50000) text5.show();
  if(t>51000) text6.show();
  if(t>51500) text7.show();
  
  tint(255,255*(t-54000)/2926);
  imageMode(CENTER);
  image(imgFadeOut,width/2,height/2);
}
