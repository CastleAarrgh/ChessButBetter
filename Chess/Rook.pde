class Rook extends Piece{
  public Rook(int col){
    super(col);
  }
  public Move[] generateMoves(){
    return new Move[0];
  }
  public PImage getPieceImage(){
   if(col == WHITE){
    return loadImage("Pieces/WhiteRook");
   } else{
    return loadImage("Pieces/BlackRook");
   }
  }
}
