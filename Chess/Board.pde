import java.util.*;
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
    importFEN("rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1");
  }
  /* Generate Board based on provided FEN starting position
  */
  Board(String startingFen){
    importFEN(startingFen);
  }
  // display the board background and the pieces
  public void displayBoard(){
final int BLOCKX = width / 8;
final int BLOCKY = height / 8;
    color Black  = color(118,150,86);
    color White = color(238,238,210);
  
  for (int i = 0; i < 8; i ++) {
    for (int j = 0; j < 8; j ++) {
      if ((i + j + 1) % 2 == 0) {
        fill(White); // white
      } else {
        fill(Black); // black
      }
      rect(i * BLOCKX, j * BLOCKY, (i + 1) * BLOCKX, (j + 1) * BLOCKY);     
    } 
  }
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
    board = new Piece[8][8];
    int row = 0;
    int col = 0;
    int colour;
    for(int i = 0; i < fen.length(); i++){
      char c = fen.charAt(i);
      if(Character.isUpperCase(c)){
        colour = WHITE;
      } else{
        colour = BLACK;
      }
      c = Character.toLowerCase(c);
      Piece piece;
      if(c == '/'){
        row = 0;
        col++;
      }
      else if(Character.isDigit(c)){
        row += Character.getNumericValue(c);
      }
      else{
        switch(c){
          case 'p':
            piece = new Pawn(colour);
            break;
          case 'n':
            piece = new Knight(colour);
            break;
          case 'b':
            piece = new Bishop(colour);
            break;
          case 'q':
            piece = new Queen(colour);
            break;
          default:
            piece = new King(colour);
            break;
        }
        board[row][col] = piece;
      }
    }
  }
  public String toString(){
    String out = "";
    for(int i = 0; i < 8; i++){
      for(int j = 0; j < 8; j++){
        out += board[i][j] + " ";
      }
      out += "\n";
    }
    return out;
  }
}
