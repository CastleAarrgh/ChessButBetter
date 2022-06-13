class JumpyRook extends Rook{
  public JumpyRook(int col){
    super(col);
  }
  public ArrayList<Move> generateMoves(Board BOARD,int[] start){
    Piece[][] board = BOARD.getBoard();
    ArrayList<Move> moves = super.generateMoves(BOARD, start);
    int[][] rookOffsets = {{1,0},{-1,0},{0,1},{0,-1}};
    int col = board[start[0]][start[1]].getColor();
    for(int[] offset: rookOffsets){
      int[] target = new int[]{start[0] + offset[0], start[1] + offset[1]};
      int[] finalTarget = new int[]{start[0] + 2 * offset[0], start[1] + 2 * offset[1]};
      if(inBounds(target) && inBounds(finalTarget)){
        Piece piece = pieceOn(board, target);
        Piece landingPiece = pieceOn(board, finalTarget);
        if(piece != null && piece.getColor() ==  col && (landingPiece == null || landingPiece.getColor() != col)){
          moves.add(new Move(start, finalTarget));
        }
      }
    }
    return moves;
  }
}
