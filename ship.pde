public class Ship {
  public float x = width/2;
  public float y = height-((45/2)+60);
  private float w = (width/2)/10;
  private float h = (height-20)/10;
  private float r = w/2;

  public float speedX = 0;

  public void update() {
    x += speedX;
    if (x >= width) {
      x = 0;
    } else if (x <= 0) {
      x = width;
    }
  }

  public void display() {
    imageMode(CENTER);
    image(shiptext, x, y, w, h);
  }
}
