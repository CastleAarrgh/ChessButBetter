public class Bishop extends Piece{
  public Move[] generateMoves(){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(col == WHITE){
    return loadImage("Pieces/WhiteBishop");
   } else{
    return loadImage("Pieces/BlackBishop");
   }
  }
}
