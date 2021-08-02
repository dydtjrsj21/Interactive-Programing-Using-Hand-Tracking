ArrayList<PVector> textToPoints(String str, PVector tr) {
  ArrayList<PVector> points = new ArrayList();
  for (int j=0; j<str.length(); j++) {
    char c=str.charAt(j);
    PShape shape = font.getShape(c);
    for (int i = 0; i < shape.getVertexCount(); i++) {
      PVector p=shape.getVertex(i);
      points.add(new PVector(p.x+j*250, p.y).add(tr));
    }
  }
  return points;
}

ArrayList<PVector> imgToPoints(PImage img) {
  ArrayList<PVector> points = new ArrayList();
  
  img.loadPixels();
  for (int i=0; i<img.width; i++) {
    for (int j=0; j<img.height; j++) {
      int index = i+j*img.width;
      color c = img.pixels[index];
      float b = brightness(c);
      if (b>200) {
        points.add(new PVector(i,j));
      }
    }
  }
  
  return points;
}
