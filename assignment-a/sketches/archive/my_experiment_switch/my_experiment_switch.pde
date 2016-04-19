ArrayList <myBall> ballie = new ArrayList();
PImage img;
ArrayList <myLine> liny = new ArrayList();

void setup() {

  size( 960, 540, P3D);

  img = loadImage("marbleBrown.png");

  for (int i=0; i<30; i++) {
    ballie.add(new myBall());
  }

  for (int j=0; j<width/4; j++) {
    liny.add(new myLine());
  }
  background(255);
}

void draw() {

  pushMatrix();
  fill(0, 10);
  //rectMode(CENTER);
  rect(0, 0, 2000, 1200);

  popMatrix();

  for (myBall b : ballie) {

    b.display();
    b.move();
    b.bounce();
  }
  for (myLine m : liny) {
    m.display();
    m.descendascend();
  }
}

void keyPressed() {

  switch(key) {

    case('1'):
    img = loadImage("marbleBrown.png"); 
    break;
    case('2'):
    img = loadImage("marbleGreen.png"); 
    break;
    case('3'):
    img = loadImage("marbleWhite.png"); 
    break;
  }
}


class myBall {

  //GLOBAL VARIABLES

  float x, y;
  float speedX;
  float speedY;
  float r;
  float rspeed;


  //CONSTRUCTOR

  myBall() {

    x = width/2;
    y = height/2;
    speedX = random(-5, 5);
    speedY = random(-5, 5);
    rspeed = random(-1, 1);
  }


  //CALL FUNCTIONALITY

  void display() {

    r += rspeed;

    pushMatrix();
    translate(x, y);
    rotate(r);
    imageMode(CENTER);

    image(img, 0, 0, 30, 30);
    //fill(0,255,0);
    //ellipse(0, 0, 40,40);
    popMatrix();
  }

  void move() {

    x += speedX;
    y += speedY;
  }

  void bounce() {

    if (x>width || x<0) {
      speedX *= -1;
    }
    if (y>height || y<0) {
      speedY *= -1;
    }
  }
}



class myLine {

  //GLOBAL VARIABLES

  float x, y;
  float speed;
  float r;


  //CONSTRUCTOR

  myLine() {

    x = int(random(width));
    y = int(random(height));
    //speed = random(-2,2);
    speed = random(-8, 8);
  }


  //CALL FUNCTIONALITY

  void display() {

    r += speed;


    pushMatrix();
    translate(x, y);
    fill(255, 100);
    stroke(0, 255, 0, 100);
    strokeWeight(3);
    rectMode(CENTER);
    rotate(r);
    rect(0, 0, 17, 5);
    popMatrix();
  }


  void descendascend() {

    y %= height;
    y += speed ;
  }
}