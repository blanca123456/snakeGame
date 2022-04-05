float textSize = 100; 
Snake snake;
Food food;
ScoreBoard scoreBoard1;

String answer; 

String gameState = "RUN";


void setup() {
  size(1000, 1000);
  snake = new Snake(new PVector(200, 200));
  food = new Food(new PVector(random(0, width), random(0, height)));
  scoreBoard1 = new ScoreBoard();
}

void draw() {
  background(0);

  switch(gameState) {

    case("RUN"):
    snake.update();

    snake.render();
    food.render();
    scoreBoard1.run();

    break;

    case("GAME_OVER"):
    textSize(textSize);
    fill(255);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, height/4);
    textSize(40);
    text( "Play again? (y/n)", width/2, height/4 + textSize + 5);

    if (keyPressed) {

      if (key == 'y') {
        gameState = "RUN";
        scoreBoard1.score = 0;
        snake = new Snake(new PVector(200, 200));
      } else if (key == 'n') {
        exit();
      }
      break;
    }
  }
}

void keyPressed() {

  switch (keyCode) {
  case LEFT: 
    snake.xSpeed = -5;
    snake.ySpeed = 0;
    break;

  case RIGHT: 
    snake.xSpeed = 5;
    snake.ySpeed = 0;
    break;

  case UP: 
    snake.xSpeed = 0;
    snake.ySpeed = -5;
    break;

  case DOWN: 
    snake.xSpeed = 0;
    snake.ySpeed = 5;
    break;
  }
  if (key == ' ') {
    gameState = "GAME_OVER";
  }
}
