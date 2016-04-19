class rotatingBox {
  float x, y, z;
  float speed;

  rotatingBox() {

    x = width/2;
    y = height/2;
  }

  void display() {
    //translate(x, y,z);

    pushMatrix();
    translate(x, y);                  //position of the rotating box

    rotateX(frameCount*0.01);
    noFill();
    //stroke(100,150);
    stroke(255, 0, 0, 150);
    strokeWeight(3);
    box(600);                        //most inner layer of box
    rotateY(frameCount*-0.01);
    rotateX(frameCount*-0.01);
    //stroke(200);
    scale(0.75);
    box(600);                        //2nd layer of box
    rotateZ(frameCount*0.01);
    rotateZ(frameCount*0.01);
    rotateX(frameCount*0.05);
    //stroke(255);
    scale(0.75);
    box(600);                        //3rd layer of box
    rotateY(frameCount*0.01);
    rotateY(frameCount*0.01);
    rotateY(frameCount*0.05);
    //stroke(255);
    scale(0.75);
    box(600);                        //4th layer of box
    rotateX(frameCount*0.01);
    rotateX(frameCount*0.01);
    rotateX(frameCount*0.05);
    //stroke(255);
    scale(0.75);
    box(600);                        //5th layer of box
    rotateY(frameCount*0.01);
    rotateY(frameCount*0.01);
    rotateY(frameCount*0.05);
    //stroke(255);
    scale(0.75);
    box(600);                        //6th layer of box
    popMatrix();
  }

  void move() {

    speed = random(1);              

    x += speed;                      //box moving to the right in the X-axis
    x%= width;
  }
}