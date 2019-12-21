SL2C A;
Complex a;

void setup(){

  A = new SL2C();
  A.set21(1,0);
  
  println(A.toString1());
  println(A.toString2());
 
  a = new Complex(1,0);
  
  //Complex ffz = A.FInv(fz);
  //println(ffz.toString());
  size(1000,1000);
  
}

void draw(){
  RenderPlane();
  a.SetMouse();
  A.F(a).Plot(128,0,0);
  A.F(A.F(a)).Plot(255,0,0);
  A.FInv(a).Plot(0,0,128);
  A.FInv(A.FInv(a)).Plot(0,0,255);
}
