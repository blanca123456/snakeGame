class Food {
  color foodColor = color(255);
  PVector position;

  Food(PVector _position) {
    position = _position;
  }

  void newPos(){
    position.x = random(0,width);
    position.y = random(0, height);
  }

  void update() {
  }

  void render() {
    fill (foodColor);
      // äpple?
      ellipse(position.x, position.y, 20, 20);
  }
  
}
