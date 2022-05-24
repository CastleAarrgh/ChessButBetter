class Queen extends Piece{
  public Queen(int col){
    super(col);
  }
  public Move[] generateMoves(){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(col == WHITE){
    return loadImage("Pieces/WhiteQueen");
   } else{
    return loadImage("Pieces/BlackQueen");
   }
  }
}
