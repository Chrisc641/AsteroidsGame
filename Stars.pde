class Stars
{
	double x, y;
	float size;
	Stars()
	{
		x = Math.random() * 801;
 		y = Math.random() * 801;
 		size = (float)(Math.random() * 1.5 + 1);
	}
	public void show()
 	{
 		fill(255);
 		ellipse((float)x, (float)y , size, size);
 	}  
} 