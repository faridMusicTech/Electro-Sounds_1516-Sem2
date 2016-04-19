
PImage [] BB = new PImage[3];
//PImage BB1;

bubb [] bubbly = new bubb [5];


void setup() {
  size(500, 500, P3D);
  smooth();

  for (int i=0; i<BB.length; i++) {
    BB[i] = loadImage("BB"+i+".png");
    //BB1 = loadImage("blueBB.png");
  }

  for (int i=0; i<bubbly.length; i++) {

    int index = int(random(0, BB.length));

    bubbly[i] = new bubb(BB[index], 60+i*100, height, random(40, 60));
  }
}

void draw() {
  background(255);

  for (int i=0; i<bubbly.length; i++) {
    bubbly[i].display();
    bubbly[i].ascend();
    bubbly[i].top();
  }
}


class bubb {

  float x;
  float y;
  float diameter;
  PImage img;

  bubb(PImage _img, float _x, float _y, float D) {

    img = _img;
    x = _x;
    y = _y;
    diameter = D;
  }


  void ascend() {

    y--;
    x += int(random(-5, 5));
  }

  void display() {

    //fill(200);
    //ellipse(x, y, diameter, diameter);
    imageMode(CENTER);
    image(img, x, y, diameter, diameter);
    //image(BB1, x, y, diameter, diameter);
  }

  void top() {

    if (y < diameter/2) {
      y = diameter/2;
    }
  }
}