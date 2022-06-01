class FairyPawn extends Pawn{
  public FairyPawn(int col){
    super(col);
  }
  public ArrayList<Move> generateMoves(Board BOARD, int[] square){
    Piece[][] board = BOARD.getBoard();
    ArrayList<Move> moves = super.generateMoves(BOARD, square);
    ArrayList<Move> newMoves = generateSlidingMoves(board, square, new int[][]{{0, -getColor()}});
    moves.addAll(newMoves);
    return moves;
  }
}
