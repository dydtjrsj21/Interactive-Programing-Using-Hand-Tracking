class ripple{
  PVector p;
  float rs;
  float rt;
  float t;
  float s;
  String str;
  
  ripple(PVector p,float rs,float rt){
    this.p=p.get();
    this.rs=rs;
    this.rt=rt;
  }
  
  void sizeUp(){
    this.rs+=1;
    this.t=255*(this.rt-this.rs)/this.rt;
    this.s=3*(this.rt-this.rs)/this.rt;
  }
  
  void sizeUp2(){
    this.rs+=2;
    this.t=255*(this.rt-this.rs)/this.rt;
    this.s=3*(this.rt-this.rs)/this.rt;
  }
  
  void show(){
    noTint();
    noFill();
    if (this.s<0)
      this.s=0;
    strokeWeight(this.s);
    if (this.t<0)
      this.t=0;
    stroke(255,this.t);
    circle(this.p.x,this.p.y,this.rs);
  }
  
  boolean check(){
    boolean ans=false;
    if (this.rs>this.rt)
      ans=true;
    return ans;
  }
}
