int testx = 578;
int testy = 660;
int i = 0;

void setup(){
  fullScreen(2);
  textAlign(LEFT, TOP);
  textSize(16);
}

void draw(){
  background(0);
  stroke(255,0,(i % 2) * 255);
  line(testx + 18, i + testy, testx + 24, i + testy);
  text(i,472,680);
  delay(3000);
  i++;
  if (i == 22) {
    i = 0;
  }
  
}
