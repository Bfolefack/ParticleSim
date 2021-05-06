
WaveOcsillator wave; 

void setup(){
  size(1300, 720);
  fill(0);
  wave = new WaveOcsillator(200, 5);
}



void draw(){
  background(255);
  wave.update();
  wave.display();
}
