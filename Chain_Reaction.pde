ArrayList<Ball> balls; // An ArrayList to store all of the balls. 
boolean reactionStarted; 
int size; // An arbitrary size for the arraylist. 

void setup(){
  
  size(600, 600); // Sets up the size of the world
  size = 25; // Declares the arbitrary size
  reactionStarted = false; // There is no reaction
  balls = new ArrayList<Ball>(); // The ball ArrayList is instantiated
  // Fills the ArrayList with new balls.... 
  for (int i = 0; i < size; i++){
      balls.add(new Ball());
  }
}

void draw(){
  background(0); // A Black Background...
  // For each loop that runs each ball. 
  for (Ball b: balls)  {
     b.run(); 
  } 
}

/*

The mouse clicked portion where the circles increase..

void mouseClicked() {
  reactionStarted = true; 
  if (mousePressed) { 
    balls.add(new Ball()); 
    balls.get(balls.size()-1).rad *= 2; 
  } 
  for (Ball b: balls)  {
     b.run(); 
  } 
} 
*/ 