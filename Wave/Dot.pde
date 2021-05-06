class Dot{
  float xPos, yPos, amp, vel, pYPos, peaks, frequency;
  int arrayPos, inv, intense;
  Dot(int arr_, int am_, int vel_, float pea_, float fre_){
    arrayPos = arr_;
    xPos = arrayPos * 5;
    inv = -1;
    amp = am_;
    vel = vel_;
    yPos = height/2 - 50;
    peaks = pea_;
    frequency = fre_;
    
  }
  
  void update(Dot[] dots){
    pYPos = yPos;
    if(arrayPos != 0){
      yPos = dots[arrayPos - 1].pYPos;
    } else {
      float d = abs(amp - yPos);
      translate(0, -height/2 + 70);
      yPos += sin((frameCount/vel) * frequency) * vel * peaks;
    }
  }
  
  void display(){
    ellipse(xPos, yPos, 5, 5);
  }
}
