import peasy.*;

PeasyCam cam;

void setup(){
  size(800,800,P3D);
  cam = new PeasyCam(this, 300);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  
}

float zz = -500;
float speed = 3;

void draw(){
  pushMatrix();
  translate(0,0,-500);
  fill(0,10);
  rect(-500,-500,1000,1000);
  popMatrix();
  randomSeed(1);
  zz += speed;
  
  if(zz > 250){
   speed *= -1; 
  }
  
  if(zz < -500){
   speed *= -1; 
  }
  
  translate(0, 0, zz);
  rotateY(frameCount*0.01);
  rotateX(frameCount*0.01);
  
  
  for(int x=-50; x<50; x+=14){
    for(int y=-50; y<50; y+=14){
      for(int z=-50; z<50; z+=14){
    pushMatrix();
    translate(x, y, z);
    tiles();
    popMatrix();
  }
    }
  }
  
}


void tiles(){
  float r = random(-0.2,0.2);
  fill(random(25,170));
  //noStroke();
  stroke(0,50);
  pushMatrix();
  rotateX(frameCount*r);
  rotateY(frameCount*r);
  rotateZ(frameCount*r);
  box(random(9));
  popMatrix();
}