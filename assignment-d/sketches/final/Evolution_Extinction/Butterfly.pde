class butterfly {

  float x, y, z;
  float t, tt;
  float wriggle;
  float wiggle;
  float speed, spreed, speedo;

  butterfly() {

    x = random(width);
    y = random(height);
    spreed = random(-3, 3);
  }

  void display() {

    fft.forward(in.mix);

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

    sphere(10 + fft.getAvg(10) * 25);

    translate(40, 0);

    sphere(10 + fft.getAvg(10) * 25);
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
    x %= width;
  }
}