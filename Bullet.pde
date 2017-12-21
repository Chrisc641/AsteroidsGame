class Bullet extends Floater
{
	Bullet(Spaceship ship)
	{
		myCenterX = ship.getX();
		myCenterY = ship.getY();
		myPointDirection = ship.getPointDirection();
		double dRadians = myPointDirection * (Math.PI/180);
		myDirectionX = 5 * Math.cos(dRadians) + ship.getDirectionX();
		myDirectionY = 5 * Math.sin(dRadians) + ship.getDirectionY();
	}

	public void setX(double x) {myCenterX = x;}
    public double getX() {return(myCenterX);}
    public void setY(double y) {myCenterY = y;}
    public double getY() {return(myCenterY);}
    public void setDirectionX(double x) {myDirectionX = x;}   
    public double getDirectionX() {return(myDirectionX);}
    public void setDirectionY(double y) {myDirectionY = y;}   
    public double getDirectionY() {return(myDirectionY);}   
    public void setPointDirection(double degrees) {myPointDirection = degrees;}   
    public double getPointDirection() {return(myPointDirection);}

    public void show()
    {
	    //translate the (x,y) center of the ship to the correct position
	    translate((float)myCenterX, (float)myCenterY);

	    //convert degrees to radians for rotate()     
	    float dRadians = (float)(myPointDirection*(Math.PI/180));
	    
	    //rotate so that the polygon will be drawn in the correct direction
	    rotate(dRadians);

	    fill(102, 203, 101);
	    rect(-12.5, -1.5, 25, 3, 50);

	    //"unrotate" and "untranslate" in reverse order
    	rotate(-1*dRadians);
    	translate(-1*(float)myCenterX, -1*(float)myCenterY);
    }

    public void move()
    {
    	myCenterX += myDirectionX;    
    	myCenterY += myDirectionY;
    }
}