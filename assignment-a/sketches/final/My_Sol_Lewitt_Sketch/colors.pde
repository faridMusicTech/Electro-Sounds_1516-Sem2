class colors {

  float x = 0;
  float y = 0;
  float z = 0;

  colors(float R, float G, float B) {

    x = R;
    y = G;
    z = B;
  } 

  void col() {
    fill(x, y, z);
  }
}