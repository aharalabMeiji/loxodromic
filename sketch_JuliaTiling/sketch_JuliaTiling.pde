color texture[][];

void setup() {
  texture = new color[360][360];
  size(1000, 1000);
  PImage img = loadImage("cat.jpg");// 360*360の絵
  image(img, 0, 0);
  loadPixels();
  for (int x=0; x<360; x++) {
    for (int y=0; y<360; y++) {
      texture[y][x] = pixels[x+width*y];
    }
  }
}

void draw() {
  loadPixels();
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      pixels[x+y*width] = mainImage(x, y);
    }
  }
  updatePixels();
}

color mainImage(int x, int y) {
  float iResolution_x = width;
  float iResolution_y = height;
  float fragCoord_x = 1f * x;
  float fragCoord_y = 1f * y;
  float scale = 5.5;
  float maxiter = 256.;
  float bailout = exp(2 * PI);
  float zx =  scale*(2.* fragCoord_x / iResolution_y-iResolution_x/iResolution_y);
  float zy =  scale*(2.* fragCoord_y / iResolution_y-1.);
  float uvx = 2. * mouseX / iResolution_y - iResolution_x/iResolution_y;
  float uvy = 2. * mouseY / iResolution_y - 1.;
  if (mouseX==0 && mouseY==0) {
    uvx = 0.25f;
    uvy = 0f;
  }
  boolean bailed = false;
  for (float i = 0.; i<maxiter; i++) {
    float newZx = zx * zx - zy * zy + uvx;
    float newZy = 2 * zx * zy + uvy;
    zx = newZx;
    zy = newZy;
    if (sqrt(zx*zx+zy*zy)>bailout) {
      bailed = true;
      break;
    }
  }
  if (bailed==false) {
    return color(0, 0, 0);
  } else {
    int theta = int((atan2(zy, zx) + PI ) / 2 / PI * 360)%360;
    int R = int((0.5f*log(zx*zx+zy*zy) - 2 * PI) / 2 / PI * 360)%360;
    return texture[theta][R];
  }
}
