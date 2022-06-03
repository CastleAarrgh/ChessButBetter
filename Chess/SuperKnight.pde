class SuperKnight extends Knight{
  public SuperKnight(int col){
    super(col);
  }
  public ArrayList<Move> generateMoves(Board BOARD,int[] start){
    Piece[][] board = BOARD.getBoard();
    ArrayList<Move> moves = super.generateMoves(BOARD, start);
    ArrayList<Move> newMoves = new ArrayList<Move>();
    for(Move move: moves){
      int[] target = move.getTarget();
      newMoves.addAll(super.generateMoves(BOARD, target));
    }
    for(Move move: newMoves){
      moves.add(new Move(start, move.getTarget()));
    }
    return moves;
  }
}
