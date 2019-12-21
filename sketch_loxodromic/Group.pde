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
  void RenderOrbit(Complex c, int depth) {
    if (c.isOpen()) {
      c.Plot(depth);
      if (depth<50) {
        RenderOrbit(A.F(c), depth+1);
        RenderOrbit(A.FInv(c), depth+1);
        RenderOrbit(B.F(c), depth+1);
        RenderOrbit(B.FInv(c), depth+1);
      }
    }
  }
}
