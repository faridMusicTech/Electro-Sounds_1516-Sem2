class whirlPool {

  float w, e, r;

  whirlPool() {

    w = width/2;
    e = height/2;
  }

  void display() {

    pushMatrix();
    translate(w, e, r);
    for (int i=0; i<700; i++) {
      rotate(frameCount*0.001);
      fill(200, 0, 0, 100);
      ellipse(i, 0, 10, 10);
    }
    popMatrix();
  }
}