class Knight extends Piece{
  public Knight(int col){
    super(col, 'n');
  }
  public Move[] generateMoves(){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteKnight");
   } else{
    return loadImage("Pieces/BlackKnight");
   }
  }
}
