float lw = 0;
float lh = height;
float x =0;
float y =0;
int diff = 10;


void setup(){
  //background(0,150,150);
  fullScreen();
  
}

void draw(){
  
  background(0,0,0);
  stroke(255,255,255);
  line(x,0,x,height);
  line(0,y,width,y);
  String s = "(" + str(x) + "," + str(y) +")";
  
  text(s, x,y);
  if(keyPressed){
     if(keyCode == LEFT && x > 0){
       x--;
     }
     else if(keyCode == RIGHT && x < width){
       x++;
     }
     else if(keyCode == UP && y > 0){
         y--;
     }
     else if(keyCode == DOWN && y < height){
        y++; 
     }
  }
}
