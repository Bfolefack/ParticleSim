int gridScale, grdWidth, grdHeight;
Grid griddle;
float scale = 1;
float xPan = 0 /* width/2 */;
float yPan = 0 /* height/2 */;
float truMouseX;
float truMouseY;

void setup () {
  size(500, 500);
  gridScale = 1;
  grdWidth = 500;
  grdHeight = 500;
  griddle = new Grid(grdWidth, grdHeight);
  xPan = width/2;
  yPan = height/2;
  noStroke();
  fill(0);
}

void draw () {
  truMouseX = (mouseX + xPan - width/2)/scale;
  truMouseY = (mouseY + yPan - height/2)/scale;
  
  
  //if(mouseX > width - 75){
  //  xPan += 10; 
  //} else if (mouseX < 75){
  //  xPan -= 10; 
  //}
  
  //if(mouseY > height - 75){
  //  yPan += 10; 
  //} else if (mouseY < 75){
  //  yPan -= 10; 
  //}
  
  
  background(150);
  pushMatrix();
  translate(-xPan, -yPan);
  translate(width/2, height/2);
  scale(scale);
  griddle.update();
  griddle.display();
  popMatrix();
}

void mouseWheel (MouseEvent event) {
  //float scaleAmt = 1 + (.05 * event.getCount());
  
  //scale *= scaleAmt;
  //xPan *= scaleAmt;
  //yPan *= scaleAmt;
}
