class textPacking {
  PVector pos;
  String str;
  float textS;
  boolean growing;
  textPacking(PVector pos, String str, float textS) {
    this.pos=pos;
    this.str=str;
    this.textS=textS;
    this.growing=true;
  }

  void grow() {
    if (this.growing) this.textS+=0.5;
  }

  void show() {
    fill(255);
    textSize(this.textS);
    textFont(font);
    text(this.str, this.pos.x, this.pos.y);
  }
  boolean edges() {
    float len=this.str.length();
    return(
      this.pos.x+len*this.textS/2 >= width ||
      this.pos.x-len*this.textS/2 <= 0 ||
      this.pos.y+this.textS/2 >= height ||
      this.pos.y-this.textS/2 <= 0
      );
  }
  boolean boundary(PVector p) {
    return(
      abs(this.pos.x-p.x) < this.str.length()*this.textS/2-2 &&
      abs(this.pos.y-p.y) < this.textS/2-2
      );
  }
}
ArrayList<PVector> spots=new ArrayList<PVector>();
ArrayList<textPacking> texts=new ArrayList<textPacking>();
void imgToTextPacking() {
  int total=10;
  int count=0;
  int attempts=0;
  boolean stop=true;
  while (count < total) {
    textPacking newT = newText();
    if (newT != null) {
      texts.add(newT);
      count++;
    }
    attempts++;
    if (attempts > 1000) {
      for (int i = 0; i < texts.size(); i++) {
        texts.get(i).show();
      }
      stop=false;
      break;
    }
  }
  if (stop) {
    for (int i = 0; i < texts.size(); i++) {
      textPacking circle = texts.get(i);

      if (circle.growing) {
        if (circle.edges()) {
          circle.growing = false;
        } else {
          for (int j = 0; j < texts.size(); j++) {
            textPacking other = texts.get(j);
            if (circle != other) {
              if (circle.boundary(other.pos) || other.boundary(circle.pos)) {
                circle.growing = false;
                break;
              }
            }
          }
        }
      }
      circle.grow();
    }
  }
}
textPacking newText() {
  int r = int(random(0, spots.size()));
  PVector spot = spots.get(r);
  boolean valid = true;
  for (int i = 0; i < texts.size(); i++) {
    textPacking circle = texts.get(i);
    if (circle.boundary(spot)) {
      valid = false;
      break;
    }
  }
  if (valid) {
    return new textPacking(spot, poem[int(random(poem.length))], 5);
  } else {
    return null;
  }
}

String[] poem = {"아버지","어머니","친구","하나님","책"};
