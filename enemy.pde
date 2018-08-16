public class Enemy {
  public float x;
  public float y;
  public float r = 45/2;
  
  Enemy(float initx, float inity) {
    x = initx;
    y = inity;
  }
  
  public boolean alive() {
    for(int i = 0; i < bullets.size(); i++) {
      Bullet bullet = (Bullet) bullets.get(i);
      if(bullet.hit(this)) {
        bullets.remove(i);
        return false;
      }
    }
    return true;
  }
  
  public void display() {
    imageMode(CENTER);
    image(alientext, x, y, 45, 45);
  }
}
