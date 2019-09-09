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


void setup(){
  fullScreen(2);
}
int size;
void draw(){
    background(0);
    int[] toDraw = {1,2,3,4,5,6,7,8};
    for(int i: toDraw) {
      panelList[i].drawPrep();
      fill(255);
      circle(50,50,sin(TWO_PI * size * 0.001) * 100);
      panelList[i].drawSet();
  }
  size++;
  if(size == 1000) {
    size = 0;
  }
  delay(5);

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
