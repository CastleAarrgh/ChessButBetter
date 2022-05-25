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
  abstract public Move[] generateMoves(int[] square);
  abstract public PImage getPieceImage();
  public Move[] generateSlidingMoves(int[][]  offsets){
    return new Move[0];
  }
  public int getColor(){
    return col;
  }
  public int getType(){
    return type;
  }
  public String toString(){
    return "" + type;
  }
  
}
