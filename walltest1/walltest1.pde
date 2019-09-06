int squareSize = 40;
int cols, rows;
 
 
 
void setup() {
  fullScreen();
  cols = width / squareSize;
  rows = height / squareSize;
}
 
void draw() {
 

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {

      int x = i*squareSize;
      int y = j*squareSize;
      float f = i;
      float g = j;
      float c = 255 * (f / cols);
      float c2 = 255 * (g / rows);

      if ((i+j) % 2 == 0) {
        fill(250, round(c), round(c2));
      } else {
        fill(0);
      }
 
      rect(x, y, squareSize, squareSize);
      fill(255);
    }
  }
}
