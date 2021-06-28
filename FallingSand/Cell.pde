class Cell {
  int xPos;
  int yPos;
  String type = "";
  String nextType = "";
  color currColor = color(0);
  int borders;

  Cell(int x_, int y_) {
    xPos = x_;
    yPos = y_;
  }

  void display() {

    if (type == "sand") {
      currColor = color(255, 225, 180);
    } else if (type == "powder") {
      currColor = color(255, 180, 0);
    } else if (type == "water") {
      currColor = color(0, 0, 255);
    }else {
      currColor = color(0);
    }
  }

  boolean getMouseGridspace(float f) {
    if (dist(xPos * gridScale, yPos * gridScale, truMouseX, truMouseY) < f * gridScale) {
      return true;
    }
    return false;
  }

  void update(Grid grid) {
    if (getMouseGridspace(10) && keyPressed && key == 's') {
      nextType = "sand";
    } else if (getMouseGridspace(10) && keyPressed && key == 'p') {
      nextType = "powder";
    }  else if (getMouseGridspace(10) && keyPressed && key == 'w') {
      nextType = "water";
    }
    if (type == "sand") {
      if (grid.getCell(xPos, yPos + 1) != null) {
        if (grid.getCell(xPos, yPos + 1).type == "") {
          nextType = "";
          grid.getCell(xPos, yPos + 1).nextType = "sand";
        }
      }
    } else if (type == "powder") {
      boolean b = false;
      boolean bl = false;
      boolean br = false;
      if (grid.getCell(xPos, yPos + 1) != null) {
        if (grid.getCell(xPos, yPos + 1).type == "") {
          b = true;
        }
      }
      if (grid.getCell(xPos + 1, yPos + 1) != null) {
        if (grid.getCell(xPos + 1, yPos + 1).type == "") {
          br = true;
        }
      }
      if (grid.getCell(xPos - 1, yPos + 1) != null) {
        if (grid.getCell(xPos - 1, yPos + 1).type == "") {
          bl = true;
        }
      }
      if (b) {
        nextType = "";
        grid.getCell(xPos, yPos + 1).nextType = "powder";
      } else if (bl && br) {
        if (random(1) < 0.5) {
          nextType = "";
          grid.getCell(xPos + 1, yPos + 1).nextType = "powder";
        } else {
          nextType = "";
          grid.getCell(xPos - 1, yPos + 1).nextType = "powder";
        }
      } else if (bl) {
        nextType = "";
        grid.getCell(xPos - 1, yPos + 1).nextType = "powder";
      } else if (br) {
        nextType = "";
        grid.getCell(xPos + 1, yPos + 1).nextType = "powder";
      } 
    }  else if (type == "water") {
      boolean b = false;
      boolean bl = false;
      boolean br = false;
      if (grid.getCell(xPos, yPos + 1) != null) {
        if (grid.getCell(xPos, yPos + 1).type == "") {
          b = true;
        }
      }
      if (grid.getCell(xPos + 1, yPos) != null) {
        if (grid.getCell(xPos + 1, yPos).type == "") {
          br = true;
        }
      }
      if (grid.getCell(xPos - 1, yPos) != null) {
        if (grid.getCell(xPos - 1, yPos).type == "") {
          bl = true;
        }
      }
      if (b) {
        nextType = "";
        grid.getCell(xPos, yPos + 1).nextType = "water";
      } else if (bl && br) {
        if (random(1) < 0.5) {
          nextType = "";
          grid.getCell(xPos + 1, yPos).nextType = "water";
        } else {
          nextType = "";
          grid.getCell(xPos - 1, yPos).nextType = "water";
        }
      } else if (bl) {
        nextType = "";
        grid.getCell(xPos - 1, yPos).nextType = "water";
      } else if (br) {
        nextType = "";
        grid.getCell(xPos + 1, yPos).nextType = "water";
      } 
    }
  }
}
