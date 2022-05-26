class Queen extends Piece{
  public Queen(int col){
    super(col, 'q');
  }
  public ArrayList<Move> generateMoves(Piece[][] board,int[] square){
    ArrayList<Move> moves = new ArrayList<Move>();
    return moves;
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteQueen.png");
   } else{
    return loadImage("Pieces/BlackQueen.png");
   }
  }
}
