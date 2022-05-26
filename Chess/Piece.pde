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
  public boolean inBounds(int[] square){
    return square[0] >= 0 && square[0] <= 7 && square[1] >= 0 && square[1] <= 7;
  }
  public ArrayList<Move> generateSlidingMoves(int[] square, int[][]  offsets){
    ArrayList<Move> moves = new ArrayList<Move>();
    for(int[] offset: offsets){
      int[] target = {square[0] + offset[0], square[1] + offset[1]};
      while(
    }
    return moves;
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
