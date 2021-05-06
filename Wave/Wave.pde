
WaveOcsillator wave; 

void setup(){
  size(1300, 720);
  fill(0);
  wave = new WaveOcsillator(200, 40, .2, 10);
}



void draw(){
  background(255);
  wave.update();
  wave.display();
  
}
