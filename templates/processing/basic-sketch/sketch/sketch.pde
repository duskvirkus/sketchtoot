
void settings() {
  sketchtootSettings();
  size(1000, 520);
}

void setup() {

}

void displayFrameRate() {
  surface.setTitle("FPS: " + int(frameRate));
}

void draw() {
  displayFrameRate();
  background(0, 0, frameCount % 255);
}


void keyPressed() {
  sketchtootCheckExport();
}
