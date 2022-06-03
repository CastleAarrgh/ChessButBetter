class MegaKing extends King{
  public boolean hasEscape;
  public MegaKing(int col){
    super(col);
    hasEscape = true;
  }
  public ArrayList<Move> generateMoves(Board BOARD, int[] start){
    Piece[][] board = BOARD.getBoard();
    ArrayList<Move> moves = super.generateMoves(BOARD, start);
    if(hasEscape){
      for(int r = 0; r < 8; r++){
        for(int c = 0; c < 8; c++){
          if(board[r][c] == null){
            moves.add(new Move(start, new int[]{r, c}));
          }
        }
      }
    }
  return moves;
  }
}
