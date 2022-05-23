class Board{
  final static int BLACK = -1;
  final static int WHITE = 1;
  private Piece[][] board;
  private int[] passantSquare;
  private boolean[] castlingRights;
  private int activePlayer;
  private int numMovesPlayed;
  final private int size = 800;
  final private int squareSize = size / 8;
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
    color Black  = color(118,150,86);
    color White = color(238,238,210);
    
    
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
