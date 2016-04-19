void setup() {
  size(500, 500, P2D);
}

void draw() {
  background(0);

  loadPixels();

  for (int i=0; i<pixels.length; i++) {
    pixels[i] = color (0, random(0, 255), random(0, 255));
  }

  updatePixels();

  loadPixels();
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {

      float d = dist(x, y, width/2, height/2);
      pixels[x+y * width] = color(random(d), random(d), random(d));
    }
  }
  updatePixels();
}