class Dot{
  float xPos, yPos, amp, vel, pYPos;
  int arrayPos, inv;
  Dot(int arr_, int am_, int vel_){
    yPos = height/2;
    arrayPos = arr_;
    xPos = arrayPos * 5;
    inv = -1;
    amp = am_;
    vel = vel_;
  }
  
  void oscillate(){
    if(arrayPos == 0){
      if(yPos <= amp || yPos >= height - amp){
        vel *= -1;
      }
    }
  }
  
  void update(Dot[] dots){
    pYPos = yPos;
    if(arrayPos != 0){
      yPos = dots[arrayPos - 1].pYPos;
    } else {
      float d = abs(amp - yPos); 
      yPos += vel * map(d, 0, amp, 1, 2);
    }
  }
  
  void display(){
    ellipse(xPos, yPos, 5, 5);
  }
}
