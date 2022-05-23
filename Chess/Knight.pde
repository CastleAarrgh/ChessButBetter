class Knight extends Piece{
  public Move[] generateMoves(){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(col == WHITE){
    return loadImage("Pieces/WhiteKnight");
   } else{
    return loadImage("Pieces/BlackKnight");
   }
  }
}
