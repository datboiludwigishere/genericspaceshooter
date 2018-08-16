public class Bullet {
  public float x;
  public float y;
  public float r = 25/2;
  
  Bullet(float initx, float inity) {
    x = initx;
    y = inity;
  }
  
  public boolean hit(Enemy enemy) {
    float d = dist(x, y, enemy.x, enemy.y);
    if(d < r + enemy.r) {
      return true;
    } else {
      return false;
    }
  }
  
  public void move() {
    y -= 30;
  }
  
  public void display() {
    imageMode(CENTER);
    image(bullettext, x, y);
  }
}
