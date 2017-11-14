class Spaceship extends Floater  
{   
	public Spaceship()
    {
    	myCenterX = myCenterY = 400;
    	myDirectionX = myDirectionY = 0;
    	myPointDirection = 0;   	
    }
    public void setX(double x)
    {
    	myCenterX = x;
    }
    public double getX()
    {
    	return(myCenterX);
    }
    public void setY(double y)
    {
    	myCenterY = y;
    }
    public double getY()
    {
    	return(myCenterY);
    }
    public void setDirectionX(double x)
    {
    	myDirectionX = x;
    }   
    public double getDirectionX()
    {
    	return(myDirectionX);
    }
    public void setDirectionY(double y)
    {
    	myDirectionY = y;
    }   
    public double getDirectionY()
    {
    	return(myDirectionY);
    }   
    public void setPointDirection(double degrees)
    {
    	myPointDirection = degrees;
    }   
    public double getPointDirection()
    {
    	return(myPointDirection);
    } 
    public void show()
    {
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    fill(77, 68, 68);
    ellipse(7.5, 0, 40, 11);
  	rect(-12.5, -5, 30, 10);
  	fill(57, 48, 48);

  	//Propulsion System
  	beginShape();
  	vertex(-12.5, -5);
  	vertex(-12.5, 5);
  	vertex(-17.5, 10);
  	vertex(-17.5, -10);
  	endShape(CLOSE);

  	fill(137, 124, 124);
  
  	//Wing 1
	beginShape();
	vertex(17.5, -5);
	vertex(2.5, -5);
	vertex(-12.5, -15);
	vertex(2.5, -15);
	endShape(CLOSE);
	  
	//Wing 2
	beginShape();
	vertex(17.5, 5);
	vertex(2.5, 5);
	vertex(-12.5, 15);
	vertex(2.5, 15);
	endShape(CLOSE);

	//"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
    }

    public void hyperspace()
    {
    	myCenterX = Math.random() * 801;
    	myCenterY = Math.random() * 801;
    	myPointDirection = Math.random() * 360;
    	myDirectionX = myDirectionY = 0;
    }
}
