class Snake {
  ArrayList<PVector> tail;
  color snakeColor = color(150, 0, 150);
  color headColor = color(250, 0, 200);
  float xSpeed = 5;
  float ySpeed = 0;
  float size = 20;

  Snake(PVector _position) {
    tail = new ArrayList<PVector>();
    tail.add(_position);
  }

  void update() {

    if (frameCount % 3 == 0) {
      int length = tail.size();
      PVector head = tail.get(length - 1);
      tail.add(new PVector(head.x + 3*xSpeed, head.y + 3*ySpeed));


      if (!checkFood(food)) {
        tail.remove(0);
      }
    }
  }


  void checkCollision() {
    int length = tail.size();
    PVector head = tail.get(length - 1);
    for (PVector segment : tail) {
      
      if(segment != head){
        if (head.dist(segment) < 3*xSpeed - 1 ) {
        gameState = "GAME_OVER";
      }
        break;
      }
    }
  }

  boolean checkFood(Food food) {
    int length = tail.size();
    PVector head = tail.get(length - 1);

    if (head.dist(food.position) < size - 1) {
      food.newPos();
      scoreBoard1.score = scoreBoard1.score + 1;
      return true;
    } else {
      return false;
    }
  }

  void render() {
    fill(snakeColor);

    int length = tail.size();
    for ( int i = 0; i< length - 1; i ++) {
      PVector segment = tail.get(i);
      ellipse (segment.x, segment.y, size, size);
    } 
    PVector head = tail.get(length - 1); 
    fill(headColor);
    ellipse (head.x, head.y, size, size);
  }
}
