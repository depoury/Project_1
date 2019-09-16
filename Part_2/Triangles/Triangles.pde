//0 is UP
//-(PI / 2.0) is LEFT
//PI is DOWN
//(PI / 2.0) is RIGHT
int LEFT = 676;
int RIGHT = 1023;
int TOP = 0;
int BOTTOM = 767;
team a;
ball b;

float ballX = 800;
float ballY = 400;

panel O = new panel(0, 573);
panel N = new panel(64, 612, O);
panel M = new panel(88, 592, N);
panel L = new panel(125, 612, M);
panel K = new panel(183, 592, L);
panel J = new panel(283, 590, K);
panel I = new panel(306, 570, J);
panel H = new panel(362, 570, I);
panel G = new panel(396, 611, H);
panel F = new panel(420, 611, G);
panel E = new panel(444, 590, F);
panel D = new panel(472, 680, E);
panel C = new panel(498, 570, D);
panel B = new panel(521, 590, C);
panel A = new panel(578, 660, B);

prey test = new prey(0);

void setup() {
  //fullScreen(1);
  frameRate(40);
  size(1024, 768);
  stroke(0, 0, 0);
  /*
  test.x = 400;
  test.y = 400;
  test.angle = (0); 
  */
  a = new team(11);
  //a.info();
  b = new ball();
}

void draw() {
  background(255, 255, 255);
  stroke(0, 0, 0);
  fill(0, 255, 0);
  rect(LEFT, TOP, (RIGHT - LEFT), (BOTTOM - TOP));
  //test.move();
  //test.drawMe();
  b.move();
  //b.drawMe();
  a.approach(ballX, ballY);
  A.drawMe();
  //a.info();
  //b.info();
  delay(5);
}

class team {
  int size;
  int UID;
  prey members[];

  team() {
    this.UID = 0;
    this.size = 11;
    this.members = new prey[this.size];
    for (int i = 0; i < this.size; i++) {
      this.members[i] = new prey(this.UID++);
    }
  }

  team(int n) {
    this.size = n;
    this.members = new prey[this.size];
    for (int i = 0; i < this.size; i++) {
      this.members[i] = new prey(this.UID++);
    }
  }

  void info() {
    for (int i = 0; i < this.size; i++) {
      if (!this.members[i].stop) {
        this.members[i].info(i);
      } else {
        this.members[i] = new prey(this.UID++);
      }
    }
  }
  
  void drawAll() {
    for (int i = 0; i < this.size; i++) {
      if (!this.members[i].stop) {
        this.members[i].drawMe();
      } else {
        this.members[i] = new prey(this.UID++);
      }
    }
  }
  
  void approach(float cx, float cy) {
    for (int i = 0; i < this.size; i++) {
      if (!this.members[i].stop) {
        this.members[i].calculateAngle(cx, cy);
        this.members[i].move();
      } else {
        this.members[i] = new prey(this.UID++);
      }
    }
    this.drawAll();
  }
}

class prey {
  boolean stop = false;
  color myColour = color(random(30, 225), random(30, 225), random(30, 225));
  float x;
  float y;
  int myID;
  
  float x2;
  float x3;
  
  float y2;
  float y3;
  
  //float oldAngle;
  float angle;
  
  prey (int ID) {
    this.myID = ID;
    this.x = random(LEFT + 20, RIGHT - 20);
    this.y = random(TOP + 20, BOTTOM - 20);
    //this.oldAngle = -55;
  }

  
  void info(int ID) {
    println("I am triangle " + ID + " and I am in Position (x,y): (" + this.x + ", " + this.y + ")");
  }
  
  void calculateAngle(float cx, float cy) {
    
    if (abs(this.x - cx) < 3 && abs(this.y - cy) < 3) {
      //println("Triangle " + this.myID + " Finished.");
      this.stop = true;
      A.light(this.myColour);
      return;
    }
    
    /*
    if (abs((cx - this.x) / (this.y - cy)) > 1) {
      println("CX: " + cx + " | CY: " + cy + " | X: " + this.x + " | Y: " + this.y + " | Total: " + abs((cx - this.x) / (this.y - cy)));
    } else {
      this.angle = atan((cx - this.x) / (this.y - cy));
    }
    */
    
    this.angle = atan((cx - this.x) / (this.y - cy));
   
    if (this.y < cy) {
      this.angle += PI;
    }
    
    /*
    if (this.oldAngle == -55) {
      this.oldAngle = this.angle;
    }
    
    if (this.oldAngle != this.angle) {
      if (this.oldAngle < this.angle - (PI / 2)) {
        this.oldAngle -= min((PI / 60), abs((this.oldAngle - this.angle)));
      } else {
        this.oldAngle += min((PI / 60), abs((this.oldAngle - this.angle)));
      }
    }
    this.angle = this.oldAngle;
    */
  }
  
