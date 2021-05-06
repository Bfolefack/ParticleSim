class Planet{
  PVector pos;
  PVector vel;
  PVector acc;
  PVector direc;
  float size;
  
  Planet(float _s) {
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(-5, 5), random(-5, 5));
    acc = new PVector(0, 0);
    size = _s;
  }
  void edges(){
    if(pos.x > width){pos.x = 0;}
    if(pos.y > height){pos.y = 0;}
    if(pos.x < 0){pos.x = width;}
    if(pos.y < 0){pos.y = height;}
  }
  
  void update(){
    direc = findGravity(planets);
    direc.sub(pos);
    direc.normalize();
    acc = direc;
    vel.add(acc);
    pos.add(vel);
    vel.limit(15);
  }
  
  PVector findGravity(Planet[] planetss){
    PVector gravity = new PVector(0, 0);
    for(int i = 0; i < planetss.length; i++){
      gravity.add(planetss[i].pos);
    }
    PVector mouse = new PVector(width/2.5, height/2.5);
    mouse.mult(3);
    gravity.add(mouse);
    gravity.div(planetss.length + 3);
    return gravity;
  }
  
  void display(){
    ellipse(pos.x, pos.y, size, size);
  }
}
