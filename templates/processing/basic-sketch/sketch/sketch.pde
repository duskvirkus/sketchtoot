
void settings() {
  sketchtootSettings();
  size(400, 400);
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
