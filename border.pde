public class Border {
  
  void display(int borderwidth) {
    fill(0);
    noStroke();
    rect(0, 0, borderwidth, height);
    rect(width-borderwidth, 0, borderwidth, height);
  }
}
