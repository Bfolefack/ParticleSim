class Grid {
  Cell[][] grid;
  int gridHeight, gridWidth;
  float xPos, yPos;
  PImage img;
  
  Grid(int gw_, int gh_){
    grid = new Cell[gh_][gw_];
    gridHeight = gw_;
    gridWidth = gh_;
    img = createImage(gridWidth, gridHeight, RGB);
    for(int i = 0; i < gridWidth; i++){
      Cell[] tempCells = new Cell[gridHeight];
      for(int j = 0; j < gridHeight; j++){
        tempCells[j] = new Cell(i, j);
      }
      grid[i] = tempCells;
    }
  }
  
  
  
  void display(){
    for(int i = 0; i < gridWidth; i++){
      for(int j = 0; j < gridHeight; j++){   
          grid[i][j].display();
      }
    }    
    int count = 0;
    for(int i = 0; i < gridHeight; i++){
      for(int j = 0; j < gridWidth; j++){
        img.pixels[count] = grid[j][i].currColor;
        count++;
      }
    }
    img.updatePixels();
    image(img, 0, 0);
  }
  
  void update() {
    for(int i = 0; i < gridWidth; i++){
      for(int j = 0; j < gridHeight; j++){   
          grid[i][j].update(this);
      }
    }
    for(int i = 0; i < gridWidth; i++){
      for(int j = 0; j < gridHeight; j++){   
          grid[i][j].type = grid[i][j].nextType;
      }
    }
  }
  
  Cell getCell (float x_, float y_) {
    int x = (int) x_;
    int y = (int) y_;
    if (x >= 0 && y >= 0 && x < gridWidth && y < gridHeight) {
      return grid[x][y];
    }
    return null;
  }
}
