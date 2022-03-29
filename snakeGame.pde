import uibooster.*;

UiBooster booster1;
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
  booster1 = new UiBooster();
}

void draw() {
  background(0);

  switch(gameState) {

    case("RUN"):
    snake.update();
    snake.checkCollision();



    snake.render();
    food.render();
    scoreBoard1.run();

    break;

    case("GAME_OVER"):
    textSize(100);
    fill(255);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, height/4);
    answer = booster1.showTextInputDialog("Vill du spela igen?");
    if (answer == "ja") {
      gameState = "RUN";
    } else {
    exit(); }
      break;
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
  }
