class SL2C{
  Complex a,b,c,d;
  
  SL2C (){
    a = new Complex (1f, 0f);    
    b = new Complex (0f, 0f);    
    c = new Complex (0f, 0f);    
    d = new Complex (1f, 0f);
  }
  
  void set11(Complex _a){
    a.copy(_a);
  }
  void set11(float r, float i){
    a.re = r;
    a.im = i;
  }
  Complex get11(){
    return a;
  }
  void set12(Complex _b){
    b.copy(_b);
  }
  void set12(float r, float i){
    b.re = r;
    b.im = i;
  }
  Complex get12(){
    return b;
  }
  void set21(Complex _c){
    c.copy(_c);
  }
  void set21(float r, float i){
    c.re = r;
    c.im = i;
  }
  Complex get21(){
    return c;
  }
  void set22(Complex _d){
    d.copy(_d);
  }
  void set22(float r, float i){
    d.re = r;
    d.im = i;
  }
  Complex get22(){
    return d;
  }
  String toString(){
    return "( "+a.toString()+" , "+b.toString()+" )\n( "+c.toString()+" , "+d.toString()+" )";
  }
  
  Complex F(Complex z){
    Complex azb = a.copy();
    azb.times(z);
    azb.plus(b);
    Complex czd = c.copy();
    czd.times(z);
    czd.plus(d);
    azb.div(czd);
    return azb;
  }
  Complex FInv(Complex z){  //(dz-b)/(-cz+a)
    Complex dzb = d.copy();
    dzb.times(z);
    dzb.minus(b);
    Complex cza = c.copy();
    cza.times(-1);
    cza.times(z);
    cza.plus(a);
    dzb.div(cza);
    return dzb;
  }
  
  void RenderOrbit(Complex c,int depth){
    if(c.isOpen()){
      c.Plot(depth);
      if(depth<10){
        RenderOrbit(F(c),depth+1);
        RenderOrbit(FInv(c),depth+1);
      }
    }
  }
  
}

  //SL2C grammasRecipe(Complex t1, Complex t2){
    
    
  //}
