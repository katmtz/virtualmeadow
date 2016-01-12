
// Libraries used: opencv, openkinect
import gab.opencv.*;
import java.awt.*;
import org.openkinect.processing.*;

Kinect2 kinect;

// Empty images to construct from the kinect depth data
PImage hands;
PImage objects;

// Empty arrays to hold hand and object depth data
int[] handsDepth;
int[] objectsDepth;

// Depth Slicing Tolerances
int HANDS_MAX_DEPTH = 1000;
int HANDS_MIN_DEPTH = 500;

// Color recognition tolerance
int COLOR_TOLERANCE = 25;

void setup() {
  size(1280, 480);
  
  // initialize kinect
  kinect = new Kinect2(this);
  kinect.initDepth();
  kinect.initVideo();
  kinect.initDevice();
  
  // initialize images
  hands = new PImage(kinect.depthWidth, kinect.depthHeight);
  objects = new PImage(kinect.depthWidth, kinect.depthHeight);
 
  // initialize arrays?
}

/*
 * function stripDepth()
 *  move through the depth array and grab 
 */
void stripDepth() {
  
}
  