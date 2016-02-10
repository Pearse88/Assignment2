//doesn't work?
PImage bg;

int rows = 4;
int cols = 10;
SpaceInvader[][] spaceInv = new SpaceInvader[cols][rows];
Protection[] protect = new Protection[4];
Bullet[] bullet = new Bullet[3];
Ship[] shipLives = new Ship[3];
MotherShip motherShip;
Bullet laser;
Object object;
Ship ship;



void setup()
{  
  size(501,432);
  bg = loadImage("stars.jpg");
  
  frameRate(60);
  object = new Object();
  ship = new Ship();
  laser = new Bullet();
  motherShip = new MotherShip();

  for(int i=0;i<shipLives.length;i++)
  {
    shipLives[i] = new Ship(width-120+40*i,height/15);   
    bullet[i] = new Bullet(0,0);   
  }
  for(int i=0;i<protect.length;i++)
  {
    protect[i] = new Protection(i*125+45,310); 
  }
 //create invader

  for(int i=0;i<cols;i++)
  {
    for(int j=0;j<rows;j++)
    {
      if(j==0)
      {
        spaceInv[i][j] = new SpaceInvader(object.enemyX+35*i,object.enemyY+30*j,3); 
      }  
      else
      {  
        if(j==1 || j==2)
        {
          spaceInv[i][j] = new SpaceInvader(object.enemyX+35*i,object.enemyY+30*j,2);
        }
        else
        {
          spaceInv[i][j] = new SpaceInvader(object.enemyX+35*i,object.enemyY+30*j,1);
        }
      }
    }
  }

}


void draw()
{
  background(bg);
  displayScore();

  if(object.game==true)
  {
    starting();


    laser.display();
    ship.display();
    laser.move();

    actionShip();

    
    motherShip.display();
    motherShip.move();
    if(motherShip.contact(laser.pX,laser.pY)==false)
    {
      object.score += int(random(40,250));
      laser.display=false;
      laser.pY=height; 
    }
    if(random(100) > 99.7)
    {

      if(motherShip.allive == false)
      {   
        float k = random(0,2);
        motherShip.launch(k);
      }
    }
    

    for(int i=0;i<protect.length;i++)
    {
      protect[i].display();

    }


    if(frameCount % object.fcount == 0 )
    {

      object.flag = !object.flag;
      for(int i=0;i<cols;i++)
      {

        for(int j=0;j<rows;j++)
        {

          if(spaceInv[i][j].move(object.enemySpeed, object.moveDown) == true)
          {
            object.wall=true; 
          }

        }
      }
    }

    for(int i=0;i<cols;i++)
    {

      if(i<3)
      {
        bullet[i].move();
        bullet[i].display();
        if(ship.contact(bullet[i].pX,bullet[i].pY) == true)
        {
          object.shipcollisionBullet=true;
          bullet[i] = new Bullet(0,0);
        }
        for(int k=0; k < protect.length;k++)
        {
          if(protect[k].contact(bullet[i].pX,bullet[i].pY)== true)
          {
            protect[k].contact(bullet[i].pX,bullet[i].pY+2);
            bullet[i] = new Bullet(0,0);
          }
          if(protect[k].contact(laser.pX,laser.pY)== true)
          {
            laser.display=false;
            laser.pY=height;
          }
        }
      }

      if(i<object.Lives)
      {
        shipLives[i].display();
      }

      for(int j=0;j<rows;j++)
      {

        for(int k=0; k < protect.length;k++)
        {
          for(int p =0; p<15;p++)
          {
            for(int o=0; o<20;o++)
            {
              if(spaceInv[i][j].allive == true)
              {
                if(protect[k].protect[p][o]==1)
                {
                  if(o*protect[k].invaderx+protect[k].x >spaceInv[i][j].shipX-4*spaceInv[i][j].invader && o*protect[k].invaderx+protect[k].x < spaceInv[i][j].shipX+4*spaceInv[i][j].invader && p*protect[k].invadery+protect[k].y < spaceInv[i][j].shipY+4*spaceInv[i][j].invader)
                  {
                    protect[k].protect[p][o]=0;
                  } 
                }
              }
            }  
          }      
        }



        if(spaceInv[i][j].contact(laser.pX,laser.pY)==false)
        {
          switch (spaceInv[i][j].type)
          {
          case 1: 
            object.score += 10; 
            break;
          case 2: 
            object.score += 20; 
            break;
          case 3: 
            object.score += 40; 
            break;
          }
          laser.display=false;
          laser.pY=height;
        }

        if(spaceInv[i][j].allive==true)
        { 
          if(random(100) > 99.98)
          {
            int k = int(random(0,3));
            if(bullet[k].display == false)
            {
              bullet[k].launch(spaceInv[i][j].shipX,spaceInv[i][j].shipY);
            }
          }
          if(ship.contact(spaceInv[i][j].shipX,spaceInv[i][j].shipY)==true ||  spaceInv[i][j].shipY>=9*height/10)
          {
            object.shipcollision=true;
          }
          object.play=true;
        }

        spaceInv[i][j].display(object.flag);

      }
    }


    acceleration();

    shipcollision();

    if(object.play==false || object.shipcollision==true)
    {
      if(object.shipcollision==true)object.Lives-=1;
      if(object.Lives<0)object.game=false;
      for(int i=0;i<cols;i++)
      {
        for(int j=0;j<rows;j++)
        {
          init(i,j);
        }
      }
    }
  }
  else
  {
    gameOver();
  }
  
  
}


