//Declare Globals
float PHI = 0.618033989;
PFont font;

int renderMode = 0;
// 0 == show the image
// 1 == show greyscale grid

int rotationMode = 0;
// 0 = rotate in 90deg increments
// 1 = fine increments (cn.val * TWO_PI)

int xRes, yRes; // these control the number of rows and columns
float cellH, cellW; // calculated values - perhaps shld have called these nodes to be consistent in naming

PImage src; // the image being manipulated 
float imgTileW; // calculated values for size of img 'tiles' based on xRes and yRes
float imgTileH;

String[] imageNames; // store names of all images to be used.
int currImgIndex = 0; // current image index

Node[] nodeField; 


void setup() {
  background(255);
  size(1200, 740);

  font = createFont("Helvetica", 12);
  textFont(font);

  // Choose a grid size/dimension // 
  // Large
  xRes = 21;
  yRes = 14;

  // Medium
  // xRes = 30;
  // yRes = 20;
  
  // Tiny
  // xRes = 60;
  // yRes = 40;

  // Tall and thin
  // xRes = 60;
  // yRes = 12;

  cellH = height/yRes;
  cellW = width/xRes;

  imageNames = new String[2]; // hardcode to number of imgs to be used.
  imageNames[0] = "image1.jpg";
  imageNames[1] = "image2.jpg";

  sketch_init();
}

void draw() {
  for (Node n : nodeField) { // update noise value for each cell
    n.val = noise((n.gridLoc.x  + frameCount/10) * .1, (n.gridLoc.y - frameCount/30) * .1);
  }

  for (int i=0; i < nodeField.length; i++) {
    Node cn = nodeField[i];
    cn.render();
  }

}

void sketch_init() { // called first during setup and then evertime a new image is loaded (via mouseReleased)
  if (currImgIndex>imageNames.length-2) {
    currImgIndex = 0;
  }
  else {
    currImgIndex = currImgIndex + 1;
  }
  println("currImgIndex: " + currImgIndex);
  src = loadImage(imageNames[currImgIndex]);

  imgTileW = src.width/xRes;
  imgTileH = src.height/yRes;

  nodeField = new Node[xRes * yRes];

  for (int i=0; i < nodeField.length; i++) {
    Node n = new Node();

    n.gridLoc.x = i % xRes;
    n.gridLoc.y = floor(i / xRes);

    n.loc.x = n.gridLoc.x * cellW;
    n.loc.y = n.gridLoc.y * cellH;

    n.tile = src.get(int(n.gridLoc.x * imgTileW), int(n.gridLoc.y * imgTileH), int(imgTileW), int(imgTileH));

    nodeField[i] = n;
  }
}








void keyPressed() {
  if (key == 'S') screenCap();

  if (key == 'g' || key == 'G') { // show grid view of noise field
    if (renderMode == 1 ) {
      renderMode = 0;
    }
    else {
      renderMode = 1;
    }
  }
}

void screenCap() {
  // save functionality in here
  String outputDir = "out/";
  String sketchName = "sspb-perlinLearning-";
  String dateTime = "" + year() + month() + day() + hour() + second();
  String fileType = ".tif";
  String fileName = outputDir + sketchName + dateTime + fileType;
  save(fileName);
  println("Screen shot taken and saved to " + fileName);
}

void mousePressed() {
  sketch_init();
}

void mouseMoved() {
  for (Node n : nodeField) {
    if (dist(mouseX, mouseY, n.loc.x, n.loc.y) < 50) {
      //n.val = noise((n.gridLoc.x  + frameCount/10) * 0.75, (n.gridLoc.y) * .75);
      n.targRot=2*TWO_PI;
      n.update();
    }
  }
}