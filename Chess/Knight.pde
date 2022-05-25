class Knight extends Piece{
  public Knight(int col){
    super(col, 'n');
  }
  public Move[] generateMoves(int[] square){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteKnight.png");
   } else{
    return loadImage("Pieces/BlackKnight.png");
   }
  }
}
