private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = 0.5;  
public int branches = 90;
public void setup() 
{   
  size(640, 500);    
} 
public void draw() 
{   
  background(0);   
  stroke(189, 255, 220);   
  strokeWeight(.25);
  line(320, 480, 320, 380);   
  drawBranches(320, 380, branches, 3*Math.PI/2);  //will add later
} 

public void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      branchAngle += 0.1;
    }
    else if (keyCode == DOWN){
      branchAngle -= 0.1;
    }
  }
}

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1= angle + branchAngle;
  double angle2= angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  strokeWeight(.25);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
