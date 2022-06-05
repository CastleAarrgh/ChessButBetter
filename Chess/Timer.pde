class Timer{
  float whiteTime;
  float  blackTime;
  int activePlayer = Board.WHITE;
  Timer(float white, float black){
    whiteTime = white;
    blackTime = black;
  }
  void tick(){
    if(activePlayer == Board.WHITE){
      whiteTime--;
    } else{
      blackTime--;
    }
  }
  void tick(float seconds){
    if(activePlayer == Board.WHITE){
      whiteTime -= seconds;
    } else{
      blackTime -= seconds;
    }
  }
  }
  float getWhiteTime(){
    return whiteTime;
  }
  float getBlackTime(){
    return blackTime;
  }
  void swap(){
    activePlayer = -activePlayer;
  }
  public void displayTimer(){
    fill(111);
    rect(800, 200, 200, 400);
    fill(0);
    line(800, 400, 1000, 400);
    fill(255);
    textSize(50);
    textAlign(LEFT);
    text(formatTimer((int)blackTime), 850, 300);
    text(formatTimer((int)whiteTime), 850, 500);
  }
  private String formatTimer(int time){
    int minutes = time / 60;
    int seconds = time % 60;
    return minutes + ":" + String.format("%02d", seconds);
  }
}
