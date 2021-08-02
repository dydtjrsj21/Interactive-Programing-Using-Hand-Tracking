class textPop {
  boolean check;
  PVector pos;
  PImage img;
  float t;
  float life;
  textPop(PVector pos, PImage img, boolean check) {
    this.pos=pos;
    this.img=img;
    this.t=0;
    this.check=check;
    this.life=100;
  }
  void show() {
    tint(255, this.life-this.t);
    if (this.t<this.life) this.t+=0.8;
    imageMode(CENTER);
    image(this.img, width/2, height/2);
  }
}
