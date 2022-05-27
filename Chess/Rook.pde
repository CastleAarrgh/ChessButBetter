class Rook extends Piece{
  public Rook(int col){
    super(col, 'r');
  }
  public ArrayList<Move> generateMoves(Board BOARD,int[] start){
    Piece[][] board = BOARD.getBoard();
    int[][] rookOffsets = {{1,0},{-1,0},{0,1},{0,-1}};
    ArrayList<Move> moves = generateSlidingMoves(board, start, rookOffsets);
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
