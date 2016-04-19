ArrayList <swoosh> sws = new ArrayList();

void setup() {

  size(960, 540, P3D);
  //fullScreen(P3D);
  smooth();

  for (int i=0; i<10; i++) {
    sws.add(new swoosh());            //adding and initializing the class of shape
  }
}

float wdt1;
float wdt2;
float wdt3;
float wdt4;
float wdt5;
float wdt6;
float wdt7;
float r;

void draw() {

  pushMatrix();
  translate(width/2, height/2);
  rotateZ(frameCount * 1);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  fill(random(255), 10);
  noStroke();
  sphere(10);                      //sphere in the center of sketch
  lights();
  popMatrix();

  pushMatrix();
  translate(0, 0, 0);
  noStroke();
  fill(random(200), random(50));
  rect(0, 0, width, height);       //a rectangle canvas for the trail effect
  lights();
  popMatrix();

  stroke(random(50), random(10, 100));
  strokeWeight(random(0.5, 5));

  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(frameCount * cos(0.01));
  for (int i=0; i<960; i+= 20) {
    line(0, 0, -480 + i, 270);      //lines that form a triangle object that rotates (BOTTOM)
  }
  lights();
  popMatrix();

  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(frameCount * cos(-0.01));
  for (int i=0; i<960; i+= 20) {    //lines that form a triangle object that rotates (TOP)
    line(0, 0, -480 + i, -270);
  }
  lights();
  popMatrix();

  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(frameCount * cos(0.01));
  for (int i=0; i<540; i+= 20) {
    line(0, 0, -480, -270 + i);    //lines that form a triangle object that rotates (LEFT)
  }
  lights();
  popMatrix();

  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(frameCount * cos(-0.01));
  for (int i=0; i<550; i+= 20) {
    line(0, 0, 480, -270 + i);     //lines that form a triangle object that rotates (RIGHT)
  }
  lights();
  popMatrix();

  lights();
  smooth();

  keyPressed();
}

