import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

PImage fade;
int hVal;
float fWidth, fHeight;
float wid;

void setup(){
  
  size(600,600,P3D);
  //fullScreen(P3D);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  fft.logAverages(60,7);
  
  wid = width/fft.avgSize();
  
  fade = get(0, 0, width, height);
  
  hVal = 0;
  
  fWidth = width *0.99;
  fHeight = width *0.99;
  
  background(0);
  
}

void draw(){
  
  background(0);
  
  fft.forward(in.mix);
  
  tint(255,255,255,250);
  image(fade, (width-fWidth)/5, (height-fHeight)/5, fWidth, fHeight);
  noTint();
  
  colorMode(HSB);
  fill(hVal, 255,255);
  colorMode(RGB);
  
  //pushMatrix();
  ////colorMode(HSB);
  ////stroke(hVal, 255, 255);
  ////colorMode(RGB);
  translate(width/2, height/2);
  //fill(0,0,255);
  noStroke();
    for (int i=0; i<fft.avgSize(); i++) {
  
    sphere(20+fft.getAvg(i)*50);
  }
  //popMatrix();
  
  fade = get(0, 0, width, height);
  
    //pushMatrix();
  //translate(width/2, height/2);
  //fill(255);
  //noStroke();
    for (int i=0; i<fft.avgSize(); i++) {
  
    sphere(20+fft.getAvg(i)*50);
    lights();
  }
  //popMatrix();
  
  hVal += 2;
  if(hVal > 255){
   hVal = 0; 
   
  }
  
}