//your code here
Particle [] Stars1 = new Particle[1000000];
int usedStars = 10;
void setup()
{
  noStroke();
  size(800, 800);

  for (int i = 0; i < usedStars; i++) {
    Stars1[i] = new Particle(); // slightly faster than stars2
  }

  //your code here
}
int cycles = 0;
// width/2, height/2, (Math.random()*0.6+0.02), (Math.random()*2*PI)
void draw()
{
  noStroke();
  int addStars = (int)(Math.random()*3+1);
  //your code here
  background(53, 60, 62);
  for (int i = 0; i < usedStars; i ++) {
    noStroke();
    Stars1[i].move();
    Stars1[i].show();

    Stars1[i].mySpeed += 0.2;
  }

  for (int i = usedStars; i < usedStars+addStars; i++) {
    if ((int)(Math.random()*1000) < 4) {
      Stars1[i] = new OddBallParticle();
    } else {
      Stars1[i] = new Particle();
    }
  }
  usedStars+=addStars;
}
class Particle
{
  //your code here
  double myX, myY, mySpeed, myAngle, mySize;
  color myColor;


  Particle() {
    float r = 40*sqrt((float)(Math.random())) +30; // first number is radius from center of where dots can spawn, second number is how far each dot MUST be from center

    mySpeed = 0.1;
    myAngle = (Math.random()*2*PI);
    myX = width/2+r*cos((float)myAngle);
    myY = height/2+r*sin((float)myAngle);
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }



  void move() {

    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
  }
  void show() {
    fill(255);
    /*if ((int)(Math.random()*100) < 50) {
     ellipse((float)myX, (float)myY, 5, 20);
     } else {
     ellipse((float)myX, (float)myY, 20, 5);
     }*/
    ellipse((float)myX, (float)myY, 20, 20);
  }

}

class OddBallParticle extends Particle //inherits from Particle
{
  //your code here
  int random =(int)(Math.random()*100);
  OddBallParticle() {
    mySpeed = (int)(Math.random()*40+20);
    mySize = (int)(Math.random()*50-25);

    if (random <25) {
      myX = 0;
      myY = 0;
    } else if (random > 25 && random < 50) {
      myX = width;
      myY= 0;
    } else if (random > 50 && random < 75) {
      myX = width;
      myY = height;
    } else {
      myX = 0;
      myY = height;
    }
    myX = myX + (int)(Math.random()*500-250);
    myY = myY + (int)(Math.random()*500-250);



    myColor = color(147, 117, 117);
  } 

  void show() {
    //rect((float)myX-50, (float)myY-50, 50, 50);

    stroke(0);
    strokeWeight(5);
    fill(234, 176, 47);
    ellipse((float)myX, (float)myY, 65+(float)mySize, 65+(float)mySize);

    fill(196, 187, 168);
    ellipse((float)myX, (float)myY, 50+(float)mySize, 50+(float)mySize);
    ellipse((float)myX+(int)(Math.random()*40-20), (float)myY+(int)(Math.random()*40-20), (float)mySize+50, (float)(mySize)+50);
  }
  void move() {
    if (random <25) {
      myX = myX + mySpeed;
      myY = myY + mySpeed;
    } else if (random > 25 && random < 50) {
      myX = myX - mySpeed;
      myY= myY + mySpeed;
    } else if (random > 50 && random < 75) {
      myX = myX - mySpeed;
      myY = myY - mySpeed;
    } else {
      myX = myX + mySpeed;
      myY = myY - mySpeed;
    }
  }
}
