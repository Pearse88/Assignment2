class Bullet
{
  float bulletX;
  float bulletY;
  float invader;
  boolean display;
  float speedY;
  int type;
  boolean unedeux=true;

  Bullet(float x_, float y_)
  {
    bulletX=x_;
    bulletY=y_;
    invader = 3;
    display=false;
    speedY=-2.5;  
    type = 2;
  }

  Bullet()
  {
    bulletX=width/2;
    bulletY=9*height/10;
    invader = 2;  
    display=false;  
    speedY=4.1;
    type = 1;
  }

  void display()
  {
    if(display==true)
    {
      if(type==1)
      {
        strokeWeight(invader);
        stroke(255);
        line(bulletX,bulletY,bulletX,bulletY-5*invader); 
      }
      else
      {
        strokeWeight(invader-1);
        stroke(255);
        line(bulletX+invader,bulletY,bulletX-invader,bulletY-invader); 
        line(bulletX-invader,bulletY-invader,bulletX+invader,bulletY-2*invader); 
        line(bulletX+invader,bulletY-2*invader,bulletX-invader,bulletY-3*invader); 
        line(bulletX-invader,bulletY-3*invader,bulletX+invader,bulletY-4*invader);
       line(bulletX+invader,bulletY-4*invader,bulletX-invader,bulletY-5*invader);  
      }
    }
  }

  void move()
  {
    if(display==true)
    {
      bulletY=bulletY - speedY; 
      if( bulletY < 0 || bulletY > height+5*invader )
      {
        bulletX=0;
        bulletY=0;
        display=false;
      }
    }
  }

  void launch(float x_)
  {
    if(display==false)
    {
      display=true;
      bulletX=x_;
      if(unedeux==true)
      {
         bulletY=9*height/10;
         unedeux=!unedeux;
      }
      else
      {
        bulletY=9*height/10-2;
        unedeux=!unedeux;
      }
      
    }
  }  

  void launch(float x_,float y_)
  {
    if(display==false)
    {
      display=true;
      bulletX=x_;
      bulletY=y_;
      
     
    } 

  }
}