void keyPressed() {            //keypressed being used to switch in between scenes

  if ( key == '1') {
    pushMatrix();
    wdt1 ++;
    if (wdt1 > 90) {
      wdt1 = 90;
    }

    translate(width/2, height/2);
    noFill();
    stroke(random(255), random(10, 100));
    strokeWeight(random(0.5, 5));
    rotateZ(frameCount * 0.05);
    box(wdt1);
    popMatrix();
  }

  if (key == '2') {
    pushMatrix();
    wdt2 ++;
    if (wdt2 > 150) {
      wdt2 = 0;
    }
    translate(width/2, height/2);
    noFill();
    stroke(random(255), random(10, 100));
    strokeWeight(random(0.5, 5));
    rotateZ(frameCount * -0.25);
    box(wdt2);
    popMatrix();
  }

  if (key == '3') {
    pushMatrix();
    wdt3 ++;
    if (wdt3 > 210) {
      wdt3 = 210;
    }
    translate(width/2, height/2);
    noFill();
    stroke(random(255), random(10, 100));
    strokeWeight(random(0.5, 5));
    rotateZ(frameCount * 0.125);
    box(wdt3);
    popMatrix();
  }

  if (key == '4') {
    pushMatrix();
    wdt4 ++;
    if (wdt4 > 270) {
      wdt4 = 0;
    }
    translate(width/2, height/2);
    noFill();
    stroke(random(255), random(10, 100));
    strokeWeight(random(0.5, 5));
    rotateZ(frameCount * -0.0625);
    box(wdt4);
    popMatrix();
  }

  if (key == '5') {
    pushMatrix();
    wdt5 ++;
    if (wdt5 > 330) {
      wdt5 = 330;
    }
    translate(width/2, height/2);
    noFill();
    stroke(random(255), random(10, 100));
    strokeWeight(random(0.5, 5));
    rotateZ(frameCount * 0.03125);
    box(wdt5);
    popMatrix();
  }

  if (key == '6') {
    pushMatrix();
    wdt6 ++;
    if (wdt6 > 390) {
      wdt6 = 390;
    }
    translate(width/2, height/2);
    noFill();
    stroke(random(255), random(10, 100));
    strokeWeight(random(0.5, 5));
    rotateZ(frameCount * -0.015625);
    box(wdt6);
    popMatrix();
  }

  if (key == '7') {
    pushMatrix();
    wdt7 ++;
    if (wdt7 > 450) {
      wdt7 = 450;
    }
    translate(width/2, height/2);
    noFill();
    stroke(random(255), random(10, 100));
    strokeWeight(random(0.5, 5));
    rotateZ(frameCount * 0.0078125);
    box(wdt7);
    popMatrix();
  }

  if (key == '8') {
    pushMatrix();
    wdt1 ++;
    if (wdt1 > 90) {
      wdt1 = 90;
    }

    translate(width/2, height/2);
    noFill();
    stroke(random(255), random(10, 100));
    strokeWeight(random(0.5, 5));
    rotateZ(frameCount * 0.05);
    box(wdt1);
    popMatrix();

    pushMatrix();
    wdt2 ++;
    if (wdt2 > 150) {
      wdt2 = 0;
    }
    translate(width/2, height/2);
    noFill();
    stroke(random(255), random(10, 100));
    strokeWeight(random(0.5, 5));
    rotateZ(frameCount * -0.25);
    box(wdt2);
    popMatrix();

    pushMatrix();
    wdt3 ++;
    if (wdt3 > 210) {
      wdt3 = 210;
    }
    translate(width/2, height/2);
    noFill();
    stroke(random(255), random(10, 100));
    strokeWeight(random(0.5, 5));
    rotateZ(frameCount * 0.125);
    box(wdt3);
    popMatrix();

    pushMatrix();
    wdt4 ++;
    if (wdt4 > 270) {
      wdt4 = 0;
    }
    translate(width/2, height/2);
    noFill();
    stroke(random(255), random(10, 100));
    strokeWeight(random(0.5, 5));
    rotateZ(frameCount * -0.0625);
    box(wdt4);
    popMatrix();

    pushMatrix();
    wdt5 ++;
    if (wdt5 > 330) {
      wdt5 = 330;
    }
    translate(width/2, height/2);
    noFill();
    stroke(random(255), random(10, 100));
    strokeWeight(random(0.5, 5));
    rotateZ(frameCount * 0.03125);
    box(wdt5);
    popMatrix();

    pushMatrix();
    wdt6 ++;
    if (wdt6 > 390) {
      wdt6 = 390;
    }
    translate(width/2, height/2);
    noFill();
    stroke(random(255), random(10, 100));
    strokeWeight(random(0.5, 5));
    rotateZ(frameCount * -0.015625);
    box(wdt6);
    popMatrix();

    pushMatrix();
    wdt7 ++;
    if (wdt7 > 450) {
      wdt7 = 450;
    }
    translate(width/2, height/2);
    noFill();
    stroke(random(255), random(10, 100));
    strokeWeight(random(0.5, 5));
    rotateZ(frameCount * 0.0078125);
    box(wdt7);
    popMatrix();
  }

  if (key == '9') {
    fill(random(255), 200);        //background flashing effect
    rect(0, 0, width, height);
  }

  if (key == '-') {                          //insects being sucked into a hole 
    pushMatrix();
    r = frameCount* random(-0.01, 0.01);
    translate(width/2, height/2);
    rotateZ(r);

    for (swoosh b : sws) {
      b.display();
      b.move();
    }
    popMatrix();
  }
}
void keyReleased() {      //scene is off when key is released

  if (key == '1') {
    key = '0';
  }
  if (key == '2') {
    key = '0';
  }
  if (key == '3') {
    key = '0';
  }
  if (key == '4') {
    key = '0';
  }
  if (key == '5') {
    key = '0';
  }
  if (key == '6') {
    key = '0';
  }
  if (key == '7') {
    key = '0';
  }
  if (key == '8') {
    key = '0';
  }
  if (key == '9') {
    key = '0';
  }
  if (key == '-') {
    key = '0';
  }
}