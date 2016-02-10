class SpaceInvader
{
  int type;
  float shipX;
  float shipY;
  int invader;
  float speedX;
  int speedY;
  boolean allive;
  boolean fshipY=false;

  SpaceInvader()
  {
    shipX=width/2;
    shipY=height/2;

    allive=true;

    speedY = 1;
    speedX = 5;

    invader = 2;

  }

  SpaceInvader(int X_, int Y_, int _type)
  {
    type=_type;
    shipX=X_;
    shipY=Y_;

    allive=true;

    speedY = 1;
    speedX =5;

    invader = 2;


  }

  void display(boolean flag)
  {
    if(allive==true)
    {
      pushMatrix();
      translate(shipX,shipY);
      rotate(PI);
      noStroke();
      fill(0,255,0);
      rectMode(CENTER);
      rect(0,0,15*invader,7*invader); 
      rect(0,0-5*invader,3*invader,3*invader);
      rect(0,0-7*invader,invader,invader);
      fill(0);
      rect(0-7*invader,0-3*invader,invader,invader);
      rect(0+7*invader,0-3*invader,invader,invader);
      popMatrix();
    }
  }

  boolean move(float signe, boolean moveDown)
  {

    if(moveDown!=fshipY)
    {
      shipY = shipY + 10;
      fshipY=moveDown;
      return false;    
    }
    else
    {
      //float speedXt = speedX * signe;
      shipX = shipX + signe;
      if(allive==true)
      {
        if( shipX > 14*width/15 )
        {      
          return true;
        }
        else
        {
          if( shipX < width/15 )
          {
            return true;
          } 
          else
          {
            return false;
          } 
        }
      }
      else
      {
        return false;
      }
    } 
  }

  boolean contact(float x_, float y_)
  {
    if(allive==true)
    {
      if(x_ < 7.5*invader+shipX+invader && x_ > -7.5*invader+shipX-invader && y_>-5.0*invader+shipY && y_ < 2.0*invader+shipY)
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