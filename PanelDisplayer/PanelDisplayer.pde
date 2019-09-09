float panelScale = 100;
wPanel pA = new wPanel(578,660,panelScale);
wPanel pB = new wPanel(521,590,panelScale);
wPanel pC = new wPanel(498,570,panelScale);
wPanel pD = new wPanel(472,680,panelScale);
wPanel pE = new wPanel(444,590,panelScale);
wPanel pF = new wPanel(420,611,panelScale);
wPanel pG = new wPanel(396,611,panelScale);
wPanel pH = new wPanel(362,570,panelScale);
wPanel pI = new wPanel(306,570,panelScale);
wPanel pJ = new wPanel(283,590,panelScale);
wPanel pK = new wPanel(183,592,panelScale);
wPanel pL = new wPanel(125,612,panelScale);
wPanel pM = new wPanel(88,592,panelScale);
wPanel pN = new wPanel(64,612,panelScale);
wPanel pO = new wPanel(0,573,panelScale);
wPanel[] panelList = {pA, pB, pC, pD, pE, pF, pG, pH, pI, pJ, pK, pL, pM, pN, pO};

ArrayList<wPanel> unusedPanels = new ArrayList<wPanel>();
ArrayList<pSquare> squares= new ArrayList<pSquare>();

void setup(){
  fullScreen(2);
  for(int i = 0; i < panelList.length; i++) { //add panels to unused arraylist
      unusedPanels.add(panelList[i]);
  }
}
int size;
void draw(){
    background(0);
    for(int i = 0; i < squares.size(); i++) {
      squares.get(i).update();
      if(squares.get(i).done) {
        squares.remove(i);
      }
    }
    int chance = int(random(100));
    if(chance > 80 && unusedPanels.size() > 0) {
      int nextPanel = int(random(unusedPanels.size()));
      wPanel next = unusedPanels.get(nextPanel);
      pSquare d = new pSquare(next);
      unusedPanels.remove(nextPanel);
      squares.add(d);
    }

}


class wPanel {
  float corner1x, corner1y, corner2x, corner2y, panelWidth, panelHeight, drawSize;
  boolean pBusy;
  wPanel(float x, float y, float dS) {
    panelWidth = 24;
    panelHeight = 21;
    corner1x = x;
    corner1y = y;
    corner2x = x + panelWidth;
    corner2y = y + panelHeight;
    drawSize = dS;
    
  }
  void drawPrep() { //Prepares to convert what is drawn and translate it to the panel
    translate(corner1x,corner1y);
    scale(24/drawSize,21/drawSize);
    pBusy = true;
  }
  void drawSet() { //Resets after drawing to panel so that you can then draw to other panels
    scale(drawSize/24,drawSize/21);
    translate(-corner1x,-corner1y);
    pBusy = false;
  }
}



class pSquare { //demo
  int time;
  color pColor;
  wPanel current;
  boolean done;
  pSquare(wPanel p) {
    pColor = color(random(255),random(255),random(255));
    time = int(panelScale);
    current = p;
    done = false;
  }
  void update() {
    current.drawPrep();
    fill(pColor);
    rect(0,panelScale-time,panelScale,time);
    current.drawSet();
    time--;
    if(time == 0) {
      done = true;
      unusedPanels.add(current);
      println("Deleting pannel " + current);
    }
    delay(2);
  }
}
