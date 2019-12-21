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
}

Complex rotation(float theta){
  return new Complex(cos(theta), sin(theta));
}

Complex QuadraticEquation(Complex a, Complex b, Complex c, boolean first){
 // (-b+sqrt(b^2-4*a*c))/(2a)
 if(
  
}
