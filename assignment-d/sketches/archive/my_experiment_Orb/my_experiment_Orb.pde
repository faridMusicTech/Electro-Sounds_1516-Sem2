ArrayList <liny> linee = new ArrayList();
ArrayList <eclipse> eclip = new ArrayList();
ArrayList <statics> statico = new ArrayList();

void setup() {

  size(1280, 720, P3D);


  linee.add(new liny());
  eclip.add(new eclipse());
  for (int i = 0; i<20; i++) {
    statico.add(new statics());
  }

  smooth();
}

void draw() {

  pushMatrix();
  fill(random(50), 10);
  noStroke();
  rect(0, 0, width, height);
  popMatrix();

  for (statics d : statico) {
    d.display(); 
    d.move();
  }

  for (liny b : linee) {
    b.display();
  }

  for (eclipse c : eclip) {
    c.display();
  }




  smooth();
}

class eclipse {

  float x, y, z;
  float expand = 30;
  float speed = 1;
  int r2;
  float r1;
  float t;
  float w, h;
  float u, tt;

  eclipse() {

    x = width/2;
    y = height/2;
  }

  void display() {

    h = height/2;
    w = width/2;
    u = noise(tt);
    u = map(u, 0, 1, 0, 75);
    tt += 0.05;


    expand += speed;
    r1 = noise(t);
    r1 = map(r1, 0, 1, 9, 20);

    t += 0.0001;

    r2 = int(random(20));

    if (expand > 180 || expand <30) {
      //expand = 30;
      speed *= -1;
    }

    pushMatrix();
    translate(w, h);
    fill(255);
    noStroke();
    sphere(u);
    popMatrix();

    translate(x, y, z);
    sphereDetail(int(r1), int(r1));

    rotateY(frameCount*0.05);
    noFill();
    stroke(255, 0, 0, 200);
    strokeWeight(1);
    sphere(expand);
    noFill();
    stroke(255, 0, 0, 150);

    scale(1.25);
    stroke(255, 50);
    rotateY(frameCount*-0.01);
    rotateY(frameCount*-0.01);
    sphere(200);

    scale(1.25);
    stroke(255, 0, 0, 150);
    rotateX(frameCount*0.01);
    rotateX(frameCount*0.01);
    rotateX(frameCount*0.01);

    sphere(200);
  }
}

class liny {

  float t;
  float t2;
  float e, ee;
  float h1;
  float speed;

  liny() {
    e = random(400, 600);
    ee = random(680, 880);
  }

  void display() {

    pushMatrix();
    translate(width/2, height/2);
    rotateZ(frameCount*0.01);

    h1 = 0;
    speed = 0; //use minim
    h1 += speed;

    strokeWeight(4);

    float x = noise(t);
    float x2 = noise(t2);
    x = map(x, 0, 1, 0, height);
    x2 = map(x2, 0, 1, 0, height);

    t += 0.01;
    t2 += 0.01;

    //stroke(0,255,0,50);
    stroke(255, 50);

    for (int i=0; i<10; i++) {
      bezier(-640, h1, 
        -240, random(-200, 200), 
        240, random(-200, 200), 
        640, h1);
    }

    rotateZ(frameCount*-0.02);
    for (int i=0; i<10; i++) {
      bezier(-640, h1, 
        -240, random(-200, 200), 
        240, random(-200, 200), 
        640, h1);
    }
    popMatrix();
  }
}

class statics {

  float x, y, z;
  float t, tt;
  float wriggle;
  float wiggle;
  float speed, spreed, speedo;


  statics() {

    x = random(width);
    y = random(height);
    spreed = random(-3, 3);
  }

  void display() {

    pushMatrix();

    wriggle = noise(t);
    wriggle = map(wriggle, 0, 1, -20, 20);
    t += 0.01;

    wiggle = noise(tt);
    wiggle = map(wiggle, 0, 1, 0, 50);
    tt += 0.1;

    translate(x, y, z);
    stroke(255);
    strokeWeight(1);
    pushMatrix();
    translate(-20, 25);
    sphere(1);
    translate(40, 0);
    sphere(1);
    popMatrix();
    bezier(0, 0, 
      wriggle, wiggle, 
      wriggle, wiggle, 
      0, 50);
    popMatrix();
  }

  void move() {

    speed = noise(t);

    y += speed;
    y += spreed; 
    y %= height;

    speedo = random(-2, 2);
    x += speedo;
  }
}