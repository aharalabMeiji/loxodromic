SL2C A, B;
Complex a;
Group klein;
void setup() {
  //Complex ta = new Complex(3,0), tb = new Complex(3,0); 
  //Complex ta = new Complex(2.7,0), tb = new Complex(2.7,0); //X
  //Complex ta = new Complex(2.2,0), tb = new Complex(2.2,0); //X
  //Complex ta = new Complex(2,0), tb = new Complex(2,0); 
  //Complex ta = new Complex(3,-0.5), tb = new Complex(3,0.5); 
  //Complex ta = new Complex(2,0.5), tb = new Complex(3,0); 
  //Complex ta = new Complex(2,0.5), tb = new Complex(2,0.5); 
  //Complex ta = new Complex(2,0.2), tb = new Complex(2,-0.2); 
  Complex ta = new Complex(2, 0.05), tb = new Complex(3, 0); 
  A = grammasRecipe(ta, tb, true);
  B = grammasRecipe(ta, tb, false);

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
    step = 2;
    klein.RenderTiling(mouseX,mouseY,2);
    updatePixels();
  } else {
  }
}

void keyPressed() {
  step++;
  //println(step);
  loadPixels();
  klein.RenderTiling(mouseX,mouseY,step);
  updatePixels();
}