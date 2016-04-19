ArrayList <myShape> shapy = new ArrayList();
import peasy.*;

PeasyCam cam;

PImage mycol;

float autozoomer = frameCount*(abs(cos(frameCount*3*0.01)*1));
float i;

void setup(){
  size(800,800,P3D);
  
  mycol = loadImage("fire.jpg");
  
  shapy.add(new myShape());
  
  cam = new PeasyCam(this, autozoomer);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  keyPressed();
}

float r;
float speed = 0.01;

void draw(){
            
  pushMatrix();
  translate(0,0,-250);
  fill(255,10);
  rect(-800,-800,1000,1000);
  popMatrix();
  
    pushMatrix();
  translate(0,0,-2000);
   for(int i=-1500; i<1500; i+= 25){
                strokeWeight(3);
                stroke(0);
                line(i,-500,i,250);
                } 
                popMatrix();
  
  r += speed;
  
  rotateY(r);
  //randomSeed(1);
  for(int x=-50; x<50; x+=12){
  for(int y=-50; y<50; y+=12){
   for(int z=-50; z<50; z+=random(1,10)){
  for(myShape b : shapy){
  b.display(x, y, z);
  }
  }
  }
  }
  //keyPressed();
  
}

void keyPressed(){
  
  switch (key){
    
    case ('1') :background(0,255,0,random(10,200));break;
                
    case ('2') :background(255,0,0,random(10,200));break;
    
    case ('3') :background(0,0,255,random(10,200));break;
    
    case ('4') :background(255,255,0,random(10,200));break;
    
    case ('5') :background(0,255,255,random(10,200));break;
    
    case ('6') :background(255,0,255,random(10,200));break;
    
    case ('7') :background(255,random(10,200));break;
    
    case ('8') :background(0,random(10,200));break;
    
    case ('9') :background(int(random(0,255)),int(random(0,255)),int(random(0,255)));break;
    
    case ('0') : break;
    
  }
}


class myShape{
  
  //GLOBAL VARIABLES
  
  float x,y,z;
  float peedo;
  
  int index = (width*height)/2;
  
  //CONSTRUCTOR
  
  myShape(){
    
    peedo = random(1,3);
    
  }
  
  
  //CALL FUNCTIONALITY
  
  void display(float theX, float theY, float theZ){
   
    x = theX;
    y = theY;
    z = theZ;
    
    index += peedo;
    index %= mycol.width * mycol.height;
    
    int rgb = mycol.pixels[index];
    
    fill(rgb, 100);
    noStroke();
   
    pushMatrix();
    
    translate(x,y,z);
    rect(0,0,10,10);
    popMatrix();
  }


void liny(){
  
    for(int i=0; i<1000; i+= 10){
  strokeWeight(3);
  stroke(0);
  line(i,0,i,height);
  }
  
}
}