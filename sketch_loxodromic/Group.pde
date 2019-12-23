class Group {
  SL2C A, B;
  Group() {
    A = new SL2C();
    B = new SL2C();
  }

  void SetA(SL2C _A, SL2C _B)
  {
    A.set11(_A.get11());
    A.set12(_A.get12());
    A.set21(_A.get21());
    A.set22(_A.get22());
    B.set11(_B.get11());
    B.set12(_B.get12());
    B.set21(_B.get21());
    B.set22(_B.get22());
  }

  void RenderOrbit(Complex c, int depth, int dir) {
    if (c.isOpen()) {
      c.Plot(depth);
      if (depth<25) {
        if (dir!=1)
          RenderOrbit(A.F(c), depth+1, 0);
        if (dir!=0)
          RenderOrbit(A.FInv(c), depth+1, 1);
        if (dir!=3)
          RenderOrbit(B.F(c), depth+1, 2);
        if (dir!=2)
          RenderOrbit(B.FInv(c), depth+1, 3);
      }
    }
  }
  void RenderOrbit(ComplexSquare c, int depth, int dir) {
    if (c.isOpen()) {
      //println("plot");
      c.Plot(depth);
      if (depth<2) {
        if (dir!=1)
          RenderOrbit(A.F(c), depth+1, 0);
        if (dir!=0)
          RenderOrbit(A.FInv(c), depth+1, 1);
        if (dir!=3)
          RenderOrbit(B.F(c), depth+1, 2);
        if (dir!=2)
          RenderOrbit(B.FInv(c), depth+1, 3);
      }
    }
  }

  void RenderOrbitInverse(Complex c, int depth, int dir) {
  }

  void RenderTiling(int x0, int y0, int w) {
    for (int x=x0-w; x<=x0+w; x++) {
      for (int y=y0-w; y<=y0+w; y++) {
        Complex cc = new Complex(1f*(x-yAxis)/unit, -1f*(y-xAxis)/unit);
        RenderOrbit(cc, 0, -1);
      }
    }
  }

  //void RenderTiling(int x0, int y0, int w) {
  //  for (int x=x0-w; x<x0+w; x++) {
  //    for (int y=y0-w; y<y0+w; y++) {
  //      Complex cc = new Complex(1f*(x-yAxis)/unit, -1f*(y-xAxis)/unit);
  //      Complex aax=cc.copy(), aay=cc.copy(), aaz=cc.copy(), aaw=cc.copy();
  //      aax.plus(new Complex(0, 0));
  //      aay.plus(new Complex(0, 1f/unit));
  //      aaz.plus(new Complex(1f/unit, 1f/unit));
  //      aaw.plus(new Complex(1f/unit, 0));
  //      ComplexSquare aa=new ComplexSquare(aax, aay, aaz, aaw);
  //      klein.RenderOrbit(aa, 0, -1);
  //    }
  //  }
  //}
}