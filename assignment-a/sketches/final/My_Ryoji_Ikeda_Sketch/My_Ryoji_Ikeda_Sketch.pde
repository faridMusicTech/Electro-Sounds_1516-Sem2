void setup() {

  size(960, 540, P3D);
  smooth();
}

void draw() {
  background(255);

  pushMatrix();
  translate(0, 0);
  for (int k=0; k<20; k++) {

    line(0+k*50, 0, 0+k*50, 540);
    stroke(0);
    strokeWeight(6);
  }
  popMatrix();

  pushMatrix();
  translate(0, 0);
  line(0, 0, 960, 0);
  line(0, 540, 960, 540);
  stroke(0);
  strokeWeight(12);
  popMatrix();

  float a = random(2, 5);

  for (int i=0; i<230; i++) {
    for (int j=0; j<50; j++) {

      line(0+j*50, 0+i*a, 50+j*50, 0+i*a);
      stroke(random(0, 10));
      strokeWeight(random(1, 4));
    }
  }

  noLoop();
  smooth();
}