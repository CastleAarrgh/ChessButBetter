abstract class Piece{
  final static int BLACK = -1;
  final static int WHITE = 1;
  int col;
  //generate all possible moves for a piece
  abstract Move[] generateMoves();
  abstract PImage getPieceImage();
  public Move[] generateSlidingMoves(int[][]  offsets){
    return new Move[0];
  }
  public int getColor(){
    return col;
  }
  
}
