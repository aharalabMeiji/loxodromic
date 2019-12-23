class ComplexSquare {
  Complex x, y, z, w;
  ComplexSquare(Complex _x, Complex _y, Complex _z, Complex _w) {
    x = _x.copy();
    y = _y.copy();
    z = _z.copy();
    w = _w.copy();
  }

  void Plot(int hsb)
  {
    if (inSpot()) {
      // 色相環で回す。
      updatePixels();
      noStroke();
      fill(hsbColor[hsb%hsbColor.length]);
      beginShape();
      int x0 = int(yAxis+unit*x.re);
      int y0 = int(xAxis-unit*x.im);
      vertex(x0, y0);
      int x1 = int(yAxis+unit*y.re);
      int y1 = int(xAxis-unit*y.im);
      vertex(x1, y1);
      int x2 = int(yAxis+unit*z.re);
      int y2 = int(xAxis-unit*z.im);
      vertex(x2, y2);
      int x3 = int(yAxis+unit*w.re);
      int y3 = int(xAxis-unit*w.im);
      vertex(x3, y3);
      endShape(CLOSE);
      loadPixels();
    }
  }

  boolean inSpot() {
    float x0 = yAxis+unit*x.re;
    float y0 = xAxis-unit*x.im;
    float x1 = yAxis+unit*y.re;
    float y1 = xAxis-unit*y.im;
    float x2 = yAxis+unit*z.re;
    float y2 = xAxis-unit*z.im;
    float x3 = yAxis+unit*w.re;
    float y3 = xAxis-unit*w.im;
    return (0<=x0 && x0<width && 0<=y0 && y0<height)
      || (0<=x1 && x1<width && 0<=y1 && y1<height)
      || (0<=x2 && x2<width && 0<=y2 && y2<height)
      || (0<=x3 && x3<width && 0<=y3 && y3<height);
  }
  boolean isOpen() {
    int x0 = int(yAxis+unit*x.re);
    int y0 = int(xAxis-unit*x.im);
    if (0<=x0 && x0<width && 0<=y0 && y0<height && pixels[x0 + width * y0]==#ffffff) {
      return true;
    }
    int x1 = int(yAxis+unit*y.re);
    int y1 = int(xAxis-unit*y.im);
    if (0<=x1 && x1<width && 0<=y1 && y1<height && pixels[x1 + width * y1]==#ffffff) {
      return true;
    }
    int x2 = int(yAxis+unit*z.re);
    int y2 = int(xAxis-unit*z.im);
    if (0<=x2 && x2<width && 0<=y2 && y2<height && pixels[x2 + width * y2]==#ffffff) {
      return true;
    }
    int x3 = int(yAxis+unit*w.re);
    int y3 = int(xAxis-unit*w.im);
    if (0<=x3 && x3<width && 0<=y3 && y3<height && pixels[x3 + width * y3]==#ffffff) {
      return true;
    }
    return false;
  }
}