  void calculateVertices() {
    this.x2 = this.x - (15 * sin(angle)) + (5 * cos(angle));
    this.x3 = this.x - (15 * sin(angle)) - (5 * cos(angle));
    this.y2 = this.y + (15 * cos(angle)) + (5 * sin(angle));
    this.y3 = this.y + (15 * cos(angle)) - (5 * sin(angle));
  }
  
  void drawMe() {
    this.calculateVertices();
    strokeWeight(1);
    stroke(0, 0, 0);
    fill(this.myColour);
    this.x = (int) this.x;
    this.y = (int) this.y;
    this.x2 = (int) this.x2;
    this.y2 = (int) this.y2;
    this.x3 = (int) this.x3;
    this.y3 = (int) this.y3;
    triangle(this.x, this.y, this.x2, this.y2, this.x3, this.y3);
  }
  
  void move() {
    //println(angle);
    this.x += (2 * sin(angle));
    this.y -= (2 * cos(angle));
  }
}

class ball {
  color myColour; 
  int speedx = 3;
  int speedy = 3;
  
  ball() {
    ballX = LEFT + (RIGHT - LEFT) / 2;
    ballY = TOP + (BOTTOM - TOP) / 2;
    this.myColour = color(random(100, 245), random(100, 245), random(100, 245));
  }
  
  ball(int nx, int ny) {
    ballX = nx;
    ballY = ny;
    this.myColour = color(random(100, 245), random(100, 245), random(100, 245));
  }
  
  void move() {
    speedx += random(-3, 3);
    speedy += random(-3, 3);
    ballX += speedx;
    ballY += speedy;
    
    if (ballX < LEFT + 10) {
      ballX += (int) abs(2 * speedx);
    } else if (ballX > RIGHT - 10) {
      ballX -= (int) abs(2 * speedx);
    }
    if (ballY < TOP + 10) {
      ballY += (int) abs(2 * speedy);
    } else if (ballY > BOTTOM - 10) {
      ballY -= (int) abs(2 * speedy);
    }
    
    int r = this.myColour >> 16 & 0xFF;
    int g = this.myColour >> 8 & 0xFF;
    int b = this.myColour & 0xFF;
    
    int tmp = (int) random(0, 3);
    if (tmp == 0) {
      r += random(-10, 10);
    } else if (tmp == 1) {
      g += random(-10, 10);
    } else if (tmp == 2) {
      b += random(-10, 10);
    }
    
    if (r > 255) {
      r -= 10;
    } else if (r < 100) {
      r += 10;
    }
    if (g > 255) {
      g -= 10;
    } else if (g < 100) {
      g += 10;
    }
    if (b > 255) {
      b -= 10;
    } else if (b < 100) {
      b += 10;
    }
    this.myColour = color(r, g, b);
    this.drawMe();
  }
  
  void drawMe() {
    strokeWeight(1);
    stroke(0, 0, 0);
    fill(this.myColour);
    circle(ballX, ballY, 20);
    //printColour(this.myColour);
  }
  
  void info() {
    println("ball (x,y): " + ballX + ", " + ballY + ")");
  }
}

class panel {
  int x;
  int y;
  int h = 21;
  int w = 24;
  color myColours[] = new color[this.w];
  int cur = 0;
  panel next;
  
  panel(int nx, int ny) {
    this.x = nx;
    this.y = ny;
    for (int i = 0; i < this.w; i++) {
      this.myColours[i] = color(0, 0, 0);
    }
    this.next = null;
  }
  
  panel(int nx, int ny, panel nNext) {
    this.x = nx;
    this.y = ny;
    for (int i = 0; i < this.w; i++) {
      this.myColours[i] = color(0, 0, 0);
    }
    this.next = nNext;
  }
  
  void light(color c) {
    this.shift();
    this.myColours[0] = c;
  }
  
  void shift() {
    if (this.cur == this.w - 1) {
      if (this.next != null) { 
        this.next.light(this.myColours[this.w - 1]);
      }
    } else {
      this.cur++;
    }
    for (int i = this.cur; i > 0; i--) {
      this.myColours[i] = this.myColours[i - 1];
    }
  }
  
  void drawMe() {
    strokeWeight(2);
    for (int i = this.cur - 1; i < this.w; i++) {
      stroke(this.myColours[i]);
      line(this.x + i, this.y, this.x + i, this.y + this.h);
    }
  }
}

void printColour(color c) {
  int r = c >> 16 & 0xFF;
  int g = c >> 8 & 0xFF;
  int b = c & 0xFF;
  println("(r,g,b): (" + r + ", " + g + ", " + b + ")");
}
