void setup(){
  size(600,600,P3D);
  background(0);
}
  
  void draw(){
  
  for (int n=0; n<=100; n++){
    
    //rect(random(0,600),random(0,600),random(0,600),random(0,600));
    rect(n,50,60,60);
    rect(n,100,30,30);
    rect(n,150,60,60);
    rect(n,250,60,60);
    rect(n,350,60,60);
    rect(n,400,60,60);
    rect(n,500,60,60);
    rect(n,550,60,60);
    fill(0);
    stroke(random(0,255),random(0,255),random(0,255));
    
    smooth();
    
    rotateX(frameCount*0.0001);
    rotateY(frameCount*0.0001);
    
  }
  
}
  void mousePressed() {
  loop();
  }