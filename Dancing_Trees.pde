//    Dancing Recursive Trees 
//        Inspired by reading "Chaos: Making a New Science", listening to the music 
//        of Kendrick Lamar, and seeing a cool visualization of a recursive tree moving
//        to mouse stimulus, I want to make a recursive tree that moves smoothly 
//        to audio stimulus.
//
//     Fears which I cannot confirm or dismiss due to my current lack of knowledge of Processing
//         - Addition of more trees may cause intolerably and unavoidably bad performance
//         - Turning Recursive Tree into a class instead of just drawing a line and calling branch 
//           will make it too expensive to maintain adequate performance levels
//


float theta;   


void setup() {
  size(1280, 720);
}


void draw() {
  
  // Black background, white strokes, framerate
  background(0);
  frameRate(20);
  stroke(255);
  
  // Take in mouse's location on X axis, use it to begin recursive branching
  float a = (mouseX / (float) width) * 90f;
  theta = radians(a);
  translate(width/2,height);
  
  // Draw line and move to the end of it
  line(0,0,0,-120);
  translate(0,-120);
  
  // Start the recursive branching!
  branch(120);

}



// Recursive Tree Class
//
// Description: Creates recursive tree going vertically from the bottom of the screen at a given X 
//              location with a given length. Branches are created recursively from the point at the
//              top of the initial vertical line
//
// Methods: Constructor (draw first line, call Branch)
//          Branch      (create branches)
//          
// Data Members: None, due to the ephemeraltime of existence
//
// Special considerations: Because this is being rendered with a framerate specified in the
//                         "draw" function, and now it is a class object, care must be taken to 
//                         prevent memory leaks which could result. 
//                       
//                         Due to the fact that this is my first time using processing, more research 
//                         needs to be done to determine exactly how the objects can be deallocated upon
//                         frame change, and whether or not the constant samsara of recursive tree 
//                         reincarnation will cause program slowdown. 
//
class recursiveTree{
  public recursiveTree(float x, float length){
    
  }
  
  private void branch(float h){
    
  }
  
}


void branch(float h) {
  
  h *= 0.69;
  
  // Exit if branches become less than 2 pixels long
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}