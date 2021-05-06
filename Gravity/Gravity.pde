Planet planet;
Planet planet2;
Planet planet3;
Planet planet4;
Planet planet5;
Planet planet6;
Planet planet7;
Planet planet8;
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
  noStroke();
}

void draw() {
  background(255);
  fill(100);
  for (int i = 0; i < planets.length; i++){
   planets[i].update();
   planets[i].display();
  }
  fill(0);
  ellipse(width/2.5,height/2.5, 20, 20);
}
