class Cell {
  int xPos;
  int yPos;
  String type = "";
  int updated;
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
    } else if (type == "fire") {
      currColor = color(255, 0, 0);
    } else if (type == "nitro") {
      currColor = color(0, 160, 0);
    } else if (type == "lava") {
      currColor = color(255, 160, 0);
    } else if (type == "rock") {
      currColor = color(200, 200, 200);
    } else {
      currColor = color(0);
    }
    updated = 0;
  }

  boolean getMouseGridspace(float f) {
    if (dist(xPos * gridScale, yPos * gridScale, truMouseX, truMouseY) < f * gridScale) {
      return true;
    }
    return false;
  }

  void update(Grid grid) {
    if (getMouseGridspace(15) && keyPressed && key == 's') {
      type = "sand";
    } else if (getMouseGridspace(15) && keyPressed && key == 'p') {
      type = "powder";
    } else if (getMouseGridspace(15) && keyPressed && key == 'w') {
      type = "water";
    } else if (getMouseGridspace(15) && keyPressed && key == 'f') {
      type = "fire";
    } else if (getMouseGridspace(15) && keyPressed && key == 'n') {
      type = "nitro";
    } else if (getMouseGridspace(15) && keyPressed && key == 'l') {
      type = "lava";
    } else if (getMouseGridspace(15) && keyPressed && key == 'r') {
      type = "rock";
    } else if (getMouseGridspace(15) && keyPressed && key == 'e') {
      type = "";
    }
    Cell[][] neighbors = new Cell[3][3];
    for (int i = -1; i < 2; i++) {
      for (int j = -1; j < 2; j++) {
        neighbors[i + 1][j + 1] = grid.getCell(xPos + i, yPos + j);
      }
    }

    if (type == "sand") {
      sandUpdate(grid, neighbors);
    } 
    if (type == "water") {
      waterUpdate(grid, neighbors);
    }
    if (type == "powder") {
      powderUpdate(grid, neighbors);
    }
    if (type == "fire") {
      fireUpdate(grid, neighbors);
    }
    if (type == "nitro") {
      nitroUpdate(grid, neighbors);
    }
    if (type == "lava") {
      lavaUpdate(grid, neighbors);
    }
    if (type == "rock") {
      lavaUpdate(grid, neighbors);
    }
  }

  void sandUpdate(Grid grid, Cell[][] cels) {
    Cell target = null;
    while (true) {
      if (cels[1][2] != null) {
        if (fallable(cels[1][2]) && updated <= cels[1][2].updated) {
          target = cels[1][2];
          break;
        }
      }
      break;
    }
    if (target != null) {
      String temp = type;
      type = target.type;
      target.type = temp;
      grid.getCell(xPos, yPos + 1).type = temp;
      updated++;
      target.updated++;
    }
  }



  void powderUpdate(Grid grid, Cell[][] cels) {
    Cell target = null;
    ArrayList<Cell> potentialTargets = new ArrayList<Cell>();
    while (true) {
      if (fallable(cels[0][2]) || fallable(cels[1][2]) || fallable(cels[2][2])) {
        for (int i = 0; i < 3; i++) {
          if (fallable(cels[i][2]) && updated <= cels[i][2].updated) {
            potentialTargets.add(cels[i][2]);
          }
        }
        if (potentialTargets.size() > 0) {
          target = pickRandom(potentialTargets);
        }
        break;
      }
      break;
    }
    if (target != null) {
      String temp = type;
      type = target.type;
      target.type = temp;
      for (Cell c : potentialTargets) {
        c.updated++;
      }
    }
  }

  void rockUpdate(Grid grid, Cell[][] cels) {
    Cell target = null;
    ArrayList<Cell> potentialTargets = new ArrayList<Cell>();
    while (true) {
      if (fallable(cels[0][2]) || fallable(cels[1][2]) || fallable(cels[2][2])) {
        for (int i = 0; i < 3; i++) {
          if (fallable(cels[i][2]) && updated <= cels[i][2].updated) {
            potentialTargets.add(cels[i][2]);
          }
        }
        if (potentialTargets.size() > 0) {
          target = pickRandom(potentialTargets);
        }
        break;
      }
      break;
    }
    if (target != null) {
      String temp = type;
      type = target.type;
      target.type = temp;
      for (Cell c : potentialTargets) {
        c.updated++;
      }
    }
  }


  void waterUpdate(Grid grid, Cell[][] cels) {
    Cell target = null;
    ArrayList<Cell> potentialTargets = new ArrayList<Cell>();
    while (true) {
      if (fallable(cels[0][2]) || fallable(cels[1][2]) || fallable(cels[2][2])) {
        for (int i = 0; i < 3; i++) {
          if (fallable(cels[i][2]) && updated <= cels[i][2].updated + 1) {
            potentialTargets.add(cels[i][2]);
          }
        }
        //if (potentialTargets.size() > 0) {
        //  target = pickRandom(potentialTargets);
        //}
        //break;
      } 
      if (fallable(cels[0][1]) || fallable(cels[2][1])) {
        for (int i = 0; i < 3; i++) {
          if (fallable(cels[i][1]) && updated <= cels[i][1].updated && i != 1) {
            potentialTargets.add(cels[i][1]);
          }
        }
        if (potentialTargets.size() > 0) {
          target = pickRandom(potentialTargets);
        }
        break;
      }
      break;
    }
    if (target != null) {
      String temp = type;
      type = target.type;
      target.type = temp;
      for (Cell c : potentialTargets) {
        c.updated++;
      }
    }
  }

  void lavaUpdate(Grid grid, Cell[][] cels) {
    Cell target = null;
    ArrayList<Cell> potentialTargets = new ArrayList<Cell>();
    while (true) {
      if (fallable(cels[0][2]) || fallable(cels[1][2]) || fallable(cels[2][2])) {
        for (int i = 0; i < 3; i++) {
          if (fallable(cels[i][2]) && updated <= cels[i][2].updated + 1) {
            potentialTargets.add(cels[i][2]);
          }
        }
        //if (potentialTargets.size() > 0) {
        //  target = pickRandom(potentialTargets);
        //}
        //break;
      } 
      if (fallable(cels[0][1]) || fallable(cels[2][1])) {
        for (int i = 0; i < 3; i++) {
          if (fallable(cels[i][1]) && updated <= cels[i][1].updated && i != 1) {
            potentialTargets.add(cels[i][1]);
          }
        }
        if (potentialTargets.size() > 0) {
          target = pickRandom(potentialTargets);
        }
        break;
      }
      break;
    }
    if (target != null) {
      String temp = type;
      type = target.type;
      target.type = temp;
      for (Cell c : potentialTargets) {
        c.updated++;
      }
    }
  }

  void nitroUpdate(Grid grid, Cell[][] cels) {
    Cell target = null;
    ArrayList<Cell> potentialTargets = new ArrayList<Cell>();
    while (true) {
      if (fallable(cels[0][2]) || fallable(cels[1][2]) || fallable(cels[2][2])) {
        for (int i = 0; i < 3; i++) {
          if (fallable(cels[i][2]) && updated <= cels[i][2].updated) {
            potentialTargets.add(cels[i][2]);
          }
        }
        //if (potentialTargets.size() > 0) {
        //  target = pickRandom(potentialTargets);
        //}
        //break;
      } 
      if (fallable(cels[0][1]) || fallable(cels[2][1])) {
        for (int i = 0; i < 3; i++) {
          if (fallable(cels[i][1]) && updated <= cels[i][1].updated && i != 1) {
            potentialTargets.add(cels[i][1]);
          }
        }
        if (potentialTargets.size() > 0) {
          target = pickRandom(potentialTargets);
        }
        break;
      }
      break;
    }
    if (target != null) {
      String temp = type;
      type = target.type;
      target.type = temp;
      for (Cell c : potentialTargets) {
        c.updated++;
      }
    }
  }

  void fireUpdate(Grid grid, Cell[][] cels) {
    Cell target = null;
    ArrayList<Cell> potentialTargets = new ArrayList<Cell>();
    while (true) {
      if (!fallable(cels[1][0])) {
        type = "";
        return;
      }
      fallable(cels[0][2]);
      fallable(cels[1][2]);
      fallable(cels[2][2]);
      if (fallable(cels[0][0]) || fallable(cels[1][0]) || fallable(cels[2][0])) {
        for (int i = 0; i < 3; i++) {
          if (fallable(cels[i][0]) && updated <= cels[i][0].updated) {
            potentialTargets.add(cels[i][0]);
          }
        }
        //if (potentialTargets.size() > 0) {
        //  target = pickRandom(potentialTargets);
        //}
        //break;
      }
      if (fallable(cels[0][1]) || fallable(cels[2][1])) {
        for (int i = 0; i < 3; i++) {
          if (fallable(cels[i][1]) && updated <= cels[i][1].updated && i != 1) {
            potentialTargets.add(cels[i][1]);
          }
        }
        if (potentialTargets.size() > 0) {
          target = pickRandom(potentialTargets);
        }
        break;
      }
      break;
    }
    if (target != null) {
      String temp = type;
      type = target.type;
      target.type = temp;
      for (Cell c : potentialTargets) {
        c.updated++;
      }
    }
  }

  boolean fallable(Cell c) {
    ArrayList<String> fallable = new ArrayList<String>();
    if (type.equals("sand")) {
      fallable.add("");
      fallable.add("fire");
      fallable.add("water");
    }
    if (type.equals("water")) {
      fallable.add("");
      fallable.add("fire");
    }
    if (type.equals("powder")) {
      fallable.add("");
      fallable.add("fire");
      fallable.add("water");
    }
    if (type.equals("nitro")) {
      fallable.add("");
      fallable.add("water");
      fallable.add("fire");
    }
    if (type.equals("fire")) {
      fallable.add("");
      ignite(c);
    }
    if (type.equals("lava")) {
      fallable.add("");
      fallable.add("sand");
      fallable.add("powder");
      fallable.add("nitro");
      fallable.add("water");
      fallable.add("fire");
      ignite(c);
      if (c != null)
        if (c.type == "water") {
          type = "rock";
          c.type = "rock";
        }
    } 
    if (type.equals("rock")) {
      fallable.add("");
      fallable.add("sand");
      fallable.add("powder");
      fallable.add("nitro");
      fallable.add("water");
      fallable.add("fire");
      if (c != null)
        if (c.type == "lava") {
          if (random(1) < 0.02)
            type = "lava";
        }
    }
    if (c != null) {
      String s = c.type;
      for (String st : fallable) {
        if (st.equals(s)) {
          return true;
        }
      }
    }
    return false;
  }


  void ignite(Cell c) {
    if (c != null)
      if ((c.type.equals("powder") || c.type.equals("sand") || c.type.equals("nitro")) && updated <= c.updated) {
        c.type = "fire";
        c.updated++;
      }
  }

  Cell pickRandom (ArrayList<Cell> c) {
    return c.get((int)random(c.size()));
  }
}
