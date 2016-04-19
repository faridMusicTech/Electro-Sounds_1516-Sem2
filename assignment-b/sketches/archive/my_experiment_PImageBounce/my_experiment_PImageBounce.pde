
import codeanticode.syphon.SyphonServer;

SyphonServer syphon;

ArrayList <myShape> shady = new ArrayList();
PImage pic;


void settings() {
  size(1024, 768, P3D);
  PJOGL.profile=1;
  smooth(8);
}

void setup() {

  size(960, 540, P3D);

  pic = loadImage("fire.jpg");

  for (int i=0; i<height; i++) {
    shady.add(new myShape(i));
  }
  background(0);
  smooth();
  syphon = new SyphonServer( this, "p5-to-syphon" );
}

void draw() {

  //background(0);
  fill(abs(sin(frameCount*3*0.01)*255), abs(tan(frameCount*3*0.01)*100));
  rect(0, 0, width, height);
  noStroke();

  for (myShape b : shady) {

    b.display();
    b.move();
  }
  syphon.sendScreen();
}


class myShape {

  //GLOBAL VARIABLES

  float x, y, z;
  float speed;
  float pedopedo;
  //int index = int (pic.width*(pic.height/2));
  int index = int(random(width*height));
  float sw;
  float rz;

  ArrayList <Integer> others = new ArrayList();


  //CONSTRUCTOR

  myShape(float theY) {

    y = theY;
    int n = int(random(1, 4));
    for (int i=0; i<n; i++) {
      others.add(int(random(height)));
    }

    x = int(random(width));
    y = int(random(height));
    z = int(random(-600, 100));
    speed = random(1, 4);
    pedopedo = random(1, 3);
    sw = int(random(1, 5));
    rz = frameCount*(random(-0.01, 0.01));
  }

  //CALL FUNCTIONALITY

  void display() {

    index += pedopedo;
    index %= pic.width * pic.height;

    int rgb = pic.pixels[index];

    fill(rgb, 100);



    pushMatrix();
    translate(x, y, z);
    stroke(rgb, 200);
    strokeWeight(sw);

    for ( Integer i : others) {
      myShape t = shady.get(i);
      line(x, y, t.x, t.y);
    }

    //if (y>height/2){
    //rotateX(radians(-5));
    //}
    //else{
    //  rotateX(radians(5));
    //}

    noStroke();
    //box(20, 4, 200);
    rect(0, 0, 20, 20);
    lights();
    popMatrix();
  }

  void move() {

    rotateZ(rz);
    x += speed;

    if (x>width || x<0) {
      speed *= -1;
    }
  }
}