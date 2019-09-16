void setup() {
  //fullScreen();
  team a = new team(3);
  a.info();
}

class team {
  int size;
  prey members[];

  team() {
    this.size = 11;
    this.members = new prey[size];
  }

  team(int n) {
    this.size = n;
    this.members = new prey[size];
  }

  void info() {
    for (int i = 0; i < this.size; i++) {
      this.members[i].info(i);
    }
  }
}

class prey {
  color myColour = color(random(255), random(255), random(255));
  int x = (int) random(LEFT, RIGHT);
  int y = (int) random(TOP, BOTTOM);
  
  void info(int ID) {
    println("I am triangle " + ID + " and I am in Position (x,y): (" + this.x + ", " + this.y + ")");
  }
}
