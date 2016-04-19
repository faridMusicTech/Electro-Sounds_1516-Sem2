float x = 200;
float speed=3;

void setup(){
  size(400,400,P3D);
  noFill();
  smooth();
  strokeWeight(1);
  
}

void draw(){
  float move = frameCount*0.01;
  speed += 5;
  background(255);
  
  for(int i=0; i<30; i++){
  
  bezier(200+speed, height,noise(2,i,move)*400, noise(3,i,move)*height,noise(2,i,move)*400, noise(3,i,move)*height, 200+speed, 0);
  }
}