class butterfly {

  float x, y, z;                      //global variables for butterfly class
  float t, tt;
  float wriggle;
  float wiggle;
  float speed, spreed, speedo;

  butterfly() {                  //constructor for butterfly class

    x = random(width);
    y = random(height);
    spreed = random(-3, 3);
  }

  void display() {              //function for butterfly class

    fft.forward(in.mix);            

    pushMatrix();

    wriggle = noise(t);                        //calls the noise function
    wriggle = map(wriggle, 0, 1, -20, 20);    //maps ranges from (0 to 1 bits) to (-20 to 20 value)
    t += 0.01;                                //speed for noise

    wiggle = noise(tt);
    wiggle = map(wiggle, 0, 1, 0, 50);        //wiggle is "0"
    tt += 0.1;                                

    translate(x, y, z);                      //position of body of butterfly
    stroke(255);
    strokeWeight(1);
    
    pushMatrix();
    translate(-20, 25);                      //position of left wing of butterfly
    sphere(10 + fft.getAvg(10) * 25);        //expansion of wing with sound reaction
    
    translate(40, 0);                        //position of right wing of butterfly
    sphere(10 + fft.getAvg(10) * 25);
    popMatrix();
    
    bezier(0, 0,                             //body of butterfly "wriggling"
      wriggle, wiggle, 
      wriggle, wiggle, 
      0, 50);
    popMatrix();
  }

  void move() {

    speed = noise(t);

    y += speed;                  
    y += spreed;                   //movement of butterfly along the Y-axis
    y %= height;

    speedo = random(-2, 2);
    x += speedo;                   //movement of butterfly along the X-axis
    x %= width;
  }
}