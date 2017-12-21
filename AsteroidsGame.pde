Spaceship orville;
ArrayList <Asteroid> asteroidBelt = new ArrayList<Asteroid>();
ArrayList <Bullet> laserBeams = new ArrayList<Bullet>();
Stars [] starfield = new Stars[300];
boolean accelerating = false;
boolean decelerating = false;
boolean turningLeft = false;
boolean turningRight = false;
boolean hyperspace = false;
boolean firing = false;
float health = 100;
int score = 0;
boolean gameOver = false;

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
    gameOver = false;
    score = 0;
    health = 100;
  	orville.hyperspace();
  } 
  if(firing == true)
  {
  	if(laserBeams.size() == 0 || dist((float)(laserBeams.get(laserBeams.size() - 1).getX()), (float)(laserBeams.get(laserBeams.size() - 1).getY()), (float)orville.getX(), (float)orville.getY()) > 50)
  	{
  		laserBeams.add(new Bullet(orville));
  	}
  }
  for(int i = laserBeams.size() - 1; i >= 0; i--)
  {
  	laserBeams.get(i).show();
  	laserBeams.get(i).move();
    for(int j = asteroidBelt.size() - 1; j >= 0; j--)
    {
      if(dist((float)(laserBeams.get(i).getX()), (float)(laserBeams.get(i).getY()), (float)asteroidBelt.get(j).getX(), (float)asteroidBelt.get(j).getY()) < 25)
      {
        laserBeams.remove(i);
        asteroidBelt.remove(j);
        score = score + 1;
        asteroidBelt.add(new Asteroid());
        break;
      }
      else if(laserBeams.get(i).getX() > 800 || laserBeams.get(i).getX() < 0 || laserBeams.get(i).getY() > 800 || laserBeams.get(i).getX() < 0)
      {
      	laserBeams.remove(i);
        break;
      }
    }
  }	 
  orville.move();
  orville.show();
  for(int i = 0; i < asteroidBelt.size(); i++)
  {
  	asteroidBelt.get(i).move();
  	asteroidBelt.get(i).show();
  	if(dist((float)orville.getX(), (float)orville.getY(), (float)asteroidBelt.get(i).getX(), (float)asteroidBelt.get(i).getY()) < 30)
  	{
      if(health > 0)
      {
  		  health = health - 0.25;
      }
      if(health <= 0)
      {
        gameOver = true;
      }
  	}
  
  if(gameOver == true)
  {
    fill(255, 0 , 0);
    textSize(15);
    text("Press enter to hyperspace and play again.", 260, 420);
    textSize(30);
    text("Game Over", 325, 400);
  }
}

  fill(255);
  textSize(30);
  text("Health: " + health + "%", 0, 790);
  text("Score: " + score, 0, 25);
}

public void keyPressed()
{
  if(gameOver == false)
  {
    if(key == 'w') {accelerating = true;}
    if(key == 's') {decelerating = true;}
    if(key == 'a') {turningLeft = true;}
    if(key == 'd') {turningRight = true;}
    if(key == ' ') {firing = true;}
  }
  if(keyCode == ENTER) {hyperspace = true;}
}

public void keyReleased()
{
  if(key == 'w') {accelerating = false;}
  if(key == 's') {decelerating = false;}
  if(key == 'a') {turningLeft = false;}
  if(key == 'd') {turningRight = false;}
  if(key == ' ') {firing = false;}
}