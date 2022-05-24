public class Bishop extends Piece{
  public Bishop(int col){
    super(col, 'b');
  }
  public Move[] generateMoves(){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteBishop");
   } else{
    return loadImage("Pieces/BlackBishop");
   }
  }
}
