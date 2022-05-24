class Queen extends Piece{
  public Queen(int col){
    super(col, 'q');
  }
  public Move[] generateMoves(){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteQueen");
   } else{
    return loadImage("Pieces/BlackQueen");
   }
  }
}
