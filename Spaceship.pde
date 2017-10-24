class Spaceship extends Floater  
{   
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
}
