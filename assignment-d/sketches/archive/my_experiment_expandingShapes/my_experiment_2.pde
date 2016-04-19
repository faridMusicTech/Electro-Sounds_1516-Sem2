ArrayList <mycircle> choc = new ArrayList();
ArrayList <randcircles> rc = new ArrayList();

void setup() {

  size(800, 800, P3D);
  choc.add(new mycircle());

  for (int i=0; i<10; i++) {

    rc.add(new randcircles());
  }

  //background(0);
}

void draw() {
  //background(0);

  fill(0, 10);
  rect(0, 0, width, height);

  for (mycircle b : choc) {

    b.display1();
    b.display2();
    b.display3();
    b.display4();
    b.expan();
    //b.move();
  }

  for (randcircles n : rc) {

    n.diss();
  }
}

class mycircle {

  //GLOBAL VARIABLES

  float x, y;
  float speed;
  float ex1=1;
  float ex2=50;
  float ex3=100;
  float ex4=150;
  float spe;
  float speedX = 6;
  float speedY = 4;


  //CONSTRUCTOR

  mycircle() {
    x = width/2;
    y = height/2;
    speed = 10;
    spe = 0.1;
  }

  //CALL FUNCTIONALITY

  void display1() {

    pushMatrix();
    spe --;
    translate(width/2, height/2);
    rotateZ(frameCount*spe);
    popMatrix();

    pushMatrix();
    translate(x, y);
    rotateX(frameCount*-spe);
    stroke(255, 100);
    strokeWeight(5);
    noFill();
    ellipse(0, 0, ex1, ex1);
    popMatrix();
  }

  void display2() {


    pushMatrix();
    spe --;
    translate(x, y);
    rotateY(frameCount*-spe);
    stroke(255, 100);
    strokeWeight(5);
    noFill();
    ellipse(0, 0, ex2, ex2);
    popMatrix();
  }

  void display3() {


    pushMatrix();
    spe --;
    translate(x, y);
    rotateX(frameCount*spe);
    stroke(255, 100);
    strokeWeight(5);
    noFill();
    ellipse(0, 0, ex3, ex3);
    popMatrix();
  }

  void display4() {


    pushMatrix();
    spe --;
    translate(x, y);
    rotateY(frameCount*spe);
    stroke(255, 100);
    strokeWeight(5);
    noFill();
    ellipse(0, 0, ex4, ex4);
    popMatrix();
  }

  void expan() {

    ex1 += speed;
    if (ex1 > 650) {
      ex1 = 1;
    }
    ex2 += speed;
    if (ex2 > 700) {
      ex2 = 50;
    }

    ex3 += speed;
    if (ex3 > 750) {
      ex3 = 100;
    }

    ex4 += speed;
    if (ex4 > 800) {
      ex4 = 150;
    }
  }

  void move() {

    x += speedX;
    y += speedY;

    if (x>width || x<0) {
      speedX *= -1;
    }
    if (y>height || y<0) {
      speedY *= -1;
    }
  }
}


class randcircles {

  //GLOBAL VARIABLES

  float x, y;
  float rt;

  //CONSTRUCTOR

  randcircles() {


    rt = random(20, 200);
  }

  //CALL FUNCTIONALITY

  void diss() {
    x = random (width);
    y = random(height);

    pushMatrix();
    translate(x, y);
    stroke(255, 50);
    strokeWeight(1);
    noFill();
    ellipse(0, 0, rt, rt);
    popMatrix();
  }
}