void part1() {
  /*imageMode(CENTER);
   noTint();
   image(imgBackground,width/2,height/2);*/
  background(0);
  float t=millis()%56926;
  float lineSize=50;
  stroke(150);
  strokeWeight(2);
  for (int i=0; i<10; i++) {
    float movingX=(height-2*lineSize)*t/18000+lineSize-i*height/10;
    if (movingX>lineSize)line(lineSize+(width-2*lineSize)*i/10, lineSize, lineSize+(width-2*lineSize)*i/10, movingX);
    float movingY=(2*lineSize-height)*t/18000+height-lineSize+i*height/10;
    if (movingY<height-lineSize)line(width-lineSize-(width-2*lineSize)*i/10, height-lineSize, width-lineSize-(width-2*lineSize)*i/10, movingY);
  }
  line(lineSize, lineSize, (width-2*lineSize)*t/18000+lineSize, lineSize);
  line(width-lineSize, height-lineSize, (2*lineSize-width)*t/18000+width-lineSize, height-lineSize);
  noStroke();
  for (int i=0; i< fireflys.size(); i++) {
    firefly x = fireflys.get(i);
    x.update();
    if (000 < t && t<3000 && i<sunsuPoints.size()) x.gathering(sunsuPoints.get(i),1);
    else if ( 13000 < t && t<15000 && abs(sunsuPoints.size()/2-i)<sarangPoints.size()/2-1) x.gathering(sarangPoints.get(i-( sunsuPoints.size()-sarangPoints.size() )/2 ),0.05);
    else if ( 7500 < t && t<9800 && abs(sunsuPoints.size()/2-i)<donghwaPoints.size()/2-1) x.gathering(donghwaPoints.get(i-( sunsuPoints.size()-donghwaPoints.size() )/2),0.05);
    else {
      if(abs(sunsuPoints.size()/2-i)>sarangPoints.size()/2-1)x.b-=(x.b)*0.02;
      if (x.b<1) fireflys.remove(x);
      x.move();
    }
    x.show();
  }

  // Calculate a "wind" force based on mouse horizontal position
  float dx = map(handX, 0, width, -0.2, 0.2);
  PVector wind = new PVector(dx, 0);
  ps.applyForce(wind);
  ps.run();
  for (int i = 0; i <music.mix.level()*15; i++) {
    ps.addParticle();
  }
  if (t>15000) {
    fill(0, 255*(t/3000-5));
    rect(-10, -10, width+20, height+20);
    if (random(1)<0.3*min(1, (t/3000-5))) {
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
    for (star i : stars) {
      i.moveLikeFirefly();
    }
  } else {
  }
  
}
