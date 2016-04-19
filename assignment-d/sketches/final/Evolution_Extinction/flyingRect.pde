class flyingRect {

  float x;
  float y;
  float z;

  flyingRect() {

    //x = random(width);
    //y = random(height);
    //z = random(-300,300);
  }

  void display() {

    x = random(width);
    y = random(height);
    pushMatrix();

    translate(x, y, z);
    //rotateY(frameCount*0.05);
    fill(200, 0, 0, 100);
    rect(-400, y, 700, 5);
    popMatrix();
  }
}