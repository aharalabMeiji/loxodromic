void setup(){
  SL2C A = new SL2C();
  A.setB(2,3);
  
  println(A.toString1());
  println(A.toString2());
 
  complex z = new complex(1,4);
  
  complex fz = A.f(z);
  println(fz.toString());
  
}

void draw(){
  
}