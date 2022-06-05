class SwitcherBishop extends Bishop{
  public SwitcherBishop(int col){
    super(col);
  }
  public ArrayList<Move> generateMoves(Board BOARD, int[] square){
    Piece[][] board = BOARD.getBoard();
    ArrayList<Move> moves = super.generateMoves(BOARD, square);
    ArrayList<Move> kingMoves = new King(getColor()).generateMoves(BOARD, square);
    moves.addAll(kingMoves);
    return moves;
  }
}
