import peasy.*;
PeasyCam cam;

void setup(){
 
  size(800,800,P3D);
  cam = new PeasyCam(this, 300);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void draw(){
  
  background(0);
  randomSeed(int(random(0,3)));
  //randomSeed(3);
  pushMatrix();
  rotateX(frameCount*0.01);
  
  for(int x=-100; x<100; x+=12){
    for(int y=-20; y<20; y+=12){
      for(int z=-100; z<100; z+=12){
  pushMatrix();
  translate(x,y,z);
  stroke(100);
  tiles();
  popMatrix();
  }
  }
  }
  popMatrix();
  
  keyPressed();
  
}

void tiles(){
  
  float r = random(-0.01,0.01);
  
  pushMatrix();
  rotateX(frameCount*r);
  rotateY(frameCount*r);
  rotateZ(frameCount*r);
  //box(random(10));
  box(random(10));
  popMatrix();
  
}

void keyPressed(){
  switch(key){
    
    case('1') : pushMatrix();
    translate(0,0);
    fill(255,0,0,100);
    rect(-250,-250, 500,500);
    popMatrix();break;
    case('2') : pushMatrix();
    translate(0,0);
    fill(0,255,255,75);
    rect(-250,-250, 500,500);
    popMatrix();break;
    case('3') : rotateZ(100); break;
    case('4') : pushMatrix();
    translate(0,0);
    fill(255);
    rect(-250,-250, 500,500);
    popMatrix();break;
  } 
}