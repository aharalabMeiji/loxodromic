SL2C A,B;
Complex a;
Group klein;
void setup(){

  A = new SL2C();
  A.set21(1,0);
  B = new SL2C();
  B.set12(1,0);
  
  klein = new Group();
  klein.SetA(A,B);
  
  println(klein.A.toString1());
  println(klein.A.toString2());

   println(klein.B.toString1());
  println(klein.B.toString2());

  a = new Complex(1,0);

  size(1000,1000);
}

void draw(){
  background(255);
  RenderPlane();
  a.SetMouse();
  klein.RenderOrbit(a,0);
}
