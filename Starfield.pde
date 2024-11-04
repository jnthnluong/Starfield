//your code here
Particle [] Stars1 = new Particle[5000];

void setup()
{
  noStroke();
  size(800, 800);
  Stars1[Stars1.length-1] = new OddBallParticle();
  for (int i = 0; i < Stars1.length-1; i++) {
    Stars1[i] = new Particle();
  }

  //your code here
}
double landSize = 100;
// width/2, height/2, (Math.random()*0.6+0.02), (Math.random()*2*PI)
void draw()
{
  //your code here
  background(190, 217, 222);
  fill(110, 196, 93);
  ellipse(400, 400, (float)landSize,(float)landSize);
  noStroke();
  for (int i = 0; i < Stars1.length; i ++) {
    Stars1[i].move();
    Stars1[i].show();

    if (dist((float)Stars1[i].myX, (float)Stars1[i].myY, width/2, height/2) > 900) {

        landSize+=0.00001;

      
    }
  }
  if(landSize >800){
    noLoop();
  }
}
class Particle
{
  //your code here
  double myX, myY, mySpeed, myAngle, mySize;
  color myColor;


  Particle() {
    float r = 1 *sqrt((float)(Math.random())) +1;

    mySpeed = (Math.random()*20+0.01);
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
    ellipse((float)myX, (float)myY, 20, 20);

    //fill(myColor);
  }
  void reset() {
    float r = 50 *sqrt((float)(Math.random()));
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    myX = width/2+r*cos((float)myAngle);
    myY = height/2+r*sin((float)myAngle);
  }
}

class OddBallParticle extends Particle //inherits from Particle
{
  //your code here

  OddBallParticle() {
    mySpeed = 10;
    myX = width/2;
    myY = height/2;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  void move() {
    myX += (Math.random()*mySpeed-mySpeed/2);
    myY += (Math.random()*mySpeed-mySpeed/2);
  }
  void show() {
    //rect((float)myX-50, (float)myY-50, 50, 50);
    fill(0);
    stroke(0);
    line(375-391+(float)myX, 444-396+(float)myY, 391-391+(float)myX, 428-396+(float)myY);
    line(391-391+(float)myX, 428-396+(float)myY, 403-391+(float)myX, 444-396+(float)myY);
    line(391-391+(float)myX, 428-396+(float)myY, 391-391+(float)myX, 381-396+(float)myY);
    line(391-391+(float)myX, 396-396+(float)myY, 371-391+(float)myX, 395-396+(float)myY);
    line(371-391+(float)myX, 396-396+(float)myY, 379-391+(float)myX, 384-396+(float)myY);
    line(391-391+(float)myX, 396-396+(float)myY, 411-391+(float)myX, 391-396+(float)myY);
    line(411-391+(float)myX, 391-396+(float)myY, 403-391+(float)myX, 383-396+(float)myY);
    line((float)myX, (float)myY, 400, 400);
    fill(myColor);
    ellipse(391-391+(float)myX, 372-396+(float)myY, 20, 20);
  }
}
