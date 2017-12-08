Spaceship orville;
ArrayList <Asteroid> asteroidBelt = new ArrayList<Asteroid>();
Stars [] starfield = new Stars[300];
boolean accelerating = false;
boolean decelerating = false;
boolean turningLeft = false;
boolean turningRight = false;
boolean hyperspace = false;

public void setup() 
{
  size(800, 800);
  noStroke();
  orville = new Spaceship();
  for(int i = 0; i < starfield.length; i++)
  {
 	starfield[i] = new Stars();
  }
  for(int i = 0; i < 25; i++)
  {
  	asteroidBelt.add(new Asteroid());
  } 
}

public void draw() 
{
  background(0);
  for(int i = 0; i < starfield.length; i++)
  {
 	starfield[i].show();
  }
  if(accelerating == true) {orville.accelerate(0.05);}
  if(decelerating == true) {orville.accelerate(-0.025);} 
  if(turningLeft == true) {orville.turn(-3);} 
  if(turningRight == true) {orville.turn(3);}
  if(hyperspace == true)
  {
  	hyperspace = false;
  	orville.hyperspace();
  }  
  orville.move();
  orville.show();
  for(int i = 0; i < asteroidBelt.size(); i++)
  {
  	asteroidBelt.get(i).move();
  	asteroidBelt.get(i).show();
  }
}

public void keyPressed()
{
  if(key == 'w') {accelerating = true;}
  if(key == 's') {decelerating = true;}
  if(key == 'a') {turningLeft = true;}
  if(key == 'd') {turningRight = true;}
  if(keyCode == ENTER) {hyperspace = true;}
}

public void keyReleased()
{
  if(key == 'w') {accelerating = false;}
  if(key == 's') {decelerating = false;}
  if(key == 'a') {turningLeft = false;}
  if(key == 'd') {turningRight = false;}
}