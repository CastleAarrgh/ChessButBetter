class Rook extends Piece{
  public Rook(int col){
    super(col, 'r');
  }
  public Move[] generateMoves(int[] square){
    return new Move[0];
  }  
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteRook.png");
   } else{
    return loadImage("Pieces/BlackRook.png");
   }
  }
}
