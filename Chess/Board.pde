class Board{
  final int BLACK = -1;
  final int WHITE = 1;
  private Piece[][] board;
  private int[] passantSquare;
  private boolean[] castlingRights;
  private int activePlayer;
  private int numMovesPlayed;
  /*
  Board constructor takes in no positions and generates 
  the default starting chess position.
  */
  Board(){
    
  }
  /* Generate Board based on provided FEN starting position
  */
  Board(String startingFen){
  }
  // display the board background and the pieces
  public void displayBoard(){
  }
  //display background that the pieces will go onto.
  public void displayBackground(){
  }
  //display all picees from the board array
  public void displayPieces(){
  }
  //board accessor method
  public Piece[][] getBoard(){
    return board;
  }
  //export board state as fen
  public String exportFen(){
    return "";
  }
  //-1: black wins, 1: white wins, 0: tie
  public int isEnded(){
    return 0;
  }
  //display game over screen
  private void GameOver(){
  }
  private Move[] generateMoves(){
    return new Move[0];
  }
  private boolean isValid(Move move){
    return true;
  }
  private void importFEN(String fen){
  }
}
