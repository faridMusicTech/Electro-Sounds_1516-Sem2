class statics {

  float t;
  float t2;
  float e, ee;
  float h1;
  float speed;

  statics() {
    e = random(400, 600);
    ee = random(680, 880);
  }

  void display() {

    pushMatrix();
    translate(width/2, height/2);        //position of static
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

    for (int i=0; i<10; i++) {            //10 bezier lines drawing continuously and randomly
      bezier(-640, h1,                   
        -240, random(-200, 200), 
        240, random(-200, 200), 
        640, h1);
    }

    rotateZ(frameCount*-0.02);            //rotation of the shape
    for (int i=0; i<10; i++) {
      bezier(-640, h1,                    //2nd similar shape
        -240, random(-200, 200), 
        240, random(-200, 200), 
        640, h1);
    }
    popMatrix();
  }
}