int sizex = 44;
int sizey = 44;

Panel panels[] = new Panel[15];

void setup() {
  fullScreen();
  background(0, 0, 0);
  noStroke();
  panels[0] = new Panel(1080, 930);
  panels[1] = new Panel(975, 830);
  panels[2] = new Panel(935, 800);
  panels[3] = new Panel(885, 960);
  panels[4] = new Panel(835, 830);
  panels[5] = new Panel(790, 860);
  panels[6] = new Panel(745, 860);
  panels[7] = new Panel(680, 800);
  panels[8] = new Panel(575, 800);
  panels[9] = new Panel(530, 830);
  panels[10] = new Panel(345, 860);
  panels[11] = new Panel(235, 835);
  panels[12] = new Panel(165, 835);
  panels[13] = new Panel(120, 860);
  panels[14] = new Panel(0, 810);
  for (int i = 0; i < 15; i++) {
    panels[i].colourMe(255 / (i + 1), i * (255 / 15), i * i);
    panels[i].show();
  }
}
 
void draw() {
  
}

void keyPressed() {
  if (key == CODED) {
  }
}

class Panel {
  int x, y;
  int r, g, b;
  Panel(int setx, int sety) {
    x = setx;
    y = sety;
  }
  
  Panel(int setx, int sety, int setr, int setg, int setb) {
    x = setx;
    y = sety;
    r = setr;
    g = setg;
    b = setb;
  }
  
  void colourMe(int setr, int setg, int setb) {
    r = setr;
    g = setg;
    b = setb;
  }
  
  void show() {
    fill(r, g, b);
    rect(x, y, sizex, sizey);
  }
  
  void hide() {
    fill(0,  0, 0);
    rect(x, y, sizex, sizey);
  }
}
