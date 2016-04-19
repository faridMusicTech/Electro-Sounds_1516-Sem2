import codeanticode.syphon.SyphonServer;        // importing of the syphon library
SyphonServer syphon;

import ddf.minim.analysis.*;                    //importing of the minim library
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

ArrayList <rotatingBox> rotatingB = new ArrayList();
ArrayList <flyingRect> flyRect = new ArrayList();
ArrayList <whirlPool> whirlP = new ArrayList();
ArrayList <cocoon> cocoona = new ArrayList();
ArrayList <statics> statico = new ArrayList();
ArrayList <butterfly> butterflies = new ArrayList();

int ROTATINGBOX = 1;
int FLYINGRECT = 2;
int WHIRLPOOL = 4;
int COCOON = 8;
int STATICS = 16;
int BUTTERFLY = 32;
int CAMERAZOOMER = 64;

int mode = 2;

float t, y, u;

void settings() {                    //a part of the syphon settings
  size(1280, 720, P3D);
  //fullScreen(P3D);
  PJOGL.profile=1;
  smooth(8);
  
}

void setup() {

  syphon = new SyphonServer( this , "p5-to-syphon" );
  //size(1280, 720, P3D);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  fft.logAverages(60, 7);

  rotatingB.add(new rotatingBox());

  for (int i=0; i<10; i++) {
    flyRect.add(new flyingRect());        //adding, multiplying, copying and pasting of a class
  }

  whirlP.add(new whirlPool());            //adding a classes

  cocoona.add(new cocoon());

  statico.add(new statics());

  for (int i = 0; i<30; i++) {
    butterflies.add(new butterfly());
  }

  smooth();
}

void draw() {
  fft.forward(in.mix);              //initiating of minim so it detects the audio continuously

  pushMatrix();                     //rectangle background canvas for trail effects
  translate(0, 0, 0);
  fill(0, 10);
  rect(0, 0, 1280, 730);
  popMatrix();

  if (isModeActive(CAMERAZOOMER)) {   //scene that varies the camera angle in the Z-axis
    stroke(255, 50);
    camera(width/2.0, height/2.0, ((height/2.0) + fft.getAvg(10) * 800) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  }

  if (isModeActive(FLYINGRECT)) {    //scene of flying rectangles/lines
    for (flyingRect c : flyRect) {
      translate(t, y, u);
      u = random(-500, 200);
      c.display();
    }
  }

  if (isModeActive(ROTATINGBOX)) {    //scene of the rotating box 
    for (rotatingBox b : rotatingB) {
      b.display();
    }
  }

  if (isModeActive(WHIRLPOOL)) {      //scene of the whirlpool sketch
    for (whirlPool d : whirlP) {
      d.display();
    }
  }

  if (isModeActive(BUTTERFLY)) {          //scene of multiple butterflies
    for (butterfly d : butterflies) {
      d.display(); 
      d.move();
    }
  }

  if (isModeActive(STATICS)) {          //scene of the static sketch
    for (statics b : statico) {
      b.display();
    }
  }

  if (isModeActive(COCOON)) {          //scene of the cocoon 
    for (cocoon c : cocoona) {
      c.display();
    }
  }

  lights();                  //lighting effect
  syphon.sendScreen();       //sends the sketch to the syphon window
}

boolean isModeActive(int theMode) {
  return (mode & theMode)>0;
}

void keyPressed() {      //keypress used to change scenes
  switch(key) {
    case('1'): 
    mode ^= 1;
    break;
    case('2'): 
    mode ^= 2;
    break;
    case('3'): 
    mode ^= 4;
    break;
    case('5'): 
    mode ^= 8;
    break;
    case('6'): 
    mode ^= 16;
    break;
    case('7'): 
    mode ^= 32;
    break;
    case('0'): 
    mode ^= 64;
    break;
  }
}