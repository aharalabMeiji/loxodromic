// Plane
float xAxis;
float yAxis;
float unit;

color[] hsbColor ={
  color(255,0,0),
  color(255,64,0),
  color(255,128,0),
  color(255,192,0),
  color(255,255,0),
  color(192,255,0),
  color(128,255,0),
  color(64,255,0),
  color(0,255,0),
  color(0,255,64),
  color(0,255,128),
  color(0,255,192),
  color(0,255,255),
  color(0,192,255),
  color(0,128,255),
  color(0,64,255),
  color(0,0,255),
  color(64,0,255),
  color(128,0,255),
  color(192,0,255),
  color(255,0,255),
  color(255,0,192),
  color(255,0,128),
  color(255,0,64),
};

void RenderPlane(boolean render) {
  //background(255);
  xAxis = 0.5f * height;
  yAxis = 0.5f * width;
  unit = 0.2f*width;
  if (render) {
    for (int x=-3; x<=3; x++) {
      if (x==0) {
        stroke(128);
      } else {
        stroke(200);
      }
      line(yAxis+unit*x, 0, yAxis+unit*x, height);
    }
    for (int y=-3; y<=3; y++) {
      if (y==0) {
        stroke(128);
      } else {
        stroke(200);
      }
      line(0, xAxis+unit*y, width, xAxis+unit*y);
    }
  }
}
