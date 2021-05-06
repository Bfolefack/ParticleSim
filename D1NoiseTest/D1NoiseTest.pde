//Establish Scaling Variables
float scale = 1;
float xPan;
float yPan;



void setup (){
  size(1300, 100);
  noStroke();
  yPan = height/2;
  xPan  = width/2;
}

void draw (){
  background(255);
  fill(0); 
  for( int i = 0; i < width/2; i++ ){
   float x = noise(i * .02);
   
   x *= 100;
   rect(i * 2, x, 2, 2);
  }
  
}
