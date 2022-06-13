public class CheckerKing extends Checker{
  public CheckerKing(int col){
    super(col);
  }
  public ArrayList<Move> generateMoves(Board BOARD, int[] start){
    int[][] checkerKingOffsets = new int[][]{{-1, -1}, {-1, 1}, {1, -1},{1, 1}};
    return generateCheckerMoves(BOARD, start, checkerKingOffsets);
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteCheckersKing.png");
   } else{
    return loadImage("Pieces/BlackCheckersKing.png");
   }
  }
}
