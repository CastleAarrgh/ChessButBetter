public class Bishop extends Piece{
  public Bishop(int col){
    super(col, 'b');
  }
  public Move[] generateMoves(int[] square){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteBishop.png");
   } else{
    return loadImage("Pieces/BlackBishop.png");
   }
  }
}
