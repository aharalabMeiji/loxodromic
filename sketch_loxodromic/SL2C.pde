class SL2C {
  Complex a, b, c, d;

  SL2C () {
    a = new Complex (1f, 0f);    
    b = new Complex (0f, 0f);    
    c = new Complex (0f, 0f);    
    d = new Complex (1f, 0f);
  }

  void set11(Complex _a) {
    a.copy(_a);
  }
  void set11(float r, float i) {
    a.re = r;
    a.im = i;
  }
  Complex get11() {
    return a;
  }
  void set12(Complex _b) {
    b.copy(_b);
  }
  void set12(float r, float i) {
    b.re = r;
    b.im = i;
  }
  Complex get12() {
    return b;
  }
  void set21(Complex _c) {
    c.copy(_c);
  }
  void set21(float r, float i) {
    c.re = r;
    c.im = i;
  }
  Complex get21() {
    return c;
  }
  void set22(Complex _d) {
    d.copy(_d);
  }
  void set22(float r, float i) {
    d.re = r;
    d.im = i;
  }
  Complex get22() {
    return d;
  }
  
  String toString() {
    return "( "+a.toString()+" , "+b.toString()+" )\n( "+c.toString()+" , "+d.toString()+" )";
  }

  Complex F(Complex z) {
    Complex azb = a.copy();
    azb.times(z);
    azb.plus(b);
    Complex czd = c.copy();
    czd.times(z);
    czd.plus(d);
    azb.div(czd);
    return azb;
  }
  Complex FInv(Complex z) {  //(dz-b)/(-cz+a)
    Complex dzb = d.copy();//d
    dzb.times(z);//dz
    dzb.minus(b);//dz-b
    Complex cza = c.copy();//c
    cza.times(-1);//-c
    cza.times(z);//-cz
    cza.plus(a);//-cz+a
    dzb.div(cza);//(dz-b)/(-cz+a)
    return dzb;
  }

  void RenderOrbit(Complex c, int depth) {
    if (c.isOpen()) {
      c.Plot(depth);
      if (depth<10) {
        RenderOrbit(F(c), depth+1);
        RenderOrbit(FInv(c), depth+1);
      }
    }
  }

  void RenderAxis() {
  }
}

SL2C grammasRecipe(Complex ta, Complex tb, boolean A) {
  if (A) {
    SL2C ret = new SL2C();
    // get tab
    Complex a = new Complex(1, 0);
    Complex b = ta.copy();// ta
    b.times(tb);// ta*tb
    b.times(-1);// -ta*tb
    Complex c = ta.copy();// ta
    c.times(ta);// ta*ta
    Complex c1 = tb.copy();// tb
    c1.times(tb); // tb*tb;
    c.plus(c1);// ta*ta+tb*tb
    Complex tab = QuadraticEquation(a, b, c, false);
    println("t_ab = ",tab.toString());
    // get z0
    Complex z0 = tab.copy(); // tab
    z0.plus(-2);// (tab-2)
    z0.times(tb);// (tab-2)*tb
    Complex z1 = tb.copy();
    z1.times(tab);// tb*tab
    Complex z2 = ta.copy();// ta
    z2.times(-2);// -2ta
    Complex z3 = tab.copy();// tab
    z3.times(new Complex(0, 2));// 2i*tab
    z1.plus(z2);//tb*tab-2ta
    z1.plus(z3);//tb*tab-2ta+2i*tab
    z0.div(z1);//(tab-2)*tb/(tb*tab-2ta+2i*tab)
    println("z_0 = ",z0.toString());
    // a11, a22
    Complex a11 = ta.copy();
    a11.div(2);// ta/2
    ret.set11(a11);
    ret.set22(a11);
    // a12
    Complex a12 = ta.copy();//ta
    a12.times(tab);// ta*tab
    Complex a12a = tb.copy();//tb
    a12a.times(-2);// -2*tb
    a12.plus(a12a);// ta*tab-2*tb
    a12.plus(new Complex(0, 4));//ta*tab-2*tb+4i
    Complex a12b = tab.copy();//tab
    a12b.times(2);// 2*tab
    a12b.plus(4);// 2*tab+4
    a12b.times(z0);//(2*tab+4)*z0
    a12.div(a12b);//(ta*tab-2*tb+4i)/((2*tab+4)*z0)
    ret.set12(a12);
    // a21
    Complex a21 = ta.copy();//ta
    a21.times(tab);// ta*tab
    Complex a21a = tb.copy();//tb
    a21a.times(-2);// -2*tb
    a21.plus(a21a);// ta*tab-2*tb
    a21.plus(new Complex(0, -4));//ta*tab-2*tb-4i
    a21.times(z0);//(ta*tab-2*tb-4i)*z0
    Complex a21b = tab.copy();//tab
    a21b.times(2);// 2*tab
    a21b.plus(-4);// 2*tab-4
    a21.div(a21b);//(ta*tab-2*tb-4i)*z0/(2*tab-4)
    ret.set21(a21);
    return ret;
  } else {
    SL2C ret = new SL2C();
    //b11
    Complex b11=tb.copy();
    b11.plus(new Complex(0,-2));// tb-2i
    b11.div(2);//(tb-2i)/2
    ret.set11(b11);
    // b12
    Complex b12 = tb.copy();
    b12.div(2);// tb/2
    ret.set12(b12);
    ret.set21(b12);
    // b22
    Complex b22 = tb.copy();
    b22.plus(new Complex(0,2));// tb + 2i
    b22.div(2);//(tb+2i)/2
    ret.set22(b22);
    return ret;
  }
}