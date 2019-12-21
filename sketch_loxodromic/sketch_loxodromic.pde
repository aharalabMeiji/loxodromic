SL2C A;
Complex a;

void setup(){

  A = new SL2C();
  A.set21(1,1);
  
  println(A.toString1());
  println(A.toString2());
 
  a = new Complex(1,0);

  size(1000,1000);
  
}

void draw(){
  RenderPlane();
  a.SetMouse();
  a.Plot(0,128,0);
  Complex fa = a.copy();
  for(int repeat=0;repeat<5; repeat++){
    fa = A.F(fa);
    fa.Plot(255 - repeat*20,0,0);
  }
  fa = a.copy();
  for(int repeat=0;repeat<5; repeat++){
    fa = A.FInv(fa);
    fa.Plot(0,255 - repeat*20,0);
  }
}
