public class Bishop extends Piece{
  public Bishop(int col){
    super(col, 'b');
  }
  public ArrayList<Move> generateMoves(Board BOARD,int[] start){
    Piece[][] board = BOARD.getBoard();
    int[][] bishopOffsets = {{1,1}, {1,-1}, {-1, 1}, {-1, -1}};
    ArrayList<Move> moves = generateSlidingMoves(board, start, bishopOffsets);
    return moves;
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteBishop.png");
   } else{
    return loadImage("Pieces/BlackBishop.png");
   }
  }
}
