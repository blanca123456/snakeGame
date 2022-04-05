class ScoreBoard {
  int score;
  
  ScoreBoard(){
    score = 0;
  }
  
  void run(){
    render();
  }
  
  void render(){
    //textFont);
    textSize(25);
    fill(255,139,209);
   //textAlign(CENTER);
    text("Score:" + score, width - 140, 40);
  }
}
