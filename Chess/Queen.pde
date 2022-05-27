class Queen extends Piece{
  public Queen(int col){
    super(col, 'q');
  }
  public ArrayList<Move> generateMoves(Board BOARD,int[] start){
    Piece[][] board = BOARD.getBoard();
    int[][] queenMoves = {{1,1},{1,0},{1,-1},{0,1},{0,-1},{-1,1},{-1,0},{-1,-1}};
    ArrayList<Move> moves = generateSlidingMoves(board, start, queenMoves);
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
