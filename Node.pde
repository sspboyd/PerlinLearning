class Node {
  PVector loc = new PVector(); // using PVector to keep code cleaner
  PVector gridLoc = new PVector(); // could have just used separate x & y vars
  PImage tile; // section of original image to be applied to this Node/Cell/Tile (really should be consistent with this name)
  float val; // stores perlin noise value 

  float currRot; // current Rotation - this is the angle that is rendered
  float targRot; // target Rotation - this is the angle that the tile is moving towards

  void update() {
    currRot += ((targRot-currRot) * .05); // change multiplier to speed up or slow down transitions to new targRot
  }

  void render(){
        // All this is probably better put into a render() method inside Node
    pushMatrix();
    translate(loc.x + (cellW/2), loc.y + (cellH/2));
    if (renderMode == 0) {
      if (rotationMode == 0) {
        if (val < 0.25) {
          targRot = 0;
        }
        else if (val > 0.25 && val < 0.5) {
          targRot = PI/2;
        }
        else if (val > 0.5 && val < 0.75) {
          targRot = PI;
        }
        else if (val > 0.75) {
          targRot = (PI/2)+PI;
        }
        update();
        rotate(currRot);
      }
      else if (rotationMode == 1) {
        rotate(val * TWO_PI);
      }

      image(tile, -cellW/2, -cellH/2, cellW, cellH);
    } 
    else {
      fill(val*255);
      noStroke();
      rect(-cellW/2, -cellH/2, cellW, cellH);
      fill(255);
      String pnVal = "" + nf(val, 1, 2);
      text(pnVal, -cellW/2, -cellH/2 + 18);
    }
    popMatrix();

  }
}
