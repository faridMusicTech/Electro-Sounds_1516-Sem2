marbles mb;
marbles mb2;
PImage marble;

void setup() {

  size(600, 600);
  marble = loadImage("marbleWhite.png");
  mb = new marbles(width/2, height/2);
  mb2 = new marbles(width/3, height/3);
}


void draw() {
  background(255);

  mb.display();
  mb.ascend();

  mb2.display();
  mb2.ascend();
}


class marbles {

  //GLOBAL VARIABLES

  float x;
  float y;


  //CONSTRUCTOR
  marbles(float _x, float _y) {

    x = _x;
    y = _y;
  }



  //CALL FUNCTIONALITY

  void display() {

    fill(0);
    //ellipse(x, y, 50, 50);
    image(marble, x, y, 100, 100);
  }

  void ascend() {

    y --;
    x += random(-5, 5);
  }

  //void stoptop(){
  // if(y < 50
  //}
}