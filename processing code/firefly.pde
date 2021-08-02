class firefly{
  PVector p;
  float s;
  float ang;
  float v;
  PImage img;
  float b;
  PVector targetP;
  float bt;
  float angB;
  
  firefly(PImage img){
    this.p=new PVector(random(width),random(height));
    this.s=random(1,1.5);
    this.ang=random(2)*PI;
    this.v=this.s*this.s/4;
    this.img=img;
    this.b=80;
    this.bt=random(80, 150);
    this.angB=random(2*PI);
  }
  void move(){
    this.p.add(new PVector((music.mix.level()*15+0.1)*this.v*cos(this.ang),(music.mix.level()*15+0.1)*this.v*sin(this.ang)));
    this.ang += random(20)*PI/180-10*PI/180;
  }
  void show(){
    tint(255,this.b);
    imageMode(CENTER);
    image(this.img,this.p.x,this.p.y);
  }
  void check(){
    if (abs(this.p.x-width/2)>width/2 || abs(this.p.y-height/2)>height/2)
      this.p=new PVector(random(width),random(height));
  }
  void moveToCircle(PVector target){
    PVector targetP=target.get();
    this.p.add(targetP.sub(this.p).mult(0.05));
    noTint();
    imageMode(CENTER);
    image(this.img,this.p.x,this.p.y);
  }
  void gathering(PVector targetP,float v){
    PVector ps=new PVector(this.p.x,this.p.y);
    PVector pt=new PVector(targetP.x,targetP.y);
    pt.sub(ps).mult(v);
    this.p.add(pt);
  }
  void update() {
    if (this.b<this.bt) { 
      this.b+=0.5;
    } else {
      this.b+=5*sin(this.angB);
      this.angB+=3*PI/180;
    }
  }
}
