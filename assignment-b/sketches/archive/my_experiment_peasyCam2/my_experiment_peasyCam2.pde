import peasy.*;

PeasyCam cam;

float zz = 300;
float ee = 0;
float speedo = random(1, 10);

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, zz);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  smooth(5);
}


void draw() {
  //background(255);
  pushMatrix();
  fill(0, 10);
  translate(0, 0, -300);
  rect(-400, -400, 800, 800);
  popMatrix();
  keyPressed();

  //randomSeed(100);

  ee += speedo;

  rotateZ(frameCount*0.01);

  translate(0, 0, ee);
  if (ee>random(50, 250) || ee<random(-150, 0)) {

    speedo *= -1;
  }
  for (int x=-50; x<50; x+=(random(11, 13))) {
    for (int y=-50; y<50; y+=(random(11, 13))) {
      for (int z=-50; z<50; z+=(random(11, 13))) {
        pushMatrix();
        translate(x, y, z);
        display();
        popMatrix();
      }
    }
  }
}

void display() {

  fill(random(50, 200), 0, 0, 10);
  box(random(6, 10));
}

void keyPressed() {
  switch(key) {

    case('1'):      
    pushMatrix();
    fill(100, 0, 0, 10);
    translate(0, 0, -300);
    rect(-400, -400, 800, 800);
    popMatrix();
    break;

    case('2'):      
    pushMatrix();
    fill(100, 30);
    translate(0, 0, -300);
    rect(-400, -400, 800, 800);
    popMatrix();
    break;

    case('3'):      
    pushMatrix();
    fill(255, 20);
    translate(0, 0, -300);
    rect(-400, -400, 800, 800);
    popMatrix();
    break;

    case('4'):    
    pushMatrix();
    fill(20, 0, 70, 20);
    translate(0, 0, -300);
    rect(-400, -400, 800, 800);
    popMatrix();
    break;

    case('5'):   //randomSeed(10);
    rotateZ(frameCount*-(random(0.01, 0.1)));
    break;
  }
}