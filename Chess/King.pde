class King extends Piece{
  public King(int col){
    super(col, 'k');
  }
  public ArrayList<Move> generateMoves(Board BOARD,int[] square){
    Piece[][] board = BOARD.getBoard();
    ArrayList<Move> moves = new ArrayList<Move>();
    return moves;
  }
  public PImage getPieceImage(){
   if(getColor()== WHITE){
    return loadImage("Pieces/WhiteKing.png");
   } else{
    return loadImage("Pieces/BlackKing.png");
   }
  }
}
