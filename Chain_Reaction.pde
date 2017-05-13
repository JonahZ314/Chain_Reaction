Ball[] balls;
boolean reactionStarted;

void setup(){
  size(600, 600);
  balls = new Ball[25];
  reactionStarted = false;
}
void draw(){
  background(0);
  for (int i = 0; i < balls.length; i++){
      balls[i] = new Ball();
//add stuff
  }
}
