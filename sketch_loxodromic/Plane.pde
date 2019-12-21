// Plane
  float xAxis;
  float yAxis;
  float unit;
  
void RenderPlane(){
  //background(255);
  xAxis = 0.5f * height;
  yAxis = 0.5f * width;
  unit = 0.2f*width;
  for(int x=-3; x<=3; x++){
    if(x==0){
      stroke(128);
    }
    else {
      stroke(200);
    }
    line(yAxis+unit*x,0,yAxis+unit*x,height);
  }
  for(int y=-3; y<=3; y++){
    if(y==0){
      stroke(128);
    }
    else {
      stroke(200);
    }
    line(0,xAxis+unit*y,width,xAxis+unit*y);
  }
}
