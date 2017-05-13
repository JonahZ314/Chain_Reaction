class Ball { 
  
  float x;
  float y; 
  float rad; 
  float dx;
  float dy; 
  int state; 
  PShape circle; 
  
  Ball ()  {
    rad = 10; 
    x = random((width-rad) + rad/2); 
    y = random((height-rad) + rad/2); 
    int rand1 = (int) (random(0,256)); 
    int rand2 = (int) (random(0,256)); 
    int rand3 = (int) (random(0,256)); 
    circle = createShape(ELLIPSE, x, y, rad, rad); 
    circle.fill(rand1, rand2, rand3); 
    dx = random(10) - 5; 
    dy = random(10) - 5; 
  } 
  
  void move () { 
     x = x + dx; 
     y = y + dy; 
     bounce(); 
  } 
  
  void bounce() { 
    if(x == width - rad || x == rad){
      dx = dx * -1;
    }
    else{
      if (y == height - rad || y == rad){
        dy = dy * -1;
      }
    }
  } 
  
} 
