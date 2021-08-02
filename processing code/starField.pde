class starField {
  PVector pos;
  PImage img;
  float bs;
  float bt;
  float ang;
  int s;
  starField(PVector p,PImage img) {
    this.img=img;
    this.pos = p;
    this.bs=0;
    this.bt=random(80, 150);
    this.ang=random(2*PI);
    this.s=10;
    this.img.resize(this.s, this.s);
  }
  void update() {
    if (this.bs<this.bt) { 
      this.bs+=0.5;
    } else {
      this.bs+=5*sin(this.ang);
      this.ang+=3*PI/180;
    }
  }
  void deUpdate(){
    this.bs-=0.5;
  }
  void show() {
    imageMode(CENTER);
    tint(255, this.bs);
    image(this.img, this.pos.x, this.pos.y);
  }
}
