import org.openkinect.processing.*;

Kinect2 k;
PImage depthImage;

int MAX_DEPTH = 1050;
int MIN_DEPTH = 750;

// kinect's orientation angle
float angle;

void setup() {
  size(1280, 480);
  
  // init camera
  k = new Kinect2(this);
  k.initDepth();
  k.initVideo();
  k.initIR();
  k.initDevice();

  // init blank image of depth map size
  depthImage = new PImage(k.depthWidth, k.depthHeight);
}

// Strip the background
void stripDepth(PImage img, int[] rawData) {
  // checking each byte of raw data, update img data as needed  
  for (int i=0; i < rawData.length; i++) {
    // if out of bound, ignore pixel (make it black)
    if (rawData[i] < MIN_DEPTH || rawData[i] > MAX_DEPTH) {
       img.pixels[i] = color(0);
    } else {
      float val = map(rawData[i], MIN_DEPTH, MAX_DEPTH, 0, 255);
      img.pixels[i] = color(255, val, 0);
    }
  }
}

void draw() {
  image(k.getDepthImage(), 0, 0);
  
  int[] rawDepth = k.getRawDepth();
  stripDepth(depthImage, rawDepth);
  depthImage.updatePixels();
  image(depthImage, k.depthWidth + 10, 0);
  
  fill(0);
  text("TILT: " + angle, 10, 20);
  text("THRESHOLD: [" + MIN_DEPTH + ", " + MAX_DEPTH + "]", 10, 36);
}