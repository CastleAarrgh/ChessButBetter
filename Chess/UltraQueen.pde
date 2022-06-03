class UltraQueen extends Queen{
  public UltraQueen(int col){
    super(col);
  }
  public ArrayList<Move> generateMoves(Board BOARD,int[] start){
    Piece[][] board = BOARD.getBoard();
    int[][] queenMoves = {{1,1},{1,0},{1,-1},{0,1},{0,-1},{-1,1},{-1,0},{-1,-1}};
    ArrayList<Move> moves = generateSlidingMoves(board, start, queenMoves);
    ArrayList<Move> knightMoves = new Knight(getColor()).generateMoves(BOARD, start);
    moves.addAll(knightMoves);
    return moves;
  }
}
