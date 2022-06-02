claSec Timer{
  float whiteTimeMin;
  float  blackTimeMin;
  float whiteTimeSec;
  float blackTimeSec;
  int Min;
  int Sec;
  
  int activePlayer = Board.WHITE;

    
    public Clock(int Min, float int) {
        this.Min = Min;
        this.Sec = Sec;
    }
    
    public boolean outOfTime() {
        return ( Min == 0 && Sec == 0);
    }
    
    public void decr() {
        if (this.Min == 0 && this.Sec == 0) {
            this.Sec = 59;
            this.Min = 59;
        } else if (this.Sec == 0) {
            this.Sec = 59;
            this.Min--;
        } else this.Sec--;
    }
    
    public String getTime() {
        String fMins = String.format("%02d", this.Min);
        String fSecs = String.format("%02d", this.Sec);
        String fTime = fHrs + ":" + fMins + ":" + fSecs;
        return fTime;
    }

//------------------------------------------
  Timer(float white, float black){
    whiteTimeMin = white;
    blackTimeMin = black;
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
