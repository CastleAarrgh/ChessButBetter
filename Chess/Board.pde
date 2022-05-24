import java.util.*;
class Board{
  final static int BLACK = -1;
  final static int WHITE = 1;
  private Piece[][] board;
  private int[] passantSquare;
  private boolean[] castlingRights;
  private int activePlayer;
  private int halfmoveclock;
  private int fullmoveclock;
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
    String[] fenString = fen.split(" ");
    String boardString = fenString[0];
    int row = 0;
    int col = 0;
    int colour;
    System.out.println(boardString);
    for(int i = 0; i < boardString.length(); i++){
      char c = boardString.charAt(i);
      if(Character.isUpperCase(c)){
        colour = WHITE;
      } else{
        colour = BLACK;
      }
      c = Character.toLowerCase(c);
      Piece piece;
      if(c == '/'){
        col = 0;
        row++;
      }
      else if(Character.isDigit(c)){
        col += Character.getNumericValue(c);
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
          case 'r':
            piece = new Rook(colour);
          default:
            piece = new King(colour);
            break;
        }      
          board[row][col] = piece;
          col++; 
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
