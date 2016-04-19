class Box {
  float x1, y1;
  float x2, y2;
  Box(float theX1, float theY1, float theX2, float theY2 ) {
    x1 = theX1;
    y1 = theY1;
    x2 = theX2;
    y2 = theY2;
  }
  String toString() {
    return "["+x1+","+y1+","+x2+","+y2+"]";    //printing out a line of coordinates for the position of boxes
  }
}