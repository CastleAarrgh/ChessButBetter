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
  float getWhiteTime(){
    return whiteTime;
  }
  float getBlackTime(){
    return blackTime;
  }
  void swap(){
    activePlayer = -activePlayer;
  }
}
