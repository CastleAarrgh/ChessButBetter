class Pawn extends Piece{
  public Pawn(int col){
    super(col);
  }
  public Move[] generateMoves(){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(col == WHITE){
    return loadImage("Pieces/WhitePawn");
   } else{
    return loadImage("Pieces/BlackPawn");
   }
  }
}
