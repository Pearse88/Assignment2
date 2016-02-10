class Protection
{
  int x,y;
  int invaderX,invaderY;
  
  // protection sheild shape
  int[][]  protect = {
              {0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0},
              {0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0},
              {0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
              {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
              {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
              {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
              {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
              {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
              {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
              {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
              {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
              {1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1},
              {1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1},
              {1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1},
              {1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1}
            };
            
   Protection(int x_, int y_)
  {
    x = x_;
    y = y_;
    
    invaderX=2;
    invaderY=2;
  }   
  
  void display()
  {
    
    noStroke();
    fill(255);
    rectMode(CENTER);
    for(int i =0; i<15;i++)
    {
      for(int j=0; j<20;j++)
      {
        if(protect[i][j]==1)
        {
          rect(j*invaderX+x,i*invaderY+y,invaderX,invaderY);
        }
      }
    }
  }
  
  boolean contact(float pX, float pY)
  {
    boolean flagtouch =false;
    for(int i =0; i<15;i++)
    {
      for(int j=0; j<20;j++)
      {
        if(pX >= j*invaderX+x-invaderX/2 && pX <= j*invaderX+x+invaderX/2 && pY >= i*invaderY+y-invaderY/2 && pY <= i*invaderY+y+invaderY/2 && protect[i][j]==1)
        {
          protect[i][j]=0;
          for(int t=i-2;t<=i+2;t++)
          {
            for(int r = j-2; r<=j+2;r++)
            {
              if( t>=0 && t <15 && r>=0 && r < 20)
              {
                if(random(100)>75)
                {
                  protect[t][r]=0;
                }
              }
            }
          }
          flagtouch = true;
        }
      }
    }
    return flagtouch;
  }
  
  
}