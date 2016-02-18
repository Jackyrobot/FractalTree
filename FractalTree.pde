private float fractionLength = .8; 
private int smallestBranch = 10; 
private float branchAngle = .5; 
int branches = 20;
public void setup() 
{   
  size(640, 480);    
  noLoop();
} 
public void draw() 
{   
  background(255);   
  stroke(138, 255, 22A0);   
  strokeWeight(5);
  line(320, 480, 320, 380);   
  drawBranches(320, 380, branches, 3*Math.PI/2);  //will add later
} 
public void drawBranches(int x, int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x, y, endX1, endX2);
  line(x, y, endX2, endY2);
  if (branchLength > smallestBranch)
  {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX1, endY1, branchLength, angle2);
  }
} 

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      branches = branches + 10;
    }
    else if (keyCode == DOWN){
      branches = branches - 10;
    }
  }
}
