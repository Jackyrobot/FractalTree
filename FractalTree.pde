private double fractionLength = .8; 
private int smallestBranch = 10;  
public int branches = 90;
double branchAngle; 
double newAngle;
public void setup() 
{   
  size(640, 450);    
} 
public void draw() 
{   
  branchAngle = mouseY * 0.002  + 0.2;
  newAngle = (float)mouseX/(float)width;
  background(0);   
  stroke(189, 255, 220);   
  strokeWeight(.45);
  line(320, 480, 320, 380);   
  drawBranches(320, 380, branches, 3*Math.PI/2);  //will add later
  if(branchAngle > 0.9) branchAngle = 0.9;
  if(branchAngle < 0.1) branchAngle = 0.1;
} 

public void keyPressed(){
  if(key == CODED){
    if (keyCode == UP){
      branches -= 10;
    }
    else if (keyCode == DOWN){
      branches += 10;
    }
  }
}

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle * newAngle;
  double angle2 = angle - branchAngle * (1-newAngle); 
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  strokeWeight(.45);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
