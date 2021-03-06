class Ball { 
  
  // V A R I A B L E S
  
  int x;
  int y; 
  int rad; 
  int dx;
  int dy; 
  int state; 
  color col; 
  
  // D E F A U L T   C O N S T R U C T O R
  
  Ball ()  {
    x = (int) (random((width-rad) + rad/2)); // X-cor
    y = (int) (random((height-rad) + rad/2)); // Y-cor
    rad = 20; // Radius 
    int rand1 = (int) (random(0,256)); // Red Input
    int rand2 = (int) (random(0,256)); // Green Input
    int rand3 = (int) (random(0,256)); // Blue Input
    col = color(rand1, rand2, rand3); // Uses RGB Input for a new color 
    dx = (int) (random(10)) + 1;  // Change in X
    dy = (int) (random(10)) + 1; // Change in Y
    state = 2; // State Value 
  } 
  
  // C O N S T R U C T O R
  
    Ball (int neww, int newy)  {
    x = neww; // X-cor
    y = newy; // Y-cor
    rad = 10; // Radius 
    int rand1 = (int) (random(0,256)); // Red Input
    int rand2 = (int) (random(0,256)); // Green Input
    int rand3 = (int) (random(0,256)); // Blue Input
    col = color(rand1, rand2, rand3); // Uses RGB Input for a new color 
    dx = (int) (random(10)) - 5;  // Change in X
    dy = (int) (random(10)) - 5; // Change in Y
    state = 2; // State Value (Dead or Alive???) 
  } 
  
  void printCircles() { 
    // If alive... 
    if (state != 0) { 
    fill(col); // Sets color
    ellipse(x,y,2*rad,2*rad); // Creates a circle
    } 
  } 
  
  // Moves consistently with the set dx and dy values. 
  
  void move () { 
     x = x + dx; 
     y = y + dy; 
     bounce(); 
  } 
  
  void bounce() { 
    // If the circle touches the end from the x direction... 
    if(x >= width - (1+rad) || x <= (1+rad)){
      // reverse, reverse
      dx = dx * -1;
    }
    // OTHERWISE... 
    else{
      // if the circle touches the end from the y direction...
      if (y >= height - (1+rad) || y <= (1+rad)){
        // reverse, reverse 
        dy = dy * -1;
      }
    }
  }
  
  boolean isTouching(Ball b) {
    return (rad+b.rad) > distance(b); 
  } 

  int distance(Ball b) { 
    int xs = abs(x-b.x); 
    int ys = abs(y-b.y); 
    int ans = (int) (Math.sqrt(xs*xs + ys*ys)); 
    return ans; 
  } 
  
  // Three States: 
  // 0: Dead, 1: Decreasing, 2: Stationary, 3: Increasing 
  
  int getState() { 
    return state;   
  }   
  
  void shrink() { 
    if (rad > 0) { 
      rad--;
    } 
    else { 
      state = 0;
    } 
  } 
  
  void expand() {
    if (rad < 50) { 
      rad++; 
    } 
    else { 
      state = 2; 
    } 
  } 

  void setState(int state2) { 
    state = state2;   
  } 
  
  // R U N   M E T H O D
  
  void run() { 
    // Two parts: movement and printing. 
    move(); 
    printCircles(); 
  } 
  
} 