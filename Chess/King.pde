class King extends Piece{
  public King(int col){
    super(col);
  }
  public Move[] generateMoves(){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(col == WHITE){
    return loadImage("Pieces/WhiteKing");
   } else{
    return loadImage("Pieces/BlackKing");
   }
  }
}
