class textFade2{
  PVector pos;
  float b;
  float bt;
  textFade2(PVector pos){
    this.pos=pos;
    this.b=0;
    this.bt=255;
  }
  void show(int t){
    this.b+=(this.bt-this.b)*0.01;
    fill(255,this.b);
    textAlign(CENTER,CENTER);
    text(("The picture is taken after "+t+" seconds"),this.pos.x,this.pos.y);
  }
}
class textFade{
  PVector pos;
  PFont font;
  float b;
  float bt;
  String str;
  textFade(PVector pos, PFont font, String str){
    this.pos=pos;
    this.font=font;
    this.b=0;
    this.bt=255;
    this.str=str;
  }
  void show(){
    this.b+=(this.bt-this.b)*0.01;
    fill(255,this.b);
    textFont(this.font);
    textAlign(CENTER,CENTER);
    text(this.str,this.pos.x,this.pos.y);
  }
}
