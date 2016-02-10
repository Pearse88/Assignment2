class Object
{
  boolean flag;
  boolean game;
  boolean moveDown;
  boolean right,left,shoot;
  boolean wall;
  boolean play;
  boolean shipcollision;
  boolean shipcollisionBullet;

  float enemySpeed;

  int enemyX;
  int enemyY;
  int Lives;
  int score;
  int fcount;
  
  PFont fontA;

  Object()
  {
    enemyX=width/10+35;
    enemyY=height/10+50;
    flag=true;
    moveDown=false;
    game=true;
    right=false;
    left=false;
    shoot=false;
    wall=false;
    play=false;
    shipcollision=false;
    shipcollisionBullet=false;
    Lives=3;
    enemySpeed=5;
    fcount=30;
    score=0;
   
    fontA = loadFont("CourierNew36.vlw");
  }


}