ArrayList <myShape> run = new ArrayList();
PImage img;

void setup() {
  size(960, 540, P3D);
  img = loadImage("fire.jpg");
  for (int i=0; i<200; i++) {
    run.add(new myShape());
  } 
  background(0);
}

void draw() {
  //background(0);
  fill(0, 10);
  rect(0, 0, width, height);

  lights();
  noStroke();
  // float speed = 10;
  //background(random(abs(tan(frameCount*speed*0.001)*200)));
  // noStroke();

  for (myShape b : run) {
    b.display();
    b.move();
  }
}

class myShape {

  //GLOBAL VARIABLES

  int x, y, z;
  int col;
  float speed;
  float r, g, b;
  float angle;
  float speedR;
  int speedo;
  //int index = (width*(height/2));
  int index = int (random(width*height));

  //CONSTRUCTOR

  myShape() {

    x = int(random(width));
    y = int(random(height));
    z = int(random(-200, 200));
    speed = random(4, 12);
    speedR = random(-0.1, 0.1);
    speedo = 2;
    //index = int(random(img.width*img.height));
  }


  //CALL FUNCTIONALITY

  void display() {

    angle += speedR;
    x %= img.width;
    y %= img.height;

    index += speedo;
    index %= img.width*img.height;

    int rgb = img.pixels[index];    
    float alpha = 125;//abs(cos(frameCount*speed*0.01)*200);

    fill(rgb, alpha);

    pushMatrix();
    translate(x, y, z);
    rotateX(angle);
    // stroke(r, g, b);
    // strokeWeight(random(0, 4));
    box(100, 20, 15);
    popMatrix();
  }

  void move() {

    x += speed;

    if (x>width || x<0) {
      speed *= -1;
    }
  }
}