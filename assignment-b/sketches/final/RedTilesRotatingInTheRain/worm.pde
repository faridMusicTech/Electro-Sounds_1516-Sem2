class worm {

  float x;
  float y;
  int col;
  float speed;
  float speedo;
  float yolo;
  float yoli;

  worm(float yolol, float yolok) {

    x = random(width);
    y = random(height);
    col = color(random(255), random(255), random(255));
    speed = random(1, 4);
    speedo = 1;
    yolo = yolol;
    yoli = yolok;
  }

  void display() {     

    fill(230, 10);
    //fill(random(100),0,0,100);
    //stroke(230,20);
    pushMatrix();
    translate(x, y);
    //noStroke();
    strokeWeight(0.1);
    stroke(230, 10);
    for (int i=0; i<fft.avgSize(); i++) {
      //noFill();
      rect(0 - fft.getAvg(i) * 50, 0, yolo, yoli + fft.getAvg(i) * 50);
    }
    popMatrix();
  }

  void move() {

    y += speed;
    x += speedo;
    y %= height;
    x %= width;
  }
}