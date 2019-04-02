class complex{
  float re, im;
  complex (){
    re = 0f;
    im = 0f;
  }
  complex (float _re, float _im){
    re = _re;
    im = _im;
  }
  
  complex copy(){
    return new complex (re, im);
  }

  void copy(complex z){
    re = z.re;
    im = z.im;
  }
  
  String toString(){
    return (re+"+"+im+"I");
  }
  
  void plus(complex z){
    re += z.re;
    im += z.im;
  }
  
  void minus(complex z){
    re -= z.re;
    im -= z.im;
  }
  
  void times(complex z){
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

  void div(complex z){
    float nn = z.re * z.re + z.im * z.im;
    if(nn==0f){
      ;    
    }
    float r = (re * z.re + im * z.im) / nn;
    float i = (-re * z.im + im * z.re) / nn;
    re = r;
    im = i;
  }

  void div(float z){
    float r = re / z;
    float i = im / z;
    re = r;
    im = i;
  }

  void sqrt(){
    float theta = atan2(im, re);
    float norm = (float)Math.sqrt(re * re + im * im);
    float newTheta = theta/2;
    float newNorm = (float)Math.sqrt(norm);
    re = newNorm * cos(newTheta);
    im = newNorm * sin(newTheta);
  }
  
  
}

complex rot(float theta){
  return new complex(cos(theta), sin(theta));
}