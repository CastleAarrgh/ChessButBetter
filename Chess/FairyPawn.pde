class FairyPawn extends Pawn{
  public FairyPawn(int col){
    super(col);
  }
  public ArrayList<Move> generateMoves(Board BOARD, int[] square){
    Piece[][] board = BOARD.getBoard();
    ArrayList<Move> moves = super.generateMoves(BOARD, square);
    ArrayList<Move> newMoves = generateSlidingMoves(board, square, new int[][]{{-getColor(), 0}});
    //moves.addAll(newMoves);
    if(newMoves.size() >= 2){
      moves.add(newMoves.get(newMoves.size() - 2));
    }
    return moves;
  }
}
