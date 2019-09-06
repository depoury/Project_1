int squareSize = 40;
int x = 0;
 
void setup() {
  fullScreen();
  noStroke();
  background(255, 255, 255);
  fill(0, 0, 0);
}
 
void draw() {
  background(255, 255, 255);
  line(x, 0, x, height);
}

void keyPressed() {
  x += 1;
}
