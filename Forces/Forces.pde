Planet planet;
Planet planet2;
Planet planet3;
Planet planet4;
Planet planet5;
Planet planet6;
Planet planet7;
Planet planet8;

//zoom function
float scale = 1;
float xPan = 400;
float yPan = 300;

Planet[] planets;
void setup() {
  planet = new Planet(random(15,40));
  planet2 = new Planet(random(15,40));
  planet3 = new Planet(random(15,40));
  planet4 = new Planet(random(15,40));
  planet5 = new Planet(random(15,40));
  planet6 = new Planet(random(15,40));
  planet7 = new Planet(random(15,40));
  planet8 = new Planet(random(15,40));
  
  planets = new Planet[8];
  planets[0] = planet;
  planets[1] = planet2;
  planets[2] = planet3;
  planets[3] = planet4;
  planets[4] = planet5;
  planets[5] = planet6;
  planets[6] = planet7;
  planets[7] = planet8;
  size(800, 600);
  frameRate(10);
  noStroke();
}

void draw() {
  background(255);
  pushMatrix();
  //zoom function
  translate(-xPan, -yPan);
  translate(width/2, height/2);
  scale(scale);
  fill(100);
  for (int i = 0; i < planets.length; i++){
   planets[i].update();
   planets[i].display();
  }
  fill(0);
  ellipse(width/2.5,height/2.5, 20, 20);
  popMatrix();
  fill(255, 0, 0);
  ellipse(200, 200, 200, 200);
}

//zoom function
void keyPressed() {
  if(key == 'w'){
    scale *= 1.02;
  }
  if(key == 's'){
    scale *= .98;
  }
}

void mouseDragged ()  {
  xPan += (pmouseX - mouseX)/scale;
  yPan += (pmouseY - mouseY)/scale;
}

void mouseWheel (MouseEvent event) {
  float scaleAmt = 1 + (.05 * event.getCount());
  println(scale);
  scale *= scaleAmt;
}
