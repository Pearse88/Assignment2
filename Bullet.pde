class Bullet
{
  float pX;
  float pY;
  float invader;
  boolean display;
  float speedY;
  int type;
  boolean unedeux=true;

  Bullet(float x_, float y_)
  {
    pX=x_;
    pY=y_;
    invader = 3;
    display=false;
    speedY=-2.5;  
    type = 2;
  }

  Bullet()
  {
    pX=width/2;
    pY=9*height/10;
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
        line(pX,pY,pX,pY-5*invader); 
      }
      else
      {
        strokeWeight(invader-1);
        stroke(255);
        line(pX+invader,pY,pX-invader,pY-invader); 
        line(pX-invader,pY-invader,pX+invader,pY-2*invader); 
        line(pX+invader,pY-2*invader,pX-invader,pY-3*invader); 
        line(pX-invader,pY-3*invader,pX+invader,pY-4*invader);
       line(pX+invader,pY-4*invader,pX-invader,pY-5*invader);  
      }
    }
  }

  void move()
  {
    if(display==true)
    {
      pY=pY - speedY; 
      if( pY < 0 || pY > height+5*invader )
      {
        pX=0;
        pY=0;
        display=false;
      }
    }
  }

  void launch(float x_)
  {
    if(display==false)
    {
      display=true;
      pX=x_;
      if(unedeux==true)
      {
         pY=9*height/10;
         unedeux=!unedeux;
      }
      else
      {
        pY=9*height/10-2;
        unedeux=!unedeux;
      }
      
    }
  }  

  void launch(float x_,float y_)
  {
    if(display==false)
    {
      display=true;
      pX=x_;
      pY=y_;
      
     
    } 

  }
}