void keyPressed()
{
  
  
  if(keyCode==RIGHT)
  {
    object.right=true;
  }
  if(keyCode==LEFT)
  {
    object.left=true;
  }
  if(key==' ')
  {
    object.shoot=true;
  }
}

void keyReleased()
{
  if(keyCode==RIGHT)
  {
    object.right=false;
  }
  if(keyCode==LEFT)
  {
    object.left=false;
  }
  if(key==' ')
  {
    object.shoot=false;
  }
}

//Ship actions

void actionShip()
{
  if(object.right==true)
  {
    ship.move(3);
  }
  if(object.left==true)
  {
    ship.move(-3);
  }
  if(object.shoot==true)
  {
    laser.launch(ship.shipX);
  }
}


void starting()
{
  object.wall=false;
  object.play=false;
  object.shipcollision=false;
  object.shipcollisionBullet=false;
}


void init(int i,int j)
{
  spaceInv[i][j].shipX=object.enemyX+35*i;
  spaceInv[i][j].shipY=object.enemyY+30*j;
  spaceInv[i][j].allive=true;
  object.enemySpeed=5;
  object.fcount=40;
}



// Display Score


void displayScore ()
{
  background(0);
  stroke(255);
  fill(255);
  strokeWeight(2);
  textFont(object.fontA, 15);
  textAlign(LEFT);
  text("Score: ",width/20,height/15);
  text(int(object.score),width/20+60,height/15);
  strokeWeight(2);
  stroke(0,255,0);
  line(0,9*height/10+20,width,9*height/10+20);
}


void gameOver()
{
  textFont(object.fontA, 35);
  textAlign(CENTER);
  text("GAME OVER",width/2,height/2);
  if(mousePressed)
  {
    for(int i=0;i<protect.length;i++)
    {
      protect[i] = new Protection(i*125+45,310); 
    }
    object.score=0;
    object.Lives=3;
    object.game=true;
    for(int i=0;i<cols;i++)
    {
      for(int j=0;j<rows;j++)
      {
        init(i,j);
      }
    }
  }
}


//speed of the aliens
void acceleration()
{
  if(object.wall == true)
  {
    object.fcount=object.fcount-3;
    object.fcount = constrain(object.fcount,9,60);
    if(object.enemySpeed>0)
    {
      object.enemySpeed = object.enemySpeed * -1 -0.3 ;
    }
    else
    {
      object.enemySpeed = object.enemySpeed * -1 + 0.3;
    }
    object.enemySpeed=constrain(object.enemySpeed,-12,12);

    object.moveDown=!object.moveDown;    
  }
}

//collision with the ship

void shipcollision()
{
  if(object.shipcollisionBullet==true)
  {
    object.Lives-=1;
    if(object.Lives<0)object.game=false;
  }
}