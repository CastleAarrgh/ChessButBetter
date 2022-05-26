public class Bishop extends Piece{
  public Bishop(int col){
    super(col, 'b');
  }
  public ArrayList<Move> generateMoves(Piece[][] board,int[] square){
    ArrayList<Move> moves = new ArrayList<Move>();
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
