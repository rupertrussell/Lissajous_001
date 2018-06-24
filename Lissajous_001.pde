// Draws a Lissajous figures
// 1 April 2011
// improved 24 June 2018
// by Rupert Russell
// artwork avaiable on redbubble at: https://www.redbubble.com/people/rupertrussell
// http://www.rupert.id.au/tutorials/processing/ex...

float Scale = 1;
int screen_width = round(600 * Scale);
int screen_height = round(600 * Scale);

/* Scale image and reduce by 10 pixels to remove from edge of screen */
int AX = (screen_width/2) - round(10 * Scale);
int BX = (screen_height/2) - round(10 * Scale);

float a = 2;
float b = 1;

float counter = 0;
int saveCounter = 0;
float count = 0;

String str_count;
String file_name;

void setup() {
  background(255);
  size(600, 600);
  smooth();
  fill(255);
  strokeWeight(0.1);
}

// Based on Microworlds LOGO code from http://www.mathcats.com/gallery/15wordcontest.html
// repeat 360 [setxy (sin(2 * repcount)) * 150 (sin(3 * repcount)) * 150]

void draw() {
  fill(0);
  ellipse((sin(a * counter) * AX) + screen_width / 2, (sin(b * counter) * BX) + screen_height / 2, 5, 5);
  counter = counter + 0.005;  // smaller steps draws a smoother line
  saveCounter = saveCounter + 1;
  println(saveCounter);
  if (saveCounter > 30000) {
    save("Lissajou_001_a=" + a + "_b=" + b + "_"+ str(count) + ".png");
    saveCounter = 0;
    count = count + 1;
    background(255);

    // Loop 
    if (a < 11) {
      a = a+0.05; 
      if (a == 11) {
        a = 1;
        b = b+0.05;
      }
      // Stop after 100 
      if (b == 11) {
        noLoop();
      }
    }
    println("a = " + a);
    println("b = " + b);
    println(" ");
  }
}

// Save when mouse is clicked
void mouseClicked() {
  saveCounter = 30000;
}
