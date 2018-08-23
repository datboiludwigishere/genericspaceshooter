public class Border {
  public int borderwidth = 60;
  public void display() {
    fill(0);
    noStroke();
    rect(0, 0, borderwidth, height);
    rect(width-borderwidth, 0, borderwidth, height);
  }
}
