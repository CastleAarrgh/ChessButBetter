class SuperKnight extends Knight{
  public SuperKnight(int col){
    super(col);
  }
  public ArrayList<Move> generateMoves(Board BOARD,int[] start){
    Piece[][] board = BOARD.getBoard();
    int[][] knightOffsets = new int[][]{{-4, 2}, {-4, -2}, {4, 2}, {4, -2}, {2, -4},{2, 4}, {-2, -4}, {-2, 4}};
    ArrayList<Move> moves = new ArrayList<Move>();
<<<<<<< HEAD
    int col = BOARD.activePlayer;
=======
    int col = board[start[0]][start[1]].getColor();
>>>>>>> f16fa5338b31c9e5167c62578e2734e48006eef7
    for(int[] offset: knightOffsets){
      int[] target = {start[0] + offset[0], start[1] + offset[1]};
      if(inBounds(target)){
        Piece piece = pieceOn(board, target);
        if(piece == null || piece.getColor() != col){
          moves.add(new Move(start, target));
        }
      }
    }
    return moves;
    }
}
