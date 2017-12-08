class Asteroid extends Floater
{
	private double[] xCoordinates;
	private double[] yCoordinates;
	private double rotSpeed;

	public Asteroid()
	{
		myCenterX = Math.random() * 801;
		myCenterY = Math.random() * 801;

		xCoordinates = new double[6];
		yCoordinates = new double[6];

		if(Math.random() < 0.5)
		{
			rotSpeed = Math.random() * 3.5 + 0.5;
		}
		else
		{
			rotSpeed = Math.random() * -3.5 - 0.5;	
		}

		if(Math.random() < 0.5)
		{
			myDirectionX = Math.random() * 1.4 + 0.3;
		}
		else
		{
			myDirectionX = Math.random() * -1.4 - 0.3;	
		}

		if(Math.random() < 0.5)
		{
			myDirectionY = Math.random() * 1.4 + 0.3;
		}
		else
		{
			myDirectionY = Math.random() * -1.4 - 0.3;	
		}

		//Fixed right point
		xCoordinates[0] = Math.random() * 30;
		yCoordinates[0] = 0;
		//Fixed left point
		xCoordinates[1] = Math.random() * -30;
		yCoordinates[1] = 0;
		//QI point
		xCoordinates[2] = Math.random() * 30;
		yCoordinates[2] = Math.random() * 30;
		//QII point
		xCoordinates[3] = Math.random() * -30;
		yCoordinates[3] = Math.random() * 30;
		//QIII point
		xCoordinates[4] = Math.random() * -30;
		yCoordinates[4] = Math.random() * -30;
		//QIV point
		xCoordinates[5] = Math.random() * 30;
		yCoordinates[5] = Math.random() * -30;

		double xMax, yMax, xMin, yMin, trueCenterX, trueCenterY;
		xMax = xMin = xCoordinates[0];
		yMax = yMin = yCoordinates[0];

		for(double hold : xCoordinates)
		{
			if(hold > xMax) {xMax = hold;}
			if(hold < xMin) {xMin = hold;}
		}

		for(double hold : yCoordinates)
		{
			if(hold > yMax) {yMax = hold;}
			if(hold < yMin) {yMin = hold;}
		}

		trueCenterX = (xMax + xMin) / 2;
		trueCenterY = (yMax + yMin) / 2;

		for(int i = 0; i < xCoordinates.length; i++) {xCoordinates[i] = xCoordinates[i] - trueCenterX;}
		for(int i = 0; i < yCoordinates.length; i++) {yCoordinates[i] = yCoordinates[i] - trueCenterY;}
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

		fill(95, 40, 13);
    	beginShape();
    	vertex((float)xCoordinates[0], (float)yCoordinates[0]);
    	vertex((float)xCoordinates[2], (float)yCoordinates[2]);
    	vertex((float)xCoordinates[3], (float)yCoordinates[3]);
    	vertex((float)xCoordinates[1], (float)yCoordinates[1]);
    	vertex((float)xCoordinates[4], (float)yCoordinates[4]);
    	vertex((float)xCoordinates[5], (float)yCoordinates[5]);
    	endShape(CLOSE);

	    //"unrotate" and "untranslate" in reverse order
	    rotate(-1*dRadians);
	    translate(-1*(float)myCenterX, -1*(float)myCenterY);
    }

    public void move()
    {
    	myPointDirection += rotSpeed;
    	super.move();
    }
}