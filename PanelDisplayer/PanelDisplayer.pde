WPanel pA = new WPanel(578,660,100);
WPanel pB = new WPanel(521,590,100);
WPanel pC = new WPanel(498,570,100);
WPanel pD = new WPanel(472,680,100);
WPanel pE = new WPanel(444,590,100);
WPanel pF = new WPanel(420,611,100);
WPanel pG = new WPanel(396,611,100);
WPanel pH = new WPanel(362,570,100);
WPanel pI = new WPanel(306,570,100);
WPanel pJ = new WPanel(283,590,100);
WPanel pK = new WPanel(183,592,100);
WPanel pL = new WPanel(125,612,100);
WPanel pM = new WPanel(88,592,100);
WPanel pN = new WPanel(64,612,100);
WPanel pO = new WPanel(0,573,100);
WPanel[] panelList = {pA, pB, pC, pD, pE, pF, pG, pH, pI, pJ, pK, pL, pM, pN, pO};
int[] toDraw = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14};
void setup(){
  fullScreen(2);
}
int size;
void draw(){
    background(0);
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


class WPanel {
  float corner1x, corner1y, corner2x, corner2y, panelWidth, panelHeight, drawSize;
  WPanel(float x, float y, float dS) {
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
  }
  void drawSet() { //Resets after drawing to panel so that you can then draw to other panels
    scale(drawSize/24,drawSize/21);
    translate(-corner1x,-corner1y);
  }
}
