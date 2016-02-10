class Ship
{
  float shipX;
  float shipY;
  int invader;

  Ship(float x_, float y_)
  {
    shipX=x_;
    shipY=y_;
    invader=2;
  }
  Ship()
  {
    shipX=width/2;
    shipY=9*height/10;
    invader=2;
  }

  void display()
  {
    noStroke();  
        fill(255);
        rectMode(CORNER);
        rect(-2*invader+shipX,-4*invader+shipY,4*invader,invader);   
        rect(-5*invader+shipX,-3*invader+shipY,10*invader,invader);    
        rect(-6*invader+shipX,-2*invader+shipY,12*invader,invader); 
        rect(-6*invader+shipX,-1*invader+shipY,3*invader,invader);  
        rect(-1*invader+shipX,-1*invader+shipY,2*invader,invader);
        rect(3*invader+shipX,-1*invader+shipY,3*invader,invader);
        rect(-6*invader+shipX,shipY,12*invader,invader);
        rect(1*invader+shipX,1*invader+shipY,2*invader,invader);
        rect(-3*invader+shipX,1*invader+shipY,2*invader,invader);
        rect(-1*invader+shipX,2*invader+shipY,2*invader,invader);
        rect(-4*invader+shipX,2*invader+shipY,2*invader,invader);
        rect(2*invader+shipX,2*invader+shipY,2*invader,invader);
        rect(-6*invader+shipX,3*invader+shipY,2*invader,invader);
        rect(4*invader+shipX,3*invader+shipY,2*invader,invader);
  }

  boolean contact(float x_, float y_)
  {
    if(x_ >shipX-7*invader && x_ < shipX+7*invader && y_ > shipY-15*invader && y_<shipY+invader )
    {
      return true;
    }
    else
    {
      return false;
    } 
  }

  void move(float sens)
  {
    float shipXt =shipX+sens;

    if( shipXt > 14*width/15 )
    {  
    }
    else
    {
      if( shipXt< width/15 )
      {
      }
      else
      {
        shipX = shipX +sens;
      }
    }
  }

}