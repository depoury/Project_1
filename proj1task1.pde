int counter = 0;
int y = 0;
int ycounter = 0;
int red = 255;
int blue = 0;
int green = 255;
int c = color(red, green, blue);

int bigscreen = 500;

int size = 50;
void setup(){
  
  fullScreen();
  background(255);
  
}

void draw() {
  for (int i = 0; i < height ; i++){
    for (int j = 0; j < bigscreen ; j++){
      fill(0, 0, 0);
      rect(i*size,j*size,size,size);     
    }
    for (int j = 0; j < height ; j++){
      fill(0, green, 0);
      rect(i*size,j*size,size,size);     
    }   
  }

}
