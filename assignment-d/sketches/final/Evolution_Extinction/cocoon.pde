class cocoon {

  float x, y, z;
  float expand = 30;
  float speed = 1;
  int r2;
  float r1;
  float t;
  float w, h;
  float u, tt;

  cocoon() {

    x = width/2;
    y = height/2;
  }

  void display() {

    fft.forward(in.mix);

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

    pushMatrix();              //position of cocoon
    translate(w, h);
    fill(255);
    noStroke();
    sphere(u);                //most inner sphere(heart)
    popMatrix();

    translate(x, y, z);
    sphereDetail(int(r1), int(r1));      //changes of the detail in stroke and shape

    rotateY(frameCount*0.05);          
    noFill();
    stroke(255, 0, 0, 200);
    strokeWeight(1);
    sphere(expand);                //2nd layer of sphere
    noFill();
    stroke(255, 0, 0, 150);

    scale(1.25);
    stroke(255, 50);
    rotateY(frameCount*-0.01);
    rotateY(frameCount*-0.01);
    sphere(200);                    //3rd layer of sphere

    scale(1.25);
    stroke(255, 0, 0, 150);
    rotateX(frameCount*0.01);
    rotateX(frameCount*0.01);
    rotateX(frameCount*0.01);

    for (int i = 0; i<fft.avgSize(); i++) {
      sphere(200 + fft.getAvg(i)*(50) );    //4th outer most layer of sphere with sound reaction
    }
  }
}