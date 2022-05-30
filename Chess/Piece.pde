abstract class Piece{
  final public static int BLACK = -1;
  final public static int WHITE = 1;
  private char type;
  private int col;
  //generate all possible moves for a piece
  public Piece(int col, char type){
    this.col = col;
    this.type = type;
  }
  abstract public ArrayList<Move> generateMoves(Board board, int[] piece);
  abstract public PImage getPieceImage();
  public boolean inBounds(int[] square){
    return square[0] >= 0 && square[0] <= 7 && square[1] >= 0 && square[1] <= 7;
  }
  public ArrayList<Move> generateSlidingMoves(Piece[][] board, int[] start, int[][]  offsets){
    ArrayList<Move> moves = new ArrayList<Move>();
    for(int[] offset: offsets){
      int[] target = {start[0] + offset[0], start[1] + offset[1]};
      int col = board[start[0]][start[1]].getColor();
      while(inBounds(target)){
        Piece piece = board[target[0]][target[1]];
        if(piece == null){
          moves.add(new Move(start.clone(), target.clone()));
        } else if(piece.getColor() != col){
          moves.add(new Move(start.clone(), target.clone()));
          break;
        } else{
          break;
        }
        target[0] += offset[0];
        target[1] += offset[1];
      }
    }
    return moves;
  }
  public Piece pieceOn(Piece[][] board, int[] square){
    Piece piece = board[square[0]][square[1]];
    return piece;
  }
  public int getColor(){
    return col;
  }
  public char getType(){
    return type;
  }
  public String toString(){
    return "" + type;
  }
}
