class Pawn extends Piece{
  public Pawn(int col){
    super(col, 'p');
  }
  public Move[] generateMoves(int[] square){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhitePawn.png");
   } else{
    return loadImage("Pieces/BlackPawn.png");
   }
  }
}
