import ddf.minim.*;

public Minim minim;
public AudioPlayer shoot;
public AudioPlayer death;

public float weirdycalc = (45/2)+60;
public boolean canShoot = true;

public Ship ship;
public ArrayList enemies = new ArrayList();
public Border border;
public ArrayList bullets = new ArrayList();
public PImage shiptext;
public PImage alientext;
public PImage bullettext;
public PImage bg;

public void setup() {
  size(640, 480);
  background(0);
  smooth(5);
  
  minim = new Minim(this);
  shoot = minim.loadFile("sound/shoot.wav");
  death = minim.loadFile("sound/death.wav");
  
  ship = new Ship();
  createEnemies();
  border = new Border();
  shiptext   = loadImage("player.png");
  alientext  = loadImage("donald.png");
  bullettext = loadImage("bullet.png");
  bg         = loadImage("bg.jpg");
}

public void draw() {
  background(0);
  
  if(enemies.size() == 0) {
    text("Press 'Space' To Restart",50,20);
  }
  
  ship.display();
  ship.update();
  
  for(int i = 0; i < bullets.size(); i++) {
    Bullet bullet = (Bullet) bullets.get(i);
    bullet.display();
    bullet.move();
  }
  
  for(int i = 0; i < enemies.size(); i++) {
    Enemy enemy = (Enemy) enemies.get(i);
    if(!enemy.alive()) {
      enemies.remove(i);
    } else {
      enemy.display();
    }
  }
  
  border.display(60);
}

public void keyReleased() {
  if(keyCode == RIGHT) {
    ship.speedX = 0;
  }
  
  if(keyCode == LEFT) {
    ship.speedX = 0;
  }
  
  if(key == 'z') {
    canShoot = true;
  }
}

public void keyPressed() {
  if(keyCode == RIGHT) {ship.speedX =  TAU+2;}
  if(keyCode == LEFT)  {ship.speedX = -TAU-2;}
  
  if(key == 'z') {
    if(canShoot) {
      Bullet bullet = new Bullet(ship.x, ship.y);
      bullets.add(bullet);
      shoot.play();
      shoot.rewind();
      canShoot = false;
    }
  }
  
  if(key == ' ') {
    if(enemies.size() == 0) {
      createEnemies();
    }
  }
}

public void createEnemies() {
  for(int i = 0; i <= 5; i++) {
    enemies.add(new Enemy((width-140)-i*70,weirdycalc));
  }
}
