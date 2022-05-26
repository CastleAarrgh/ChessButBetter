class Pawn extends Piece{
  public Pawn(int col){
    super(col, 'p');
  }
  public ArrayList<Move> generateMoves(Piece[][] board,int[] square){
    ArrayList<Move> moves = new ArrayList<Move>();
    return moves;
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhitePawn.png");
   } else{
    return loadImage("Pieces/BlackPawn.png");
   }
  }
}
