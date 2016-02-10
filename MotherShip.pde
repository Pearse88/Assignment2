
class MotherShip
{

  float shipX;
  float shipY;
  int invaderx;
  int invadery;
  float speedX;
  boolean allive;
  boolean sens;


  MotherShip()
  {
    shipX=width/2;
    shipY=65;

    allive=false;

    speedX = 1;

    invaderx = 2;
    invadery = 2;
  }



  void display()
  {
    if(allive==true)
    {
      
      noStroke();  
      fill(255,10,10);
      rectMode(CORNER);
      rect(-3*invaderx+shipX,-3*invadery+shipY,6*invaderx,invadery);
      rect(-5*invaderx+shipX,-2*invadery+shipY,10*invaderx,invadery);
      rect(-6*invaderx+shipX,-1*invadery+shipY,12*invaderx,invadery);
      rect(-7*invaderx+shipX,0*invadery+shipY,2*invaderx,invadery);
      rect(-4*invaderx+shipX,0*invadery+shipY,2*invaderx,invadery);
      rect(-1*invaderx+shipX,0*invadery+shipY,2*invaderx,invadery);
      rect(2*invaderx+shipX,0*invadery+shipY,2*invaderx,invadery);
      rect(5*invaderx+shipX,0*invadery+shipY,2*invaderx,invadery);
      rect(-8*invaderx+shipX,1*invadery+shipY,16*invaderx,invadery);
      rect(-6*invaderx+shipX,2*invadery+shipY,3*invaderx,invadery);
      rect(-1*invaderx+shipX,2*invadery+shipY,2*invaderx,invadery);
      rect(3*invaderx+shipX,2*invadery+shipY,3*invaderx,invadery);
      rect(-5*invaderx+shipX,3*invadery+shipY,1*invaderx,invadery);
      rect(4*invaderx+shipX,3*invadery+shipY,1*invaderx,invadery);

    }
  }

  void launch(float k)
  {
    if( k < 1 )
    {
      
      shipX=-7*invaderx;
      sens = true;
    }
    else
    {
      shipX=width+7*invaderx;
      sens=false;
    }
    speedX=random(0.8,2);
    allive=true;
  }
  
  
  void move()
  {
    if(shipX +8*invaderx > 0 && shipX - 8*invaderx < width)
    {
      if( sens == true ) 
      {
         shipX = shipX + speedX;
      }
      else
      {
        
        shipX = shipX -speedX;
      }
    }
    else
    {
      allive=false;
    }
  }

  boolean contact(float x_, float y_)
  {
    if(allive==true)
    {
      if(x_ < shipX +8*invaderx && x_ > shipX - 8*invaderx && y_> -3*invadery+shipY && y_ < 3*invadery+shipY)
      {
        allive=false;

      } 
      return allive;
    }
    else
    {
      return true;
    }
  }
}