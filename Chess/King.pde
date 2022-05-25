class King extends Piece{
  public King(int col){
    super(col, 'k');
  }
  public Move[] generateMoves(int[] square){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(getColor()== WHITE){
    return loadImage("Pieces/WhiteKing.png");
   } else{
    return loadImage("Pieces/BlackKing.png");
   }
  }
}
