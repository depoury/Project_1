int x = 0;
int y = 0;

void setup() {
  fullScreen();
  background(255, 255, 255);
  stroke(0, 0, 0);
}
 
void draw() {
  background(255, 255, 255);
  line(x, 0, x, height);
  line(0, y, width, y);
}

void keyPressed() {
  x += 1;
  y += 1;
}
