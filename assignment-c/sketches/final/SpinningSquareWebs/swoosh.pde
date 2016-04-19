class swoosh {

  float x, y, z;
  float speed = random(-5, 5);

  swoosh() {

    x = width/2;
    y = height/2;
    //speed = random(-5, 5);
  }

  void display() {

    pushMatrix();
    translate(x, y, z);
    fill(random(50));
    ellipse(0, 0, 50, 5);      //shape of insect
    popMatrix();
  }

  void move() {

    x += speed; 
    y += speed;

    if (x > width || x<0) {
      x = width/2;
      y = height/2;
    }
    if (y > height || y<0) {
      x = width/2;
      y = height/2;
    }
  }
}