int x = 100;
int y = 100;
 
void setup(){
  fullScreen();
}
 
void draw(){
  background(0);
  stroke(255);
  line(0, y, width, y);
  line(x, 0, x, height);
  text(x + "," + y, 100, 100);
}
 
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y -= 1;
    } else if (keyCode == DOWN) {
      y += 1;
    } else if (keyCode == LEFT) {
      x -= 1;
    } else if (keyCode == RIGHT) {
      x += 1;
    }
    
  } 
}
