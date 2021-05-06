class WaveOcsillator{
  float amp, speed, intense;
  Dot[] dots;
  WaveOcsillator(float amp, float speed, float peaks, float frequency ){
     dots = new Dot[width/5];
     for (int i = 0; i < width/5; i++){
       dots[i] = new Dot(i, int(amp), int(speed), peaks, frequency);
     }
  }
  
  void update(){
    for( int i = 0; i < dots.length; i++ ){
      dots[i].update(dots);
    }
  }
  
  void display(){
    for( int i = 0; i < dots.length; i++ ){
      dots[i].display();
    }
  }
  
}
