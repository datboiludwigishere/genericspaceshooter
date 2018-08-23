public class Enemy {
  public float x;
  public float y;
  public float r = 45/2;

  public Enemy(float initx, float inity) {
    x = initx;
    y = inity;
  }

  public void update(float speed, Enemy enemy) {
    enemy.y += speed;
    if (y > height+r) {
      enemies.remove(enemy);
    }
  }
  
  public boolean hit(Ship ship) {
    float d = dist(x, y, ship.x, ship.y);
    if(d < r + ship.r) {
      return true;
    } else {
      return false;
    }
  }

  public boolean alive() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = (Bullet) bullets.get(i);
      if (bullet.hit(this)) {
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
