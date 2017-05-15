ArrayList<Ball> balls; // An ArrayList to store all of the balls. 
Ball domino; // starts the domino affect 
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

void draw() {
  background(0); // A Black Background...
  // For each loop that runs each ball. 
  for (int i = 0; i < balls.size(); i++)  {
    // if the reaction has started... 
    if (reactionStarted) { 
      // If it is touching the domino ball 
     if (!(balls.get(i) == domino) && balls.get(i).isTouching(domino)) { 
       // it will decrease until it dies 
        balls.get(i).setState(1); 
     } 
     // If the ball is dead
     else if (balls.get(i).getState() == 0) { 
       // remove it!
       balls.remove(i); 
     } 
     // If the ball is in a state of decrease
     else if (balls.get(i).getState() == 1) { 
       // decrease it some more!
        balls.get(i).shrink(); 
        balls.get(i).run(); 
     } 
     // If the ball is in a stagnant phase...
     else if (balls.get(i).getState() == 2) { 
       // Do nothing 
       balls.get(i).run(); 
     } 
     // Otherwise...
     else { 
       // expand!!!
        balls.get(i).expand(); 
        balls.get(i).run(); 
     } 
    }
  // If the reaction has yet to start...
  else { 
      // Run!
      balls.get(i).run(); 
  } } 
}

void mouseClicked() { 
  // If the reaction has yet to start... 
  if (!reactionStarted) { 
    domino = new Ball (mouseX, mouseY); // create the domino effect 
    domino.setState(3); // make the ball increase
    balls.add(domino); // add the ball to the ArrayList of balls. 
    reactionStarted = true; // start a reaction
  } 
  // OTHERWISE... 
  // Do nothing because there is no code block here, this ensures that the world can only be pressed once with functionality. 
} 