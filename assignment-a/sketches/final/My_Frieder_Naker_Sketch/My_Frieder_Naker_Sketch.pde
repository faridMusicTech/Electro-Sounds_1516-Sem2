ArrayList<Box> boxes = new ArrayList<Box>();

void setup() {  
  size(960, 540, P2D);
  boxes.add(new Box(106.0, 273.0, 59.10179, -24.553299));
  boxes.add(new Box(185.0, 157.0, -43.479202, -76.50971));
  boxes.add(new Box(390.0, 193.0, -37.579094, -5.2502975));
  boxes.add(new Box(568.0, 230.0, -67.02985, 98.33191));
  boxes.add(new Box(471.0, 82.0, 65.4283, 75.67818));
  boxes.add(new Box(281.0, 133.0, 43.91449, -13.918961));
  boxes.add(new Box(208.0, 307.0, 66.45586, 73.01987));
  boxes.add(new Box(615.0, 355.0, -41.077698, -35.556778));
  boxes.add(new Box(657.0, 126.0, 59.752304, -14.994812));
  boxes.add(new Box(448.0, 154.0, -58.93464, -97.009155)); 
  boxes.add(new Box(279.0, 213.0, -59.326935, -7.9659576));
  boxes.add(new Box(311.0, 360.0, -0.5986481, 61.615692));
  boxes.add(new Box(542.0, 375.0, -65.508865, -81.09665));
  boxes.add(new Box(694.0, 369.0, 87.4745, -21.80526));
  boxes.add(new Box(209.0, 389.0, -56.849216, 20.490631));
  boxes.add(new Box(265.0, 60.0, 28.918472, -23.926544));
  boxes.add(new Box(685.0, 246.0, -62.9408, 6.662895));
  boxes.add(new Box(814.0, 252.0, -4.1309204, 46.49623));
  boxes.add(new Box(33.0, 217.0, 4.4350586, 54.688446));
  boxes.add(new Box(41.0, 40.0, -18.83612, -2.3508759));
  boxes.add(new Box(33.0, 217.0, 4.4350586, 54.688446));
  boxes.add(new Box(41.0, 40.0, -18.83612, -2.3508759));
  boxes.add(new Box(375.0, 313.0, 22.189186, 64.68063));
  boxes.add(new Box(328.0, 244.0, 90.61136, -27.23098));
  boxes.add(new Box(542.0, 54.0, -11.619225, -80.88498));
  boxes.add(new Box(679.0, 67.0, 60.103928, 22.653107));
  boxes.add(new Box(517.0, 490.0, -37.34405, 42.890472));
  boxes.add(new Box(788.0, 155.0, 24.834045, -71.05499));
  boxes.add(new Box(693.0, 20.0, -27.135147, -6.8950424));
  boxes.add(new Box(879.0, 489.0, 85.69861, -99.34442));
  boxes.add(new Box(844.0, 468.0, 17.016434, -75.91469));
  boxes.add(new Box(29.0, 461.0, 42.81349, 33.740158));
  boxes.add(new Box(29.0, 389.0, -45.231785, -5.6214294));
  boxes.add(new Box(842.0, 18.0, -66.028824, 76.50531));
  boxes.add(new Box(313.0, 318.0, -73.26283, -59.31457));
  boxes.add(new Box(73.0, 167.0, -85.64589, -52.50858));
  boxes.add(new Box(190.0, 54.0, 19.50978, 57.357864));
  boxes.add(new Box(644.0, 467.0, -71.01847, -10.481194));
  boxes.add(new Box(738.0, 442.0, 5.344223, 23.798645));
  boxes.add(new Box(759.0, 218.0, 35.55426, 51.835022));
  boxes.add(new Box(678.0, 386.0, 51.29193, 9.686157));
  boxes.add(new Box(374.0, 449.0, 5.2314987, 2.4446945));
  boxes.add(new Box(94.0, 336.0, 26.109627, -94.04037));
  boxes.add(new Box(124.0, 396.0, -34.940186, -59.383904));
  smooth();
}

void draw() {
  background(247, 231, 190);
  for (Box b : boxes) {
    pushMatrix();
    translate(b.x1, b.y1);
    FNsquare90();
    translate(b.x2, b.y2);
    FNsquare360();
    popMatrix();
  }
}

void FNsquare360() {

  strokeWeight(5);
  stroke(0);
  line(0, 0, 80, 0);

  strokeWeight(2);
  line(0, 0, 0, 80);

  strokeWeight(5);
  line(0, 80, 80, 80);

  strokeWeight(2);
  line(80, 0, 80, 80);
}

void FNsquare90() {

  strokeWeight(2);
  stroke(80, 80, 80, 60);
  line(0, 0, 80, 0);

  strokeWeight(5);
  line(0, 0, 0, 80);

  strokeWeight(2);
  line(0, 80, 80, 80);

  strokeWeight(5);
  line(80, 0, 80, 80);
}

void mousePressed() {
  boxes.add(new Box(mouseX, mouseY, random(-100, 100), random(-100, 100)));
}

void keyPressed() {
  println(boxes);
}