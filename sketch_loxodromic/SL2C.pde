class SL2C{
  complex a,b,c,d;
  
  SL2C (){
    a = new complex (1f, 0f);    
    b = new complex (0f, 0f);    
    c = new complex (0f, 0f);    
    d = new complex (1f, 0f);
  }
  
  void setA(complex _a){
    a.copy(_a);
  }
  void setA(float r, float i){
    a.re = r;
    a.im = i;
  }
  void setB(complex _b){
    b.copy(_b);
  }
  void setB(float r, float i){
    b.re = r;
    b.im = i;
  }
  void setC(complex _c){
    c.copy(_c);
  }
  void setC(float r, float i){
    c.re = r;
    c.im = i;
  }
  void setD(complex _d){
    d.copy(_d);
  }
  void setD(float r, float i){
    d.re = r;
    d.im = i;
  }
  String toString1(){
    return "( "+a.toString()+" , "+b.toString()+" )";
  }
  String toString2(){
    return "( "+c.toString()+" , "+d.toString()+" )";
  }
  
  complex f(complex z){
    complex azb = a.copy();
    azb.times(z);
    azb.plus(b);
    complex czd = c.copy();
    czd.times(z);
    czd.plus(d);
    azb.div(czd);
    return azb;
  }
  
  
}

  //SL2C grammasRecipe(complex t1, complex t2){
    
    
  //}