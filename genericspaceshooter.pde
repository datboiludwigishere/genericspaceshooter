import ddf.minim.*;

public Minim minim;
public AudioPlayer shoot;
public AudioPlayer death;
public AudioPlayer hit;

public boolean canShoot = true;
public int score = 0;
public int hiScore = score;
public int lives = 5;

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
  hit =   minim.loadFile("sound/hit.wav");

  ship = new Ship();
  border = new Border();
  shiptext   = loadImage("player.png");
  alientext  = loadImage("donald.png");
  bullettext = loadImage("bullet.png");
  bg         = loadImage("bg.jpg");
}

public void draw() {
  background(0);

  if (enemies.size() == 0) {
    text("Press 'Space' To Restart", 50, 20);
  }

  ship.display();
  ship.update();

  for (int i = 0; i < bullets.size(); i++) {
    Bullet bullet = (Bullet) bullets.get(i);
    bullet.display();
    bullet.move();
  }

  for (int i = 0; i < enemies.size(); i++) {
    Enemy enemy = (Enemy) enemies.get(i);
    if (!enemy.alive() || enemy.hit(ship)) {
        enemies.remove(i);
        score = score + 10;
    } else {
      enemy.display();
      enemy.update(random(1, 2), enemy);
    }
  }

  if (enemies.size() == 0) {
    createEnemies();
  }

  border.display();
  
         if(score < 10) {
    noStroke();
    fill(255);
    textSize(18);
    text("00000" + score, 10, width-180);
  } else if(score < 100) {
    noStroke();
    fill(255);
    textSize(18);
    text("0000" + score, 10, width-180);
  } else if(score < 1000) {
    noStroke();
    fill(255);
    textSize(18);
    text("000" + score, 10, width-180);
  } else if(score < 10000) {
    noStroke();
    fill(255);
    textSize(18);
    text("00" + score, 10, width-180);
  } else if(score < 100000) {
    noStroke();
    fill(255);
    textSize(18);
    text("0" + score, 10, width-180);
  } else {
    noStroke();
    fill(255);
    textSize(18);
    text(score, 10, width-180);
  }
}

public void keyReleased() {
  if (keyCode == RIGHT) {
    ship.speedX = 0;
  }

  if (keyCode == LEFT) {
    ship.speedX = 0;
  }

  if (key == 'z') {
    canShoot = true;
  }
}

public void keyPressed() {
  if (keyCode == RIGHT) {
    ship.speedX =  2 * (PI+1);
  }
  if (keyCode == LEFT) {
    ship.speedX = 2 * (-PI-1);
  }

  if (key == 'z') {
    if (canShoot) {
      Bullet bullet = new Bullet(ship.x, ship.y);
      bullets.add(bullet);
      shoot.play();
      shoot.rewind();
      canShoot = false;
    }
  }

  if (key == ' ') {
    if (enemies.size() == 0) {
      createEnemies();
    }
  }
}

public void createEnemies() {
  for (int i = 0; i <= 5; i++) {
    enemies.add(new Enemy(random(border.borderwidth, width-border.borderwidth), -45/2));
  }
}
