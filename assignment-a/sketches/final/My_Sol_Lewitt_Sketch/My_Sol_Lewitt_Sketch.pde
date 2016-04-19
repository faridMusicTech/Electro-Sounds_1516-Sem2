colors [] myColors = new colors[6];    //arrays of 6 items

void setup() {

  size(960, 540, P3D);

  myColors[0] = new colors(203, 16, 16);      //items in the array that consist of specific colors
  myColors[1] = new colors(30, 155, 14);
  myColors[2] = new colors(247, 148, 25);
  myColors[3] = new colors(38, 78, 219);
  myColors[4] = new colors(137, 31, 191);
  myColors[5] = new colors(232, 226, 37);

  smooth();
}

void draw() {

  background(0);

  //translate(width/2, height/2);
  //rotateZ(frameCount*0.05);
  //rotateX(frameCount*0.01);
  //rotateY(frameCount*0.01);

  translate(480, 0);
  //ellipseMode(CENTER);

  for (int i=0; i<30; i++) {

    myColors[int (random(0, 5))].col();

    int a = int (random (40, 50));

    ellipse(0, 0, 1500-a-i*50, 1500-a-i*50);    //layers of ellipses stacking up on top of each other
    noStroke();
    smooth();
  }

  noLoop();
}