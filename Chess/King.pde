class King extends Piece {
  public King(int col) {
    super(col, 'k');
  }
  public ArrayList<Move> generateMoves(Board BOARD, int[] start) {
    Piece[][] board = BOARD.getBoard();
    ArrayList<Move> moves = new ArrayList<Move>();
    int[][] offsets = {{1, 1}, {1, 0}, {1, -1}, {0, 1}, {0, -1}, {-1, -1}, {-1, 0}, {-1, 1}};
    int col = board[start[0]][start[1]].getColor();
    for (int[] offset : offsets) {
      int[] target = {start[0] + offset[0], start[1] + offset[1]};
      if (inBounds(target)) {
        Piece piece = board[target[0]][target[1]];
        if (piece == null || (piece != null && piece.getColor() != col)) {
          moves.add(new Move(start.clone(), target.clone()));
        }
      }
    }
    return moves;
  }
<<<<<<< HEAD
 
=======
>>>>>>> 395e07fef8e99c01dc1aae81033c80404de48e66
  public PImage getPieceImage() {
    if (getColor()== WHITE) {
      return loadImage("Pieces/WhiteKing.png");
    } else {
      return loadImage("Pieces/BlackKing.png");
    }
  }
}
