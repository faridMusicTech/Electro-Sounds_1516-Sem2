import codeanticode.syphon.SyphonServer;

SyphonServer syphon;

ArrayList <worm> wormy = new ArrayList();

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

import peasy.*;

PeasyCam cam;

float zz = 300;
float ee = 0;
float speedo = random(1, 10);

void settings() {
  size(960, 540, P3D);
  //fullScreen(P3D);
  
  PJOGL.profile=1;
  smooth(8);
  
}
 
void setup() {
  //size(960, 540, P3D);
  
  syphon = new SyphonServer( this , "p5-to-syphon" );
  
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  fft.logAverages(60, 7);
  
  for(int i=0; i<200; i++){
  wormy.add(new worm(1, 8));
  }
  
  cam = new PeasyCam(this, zz);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  
  smooth(5);
  
}


void draw() {
  //background(255);
  
  fft.forward(in.mix);
  
  pushMatrix();
  fill(0, 10);
  translate(0, 0, -300);
  rect(-650, -350, 1270, 700);
  popMatrix();
  keyPressed();

  //randomSeed(100);
  
  pushMatrix();
  translate(-300,-300);
  for(worm b : wormy){
   b.display(); 
   b.move();
  }
  popMatrix();

  ee += speedo;

  rotateZ(frameCount*0.01);

  translate(0, 0, ee + fft.getAvg(10) * 800);
  if (ee>random(50, 250) || ee<random(-150, 0)) {

    speedo *= -1;
  }
  for (int x=-50; x<50; x+=(random(11, 13))) {
    for (int y=-50; y<50; y+=(random(11, 13))) {
      for (int z=-50; z<50; z+=(random(11, 13))) {
        pushMatrix();
        translate(x, y, z);
        display();
        popMatrix();
      }
    }
  }
    syphon.sendScreen();
  //saveFrame("frames/####.png");
}

void display() {

  fill(random(50, 200), 0, 0, 10);
  stroke(10);
  box(random(6, 10));
}

void keyPressed() {
  switch(key) {

    case('1'):      
    pushMatrix();
    fill(100, 0, 0, 10);
    translate(0, 0, -300);
    rect(-650, -350, 1270, 700);
    popMatrix();
    break;

    case('2'):      
    pushMatrix();
    fill(100, 30);
    translate(0, 0, -300);
    rect(-650, -350, 1270, 700);
    popMatrix();
    break;

    case('3'):      
    pushMatrix();
    fill(255, 20);
    translate(0, 0, -300);
    rect(-650, -350, 1270, 700);
    popMatrix();
    break;

    case('4'):    
    pushMatrix();
    fill(20, 0, 70, 20);
    translate(0, 0, -300);
    rect(-650, -350, 1270, 700);
    popMatrix();
    break;
    
    case('5'):   //randomSeed(10);
    rotateZ(frameCount*-(random(0.01,0.1)));break;
  }
}