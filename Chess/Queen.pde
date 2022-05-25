class Queen extends Piece{
  public Queen(int col){
    super(col, 'q');
  }
  public Move[] generateMoves(int[] square){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteQueen.png");
   } else{
    return loadImage("Pieces/BlackQueen.png");
   }
  }
}
