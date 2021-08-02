import ddf.minim.*;
import processing.net.*; 

Client myClient; 
String[] myArrayData = null;
float handX;
float handY;

Minim minim;
AudioPlayer music;

ParticleSystem ps;
ArrayList<firefly> fireflys = new ArrayList<firefly>();
ArrayList<ripple> ripples = new ArrayList<ripple>();
ArrayList<star> stars = new ArrayList<star>();
ArrayList<textPop> textPops = new ArrayList<textPop>();
ArrayList<starField> starFields = new ArrayList<starField>();
ArrayList<starField> starPen = new ArrayList<starField>();
PImage imgBackground, imgShutter, imgStarField, imgFadeOut;
PFont font;
PFont fontForRipple;
File dir; 
File [] files;
ArrayList<PVector> sunsuPoints;
ArrayList<PVector> sarangPoints;
ArrayList<PVector> donghwaPoints;
String[] negativeWords={"외톨이", "과제", "술", "군대", "게임", "유튜브", "웹툰"};
textFade2 dirPicture;
textFade text1;
textFade text2;
textFade text3;
textFade text4;
textFade text5;
textFade text6;
textFade text7;
textFade text8;

void setup() {
  size(1000, 600);
  myClient = new Client(this, "127.0.0.1", 3030);
  minim = new Minim(this);
  music = minim.loadFile("musicSource.mp3", 1024);
  music.loop();
  PImage imgFire = loadImage("fire.png");
  PImage imgStar = loadImage("star.png");
  imgStarField = loadImage("starField.png");
  PImage imgScatter = loadImage("textScatter.png");
  PImage imgSunsu = loadImage("순수함.png");
  PImage imgSarang = loadImage("사랑.png");
  PImage imgDonghwa = loadImage("동화.png");
  PImage imgPen = loadImage("pen.png");
  imgBackground = loadImage("background.png");
  imgFadeOut = loadImage("fadeOut.png");
  imgShutter = loadImage("shutter.png");
  font = createFont("font/YoonDongJu.ttf", 52);

  sunsuPoints=imgToPoints(imgSunsu);
  sarangPoints=imgToPoints(imgSarang);
  donghwaPoints=imgToPoints(imgDonghwa);

  dirPicture = new textFade2(new PVector(width/2, 100));

  ps = new ParticleSystem(0, new PVector(width/2, height/2), imgFire);

  dir= new File(dataPath("text"));
  files= dir.listFiles();

  text1 = new textFade(new PVector(219,434),font,"당신의 시처럼");
  text2 = new textFade(new PVector(365,513),font,"하늘을 우러러");
  text3 = new textFade(new PVector(570,513),font,"한 점");
  text4 = new textFade(new PVector(770,513),font,"부끄럼이 없길");
  text5 = new textFade(new PVector(219,434),font,"당신의 삶처럼");
  text6 = new textFade(new PVector(425,513),font,"모든 죽어가는 것을");
  text7 = new textFade(new PVector(778,513),font,"사랑할 수 있길");
  
  imgPen.loadPixels();
  for (int i=0; i<imgPen.width; i++) {
    for (int j=0; j<imgPen.height; j++) {
      int index = i+j*imgPen.width;
      color c = imgPen.pixels[index];
      float b = brightness(c);
      if (b>1) {
        color cNext = imgPen.pixels[index+1];
        float bNext = brightness(cNext);
        color cPre = imgPen.pixels[index-1];
        float bPre = brightness(cPre);
        if (bNext<1||bPre<1) {
          if (random(1)>0.8) starPen.add(new starField(new PVector(i, j), imgStarField) );
        } else {
          if (random(1)>0.998) starPen.add(new starField(new PVector(i, j), imgStarField) );
        }
      }
    }
  }

  for (int i=0; i<sunsuPoints.size(); i++)
    fireflys.add(new firefly(imgScatter) );
  for (int i=0; i<5; i++) {
    stars.add( new star(random(width), random(0, 2*PI), random(1, 2), imgStar) );
    PImage imgText=loadImage( files[i].getAbsolutePath() );
    textPops.add( new textPop(stars.get(i).pos, imgText, false) );
  }
  for (int i=0; i<200; i++)
    starFields.add(new starField(new PVector(random(width), random(height)), imgStarField) );
}

void draw() {
  String kk = myClient.readString();
  if (kk != null) {
    myArrayData = kk.split(",");
    float x=Float.parseFloat(myArrayData[0]);
    float y=Float.parseFloat(myArrayData[1]);
    handX=map(x,50,600,width,0);
    handY=map(y,100,400,0,height);
  }
  int t=millis()%56926;
  if(t<100) setupAgain();
  if (t<18000) 
    part1();
  else if (t<34000)
    part2();
  else if (t<44000)
    part3();
  else 
  part4();
  fill(255, 0, 0);
  noStroke();
  circle(handX, handY, 10);
}

void setupAgain() {
  background(0);
  q=true;
  numberOfRipple=0;
  textOrder=0;
  textSizeGr=0;
  PImage imgFire = loadImage("fire.png");
  PImage imgStar = loadImage("star.png");
  imgStarField = loadImage("starField.png");
  PImage imgScatter = loadImage("textScatter.png");
  PImage imgSunsu = loadImage("순수함.png");
  PImage imgSarang = loadImage("사랑.png");
  PImage imgDonghwa = loadImage("동화.png");
  imgBackground = loadImage("background.png");
  imgFadeOut = loadImage("fadeOut.png");
  imgShutter = loadImage("shutter.png");

  dirPicture = new textFade2(new PVector(width/2, 100));

  text1 = new textFade(new PVector(154, 85), font, "하늘을");
  text2 = new textFade(new PVector(330, 85), font, "우러러");
  text3 = new textFade(new PVector(482, 85), font, "한 점");
  text4 = new textFade(new PVector(664, 85), font, "부끄럼이");
  text5 = new textFade(new PVector(840, 85), font, "없길");

  fireflys = new ArrayList<firefly>();
  stars = new ArrayList<star>();
  textPops = new ArrayList<textPop>();
  starFields = new ArrayList<starField>();
  starPen = new ArrayList<starField>();

  for (int i=0; i<sunsuPoints.size(); i++)
    fireflys.add(new firefly(imgScatter) );
  for (int i=0; i<5; i++) {
    stars.add( new star(random(width), random(0, 2*PI), random(1, 2), imgStar) );
    PImage imgText=loadImage( files[i].getAbsolutePath() );
    textPops.add( new textPop(stars.get(i).pos, imgText, false) );
  }
  for (int i=0; i<200; i++)
    starFields.add(new starField(new PVector(random(width), random(height)), imgStarField) );
}
