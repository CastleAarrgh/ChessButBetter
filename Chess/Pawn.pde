class Pawn extends Piece{
  public Pawn(int col){
    super(col, 'p');
  }
  public Move[] generateMoves(){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhitePawn");
   } else{
    return loadImage("Pieces/BlackPawn");
   }
  }
}
