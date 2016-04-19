import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

float fWidth, fHeight;
PImage fade;
float wid;
int hVal;  //hue value

void setup() {

  size(640, 480, P3D);
  //fullScreen(P3D);
  minim = new Minim(this);  //initialize minim object
  in = minim.getLineIn(Minim.STEREO, 512);  //initialize Line In
  fft = new FFT(in.bufferSize(), in.sampleRate());  //initialize fft object
  fft.logAverages(60, 7);

  wid = width/fft.avgSize();

  background(0);
  fade = get(0, 0, width, height); //get the stage background of the sketch

  fWidth = width * 0.99;
  fHeight = height * 0.99;

  hVal = 0;

  smooth(5);
}

void draw() {

  //background(0);
  pushMatrix();
  fill(0, 10);
  rect(0, 0, width, height);
  popMatrix();

  tint(255, 255, 255, 253);
  image(fade, (width-fWidth)/2, (height-fHeight)/2, fWidth, fHeight);
  noTint();

  strokeWeight(wid);
  stroke(0, 255, 0, 200);
  strokeCap(SQUARE);
  fft.forward(in.mix);  //mix between Left and Right channel of audio input

  colorMode(HSB);  //Hue Saturation Brightness mode
  stroke(hVal, 255, 255);
  colorMode(RGB);  //change back to RGB mode

  for (int i=0; i<fft.avgSize(); i++) {
    line((i * wid) + (wid/2), height, (i * wid), height - fft.getAvg(i) * 100);
  }

  fade = get(0, 0, width, height);

  for (int i=0; i<fft.avgSize(); i++) {
    stroke(255);
    line((i * wid) + (wid/2), height, (i * wid), height - fft.getAvg(i) * 100);
  }

  hVal += 2;
  if (hVal > 255) {
    hVal = 0;
  }
}