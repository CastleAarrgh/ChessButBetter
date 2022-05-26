class Rook extends Piece{
  public Rook(int col){
    super(col, 'r');
  }
  public ArrayList<Move> generateMoves(Piece[][] board,int[] square){
    ArrayList<Move> moves = new ArrayList<Move>();
    return moves;
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteRook.png");
   } else{
    return loadImage("Pieces/BlackRook.png");
   }
  }
}
