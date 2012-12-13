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
}
