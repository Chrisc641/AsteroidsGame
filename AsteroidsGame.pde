Spaceship orville;
Stars [] starfield = new Stars[300];

public void setup() 
{
  size(800, 800);
  noStroke();
  orville = new Spaceship();
  for(int i = 0; i < starfield.length; i++)
  {
 	starfield[i] = new Stars();
  } 
}

public void draw() 
{
  background(0);
  for(int i = 0; i < starfield.length; i++)
  {
 	starfield[i].show();
  } 
  orville.move();
  orville.show();
}

public void keyPressed()
{
	if(key == 'w') {orville.accelerate(0.05);}
	if(key == 's') {orville.accelerate(-0.025);}
	if(key == 'a') {orville.turn(-3);}
	if(key == 'd') {orville.turn(3);}
}