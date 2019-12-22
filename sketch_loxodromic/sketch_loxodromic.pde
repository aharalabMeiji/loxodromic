SL2C A, B;
Complex a;
Group klein;
void setup() {
  A = new SL2C();
  A.set21(1, 1);
  B = new SL2C();
  B.set12(1, 1);

  klein = new Group();
  klein.SetA(A, B);

  println(klein.A.toString());
  println(klein.B.toString());

  a = new Complex(1, 0);

  size(1000, 1000);
  background(255);
}

int step = 2;

void draw() {
  if (mousePressed) {
    background(255);
    RenderPlane(false);
    a.SetMouse();
    loadPixels();
    //klein.RenderOrbit(a,0,-1);
    step = 2;
    klein.RenderTiling(mouseX,mouseY,2);
    updatePixels();
  }
  else {
  }
}

void keyPressed(){
  step++;
  //println(step);
    loadPixels();
    klein.RenderTiling(mouseX,mouseY,step);
    updatePixels();
}
