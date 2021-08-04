int arcsNumber = 0;
int counter = 0;

Arc arcObj;

void setup() {
  arcsNumber = ceil(random(10,20));
  size(10000,10000);
  background(225);
}

void draw(){
  if (arcsNumber > 0){
    noFill();
    arcObj = new Arc(random(500),random(500), random(-PI/6,PI/4), random(PI/4,PI));
    arcObj.draw();
    arcsNumber -= 1;
  } else{
    noLoop();
  }
}

class Arc {
  float xPosition,yPosition, theta_one, theta_two, randomNum, arcLengthStart, initR, finalR;
  float x, y, r;
  
  Arc(float x, float y, float theta_one, float theta_two){
    this.xPosition = x;
    this.yPosition = y;
    this.theta_one = theta_one;
    this.theta_two = theta_two;
  }
  
  void draw(){
    translate(this.xPosition, this.yPosition);
    beginShape();
    arcLengthStart = random(this.theta_one, this.theta_two);
    randomNum = random(0,2);
    initR = random(width/2);
    finalR = initR+5;
    for(float i = arcLengthStart; i < this.theta_two; i+= 0.1){
      r = random(initR,finalR);
      x = r*cos(i);
      y = r*sin(i);
      strokeWeight(random(1.5));
      stroke(128, 128,128, random(60, 90));
      if (randomNum <= 1){
        float z = x;
        x = y;
        y = z;
      }
      vertex(x,y);
    }
    endShape();
    this.radomizeXY();
  }

  void radomizeXY(){
    xPosition = random(width);
    yPosition = random(height);
  }
}
