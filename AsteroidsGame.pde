SpaceShip bob;
Star [] sue;
ArrayList <Asteroid> ann;
ArrayList <Bullet> bull=new ArrayList<Bullet>(1);
//your variable declarations here
public void setup() 
{ 
  size (600,600); 
 ann=new ArrayList <Asteroid>(30);
  for (int nI=0; nI<30;nI++)
{
  ann.add(new Asteroid()); 
}
  bob = new SpaceShip();
 
  
  sue = new Star [60];
  for (int i=0;i<60; i++)
  {
     sue[i] = new Star(); 
  }

  for (int nI=0; nI<bull.size(); nI++)
  {
    bull.show();
    //bull.move();
  }
    //your code here
}

public void draw() 
{
  background(0);
  for (int i=0;i<60; i++)
  {
     sue[i].show();
  }
  bob.show();
  bob.move();
  for (int i=0; i<ann.size(); i++)
  {
    ann.get(i).move();
    ann.get(i).show();
    //System.out.println(ann.get(i).getX() + ", " + ann.get(i).getY());
  if (dist(bob.getX(),bob.getY(), ann.get(i).getX(), ann.get(i).getY())<20)
  {
    ann.remove(i);
  }
   if (dist(bull.getX(),bull.getY(), ann.get(i).getX(), ann.get(i).getY())<20)
    {
        bull.remove(i);
    }
}
}//your code here

public void keyPressed ()
{
  if (keyCode == LEFT)
    bob.rotate(-5);
  if (keyCode == RIGHT)
    bob.rotate(5);
  if (keyCode==UP)
    bob.accelerate(0.2);
  if (keyCode==DOWN)
    bob.accelerate(-0.2);
  if (key=='0')
  {
    bob.setX(((int)Math.random()*570));
    bob.setY(((int)(Math.random()*570)));
    bob.setDirectionX(0);
    bob.setDirectionY(0);
    bob.setPointDirection(((int)(Math.random()*595)));
  }
  if (key==' ')
    bull.add(new Bullet(bob));
}

class Star {
private int x, y;
  public Star()
  {
    x= ((int)(Math.random()*600));
    y=((int)(Math.random()*600));
    }
    public void show(){
    fill(0,((int)(Math.random()*250)),((int)(Math.random()*200)));
    ellipse(x, y, 10,10);
  }
}

class SpaceShip extends Floater
{
      SpaceShip()
      {
      corners=4;
      xCorners = new int [corners];
      yCorners = new int [corners];
      xCorners[0]=-7;
      yCorners[0]=-7;
      xCorners[1]=7;
      yCorners[1]=0;
      xCorners[2]=-7;
      yCorners[2]=7;
      xCorners[3]=-3;
      yCorners[3]=0;
      myColor =(255);
      myCenterX=300;
      myCenterY=300;
      myDirectionX=0;
      myDirectionY=0;
      myPointDirection=0;
      }  
      public void setX(int x){myCenterX=x;}  
      public int getX(){return (int) myCenterX;}   
      public void setY(int y){myCenterY=y;}
      public int getY() {return (int) myCenterY;}   
      public void setDirectionX(double x){myDirectionX=x;}   
      public double getDirectionX() {return myDirectionX;}
      public void setDirectionY(double y){myDirectionY=y;}   
      public double getDirectionY() {return myDirectionY;}
      public void setPointDirection(int degrees) {myPointDirection=degrees;}  
      public double getPointDirection() {return myPointDirection;} //your code here
}
class Bullet extends Floater
{
  public Bullet(Spaceship theShip)
  {
    myCenterX=theShip.getX();
    myCenterY=theShip.getY();
    myPointDirection=theShip.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX=5*Math.cos(Radians)+ theShip.getDirectionX();
    myDirectionY=5*Math.sin(dRadians)+theShip.getDirectionY();
  }
  public void show()
  {
    ellipse(myCenterX,myCenterY,10,10);
  }
}
class Asteroid extends Floater
{
      private int rotSpeed;
      public Asteroid()
      {
      fill(0,0,197);
      rotSpeed=((int)(Math.random()*2));
      corners=8;
      xCorners = new int [corners];
      yCorners = new int [corners];
      xCorners[0]=0;
      yCorners[0]=-15;
      xCorners[1]=4;
      yCorners[1]=-4;
      xCorners[2]=15;
      yCorners[2]=0;
      xCorners[3]=4;
      yCorners[3]=4;
      xCorners[4]=0;
      yCorners[4]=15;
      xCorners[5]=-4;
      yCorners[5]=-4;
      xCorners[6]=-15;
      yCorners[6]=0;
      xCorners[7]=-4;
      yCorners[7]=4;
      myColor = color (255);
      myCenterX=((int)(Math.random()*580));
      myCenterY=((int)(Math.random()*580));
      myDirectionX=((int)(Math.random()*5)-2);
      myDirectionY=((int)(Math.random()*5)-2);
      myPointDirection=0;
}  
      public void move(){
        rotate(rotSpeed);
        super.move();
      }
      public void setX(int x){myCenterX=x;}  
      public int getX(){return (int) myCenterX;}   
      public void setY(int y){myCenterY=y;}
      public int getY() {return (int) myCenterY;}   
      public void setDirectionX(double x){myDirectionX=x;}   
      public double getDirectionX() {return myDirectionX;}
      public void setDirectionY(double y){myDirectionY=y;}   
      public double getDirectionY() {return myDirectionY;}
      public void setPointDirection(int degrees) {myPointDirection=degrees;}  
      public double getPointDirection() {return myPointDirection;} //your code here
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
      protected int corners;  //the number of corners, a triangular floater has 3   
      protected int[] xCorners;   
      protected int[] yCorners;   
      protected int myColor;   
      protected double myCenterX, myCenterY; //holds center coordinates   
      protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
      protected double myPointDirection; //holds current direction the ship is pointing in degrees    
      abstract public void setX(int x);  
      abstract public int getX();   
      abstract public void setY(int y);   
      abstract public int getY();   
      abstract public void setDirectionX(double x);   
      abstract public double getDirectionX();   
      abstract public void setDirectionY(double y);   
      abstract public double getDirectionY();   
      abstract public void setPointDirection(int degrees);   
      abstract public double getPointDirection(); 
  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 



