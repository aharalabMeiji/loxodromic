void setup(){
  
  size(1000,1000);
}



void draw(){
  loadPixels();
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      pixels[x+y*width] = mainImage(x,y);
    }
  }
  updatePixels();   

}

float scale = 5.5;
float maxiter=256.;
float pi = PI;
float pi2 = pi*2.;
float degree = 2.0;
float ratio = 1.;
float ratiopi2 = ratio*pi2;
float bailout = exp(ratiopi2);

color mainImage(int x, int y){
  float iResolution_x = width;
  float iResolution_y = height;
  float fragCoord_x = 1f * x;
  float fragCoord_y = 1f * y;
  //float time = iTime;
  float iter=0.;
  float zx =  scale*(2.* fragCoord_x / iResolution_y-iResolution_x/iResolution_y);
  float zy =  scale*(2.* fragCoord_y / iResolution_y-1.);
  float uvx = 2. * mouseX / iResolution_y - iResolution_x/iResolution_y;
  float uvy = 2. * mouseY / iResolution_y - 1.;
  if(mouseX==0 && mouseY==0){
    uvx = 0.25f;
    uvy = 0f;
  }
  boolean bailed = false;
  for(float i = 0.;i<maxiter;i++){
    iter=i;
    float m11 = zx;
    float m12 = -zy;
    float m21 = zy;
    float m22 = zx;
    float newZx = zx * m11 + zy * m21 + uvx;
    float newZy = zx * m12 + zy * m22 + uvy;
    zx = newZx;
    zy = newZy;
    if(sqrt(zx*zx+zy*zy)>bailout) {
      bailed = true;
      break;
    }
  }
  if (bailed==false) {
    return color(0,0,0);
  }
   
  
  return color(255,255,255);
}