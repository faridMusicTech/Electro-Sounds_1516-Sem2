ArrayList <myLine> liny = new ArrayList();

void setup() {
  size(800, 800, P3D);

  for (int i=0; i<50; i++) {
    liny.add(new myLine());
  }
  smooth();
  //background(0);
}

float bzz = 10;
float speed;

void draw() {

  pushMatrix();
  translate(0, 0);
  fill(abs(cos(frameCount*3*0.01)*100), 10);
  rectMode(CORNER);
  rect(0, 0, 800, 800);
  popMatrix();

  pushMatrix();
  //speed = int (frameCount * random(1,2));
  speed = 2;
  bzz += speed;

  if (bzz >700) {
    bzz = 10;
  }
  popMatrix();

  pushMatrix();
  translate(400, 400);
  noFill();
  stroke(255, 0, 0);
  strokeWeight(1);
  rotateY(frameCount*0.1);
  ellipse(0, 0, bzz, bzz);
  popMatrix();

  pushMatrix();
  translate(400, 400);
  fill(255, 40, 0, 90);
  noStroke();
  rotateY(frameCount*-0.07);
  pushMatrix();
  translate(500, 400);
  rotateX(frameCount*0.1);
  popMatrix();
  rectMode(CENTER);
  rect(100, 0, 30, 30);
  popMatrix();

  pushMatrix();
  translate(400, 400);
  fill(255, 40, 0, 100);
  noStroke();
  rotateX(frameCount*0.1);
  ellipse(0, -100, 35, 35);
  popMatrix();

  pushMatrix();
  translate(400, 400);
  fill(255, 40, 0, 100);
  noStroke();
  rotateY(frameCount*0.1);
  rotateX(frameCount*0.1);
  ellipse(-100, -100, 40, 40);
  popMatrix();

  pushMatrix();
  translate(400, 400);
  fill(255, 40, 0, 100);
  noStroke();
  rotateX(frameCount*0.1);
  rotateY(frameCount*0.1);
  ellipse(100, 100, 40, 40);
  popMatrix();

  pushMatrix();
  translate(0, 0);
  for (myLine b : liny) {
    b.display();
    b.move();
  }

  popMatrix();
}


class myLine {

  //global variables

  float tx, ty, bx, by;
  float x, y;
  float speedo;

  //constructor

  myLine() {

    tx = int (random(1, 3));
    ty = int (random(4, 5));
    x = random(width);
    y = random(height);
    speedo = random(1, 5);
  }

  //call functionality

  void display() {

    translate(0, 0);
    noStroke();
    fill(random(255), random(255), random(255));
    strokeWeight(3);
    rect(x, y, tx, ty);
  }

  void move() {

    y += speedo;
    y %= height;
    if (y > 780) {
      fill(random(255), random(255), random(255));
      ellipse(x, 750, 20, 5);
    }
  }
}