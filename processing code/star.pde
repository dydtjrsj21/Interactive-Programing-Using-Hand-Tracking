class star {
  float r;
  float v;
  PImage img;
  float ang;
  boolean check;
  PVector pos;
  ParticleSystem ps;
  float b=80;

  star(float r, float ang, float v, PImage img_) {
    this.v=v;
    this.img=img_;
    this.ang=ang;
    this.ps=new ParticleSystem(0, new PVector(width/2, height/2), img_);
    this.check=true;
    this.pos=new PVector(r*cos(this.ang), r*sin(this.ang)).add(
      new PVector(width/2, height/2));
  }
  void moveLikeFirefly() {
    int t=millis();
    this.ang += random(20)*PI/180-10*PI/180;
    this.b+=sin(this.ang);
    if (t<15000) {
      this.pos.add(new PVector((music.mix.level()*15+0.1)*0.25*cos(this.ang), music.mix.level()*15*0.25*sin(this.ang)));
    } else {
      this.pos.add(new PVector(0.5*this.v*cos(this.ang), 0.5*this.v*sin(this.ang)));
      if (this.b<100) 
        this.b+=2;
    }
    if (abs(this.pos.x-width/2)>width/2 || abs(this.pos.y-height/2)>height/2)
      this.pos=new PVector(random(width), random(height));

    tint(255, this.b);
    imageMode(CENTER);
    image(this.img, this.pos.x, this.pos.y);
  }
  void move(PVector center) {
    this.pos.sub(center).rotate(this.v*PI/180).add(center);
  }
  void show(boolean check) {
    this.ps.origin=new PVector(this.pos.x, this.pos.y);
    this.ps.addParticle();
    this.ps.run();
    if(check) this.move(new PVector(width/2,height/2));
  }
  void close() {
    PVector x=new PVector(handX, handY);
    if (x.dist(this.pos)<50) {
      this.check=false;
      PVector center = new PVector(width/2, height/2);
      this.r=center.dist(this.pos);
      this.v-=this.r/width*this.r/width;
    }
  }
  void gathering(PVector center,float v) {
    float r=center.dist(this.pos);
    if (r>10) this.pos.sub(center).setMag(r-v).add(center);
  }
}
