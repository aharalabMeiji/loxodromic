void setup(){

  SL2C A = new SL2C();
  A.set21(2,1);
  
  println(A.toString1());
  println(A.toString2());
 
  Complex z = new Complex(3,4);
  
  Complex fz = A.F(z);
  println(fz.toString());
  Complex ffz = A.FInv(fz);
  println(ffz.toString());
  size(1000,1000);
  
}

void draw(){
  RenderPlane();
}
