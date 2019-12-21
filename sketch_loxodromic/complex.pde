class Complex{
  float re, im;
  Complex (){
    re = 0f;
    im = 0f;
  }
  Complex (float _re, float _im){
    re = _re;
    im = _im;
  }
  void Set(float _re, float _im){
    re = _re;
    im = _im;
  }
  void SetMouse(){
    re = (mouseX-yAxis)/unit;
    im = -(mouseY-xAxis)/unit;
  }
  Complex copy(){
    return new Complex (re, im);
  }

  void copy(Complex z){
    re = z.re;
    im = z.im;
  }
  
  String toString(){
    if(im>0f)
      return (re+"+"+im+"I");
    else if(im==0f)
      return (""+re);
    else 
      return (re+""+im+"I");
  }
  
  boolean equal(Complex z){
    return (re==z.re && im==z.im);
  }
  
  boolean equal(float z){
    return (re==z && im==0f);
  }
  
  void plus(Complex z){
    re += z.re;
    im += z.im;
  }
  
  void minus(Complex z){
    re -= z.re;
    im -= z.im;
  }
  
  void times(Complex z){
    float r = re * z.re - im * z.im;
    float i = re * z.im + im * z.re;
    re = r;
    im = i;
  }

  void times(float z){
    float r = re * z;
    float i = im * z;
    re = r;
    im = i;
  }

  void div(Complex z){
    float nn = z.re * z.re + z.im * z.im;
    if(nn==0f){
      return ;    
    }
    float r = (re * z.re + im * z.im) / nn;
    float i = (-re * z.im + im * z.re) / nn;
    re = r;
    im = i;
  }

  void div(float z){
    if(z==0) return;
    float r = re / z;
    float i = im / z;
    re = r;
    im = i;
  }

  void sqrt(boolean first){
    float theta = atan2(im, re);
    float norm = (float)Math.sqrt(re * re + im * im);
    float newTheta = theta/2;
    float newNorm = (float)Math.sqrt(norm);
    if(first){
      re = newNorm * cos(newTheta);
      im = newNorm * sin(newTheta);
    }
    else {
      re = -newNorm * cos(newTheta);
      im = -newNorm * sin(newTheta);
    }
  }
  
  void Plot(int hsb)
  {
    if(inSpot()){
      int x = int(yAxis+unit*re);
      int y = int(xAxis-unit*im);
      // 色相環で回す。
      pixels[x + width * y] = hsbColor[hsb%(hsbColor.length)];
    }
  }
  
  boolean inSpot(){
    float x = yAxis+unit*re;
    float y = xAxis-unit*im;
    return (0<=x && x<width && 0<=y && y<height);
  }
  boolean inWideSpot(){
    float x = yAxis+unit*re;
    float y = xAxis-unit*im;
    return (-width<=x && x<width*2 && -height<=y && y<height*2);
  }
  boolean isOpen(){
    if(inSpot()){
      int x = int(yAxis+unit*re);
      int y = int(xAxis-unit*im);
      color c = pixels[x + width * y];
      if(c==#ffffff){
        return true;
      }
    }
    return false;
  }
}

Complex rotation(float theta){
  return new Complex(cos(theta), sin(theta));
}

Complex QuadraticEquation(Complex a, Complex b, Complex c, boolean first){
  // (-b+sqrt(b^2-4*a*c))/(2a)
  if(a.equal(0)){// linear equation -c/b;
    Complex ans=c.copy();//c
    ans.times(-1);//-c
    ans.div(b); // -c/b
    return ans;
  }
  else {
    Complex d = b.copy();//b;
    d.times(b);// b^2;
    Complex ac4 = a.copy();//a
    ac4.times(c);//ac;
    ac4.times(4f);// 4ac
    d.minus(ac4);// b^2-4ac;
    d.sqrt(first);// sqrt(b^2-4ac);
    Complex ans = b.copy();// b;
    ans.times(-1);//-b;
    ans.plus(d);//-b+sqrt(b^2-4ac);
    ans.div(a);//(-b+sqrt(b^2-4ac))/(a);
    ans.div(2);//(-b+sqrt(b^2-4ac))/(2a);
    return ans;
  }
}
