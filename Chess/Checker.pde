public class Checker extends Piece{
  public Checker(int col){
    super(col, 'q');
  }
  public ArrayList<Move> generateMoves(Board BOARD,int[] start){
    Piece[][] board = BOARD.getBoard();
    
    return moves;
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteChecker.jpg");
   } else{
    return loadImage("Pieces/BlackChecker.jpg");
   }
  }
}
