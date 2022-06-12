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
    moves.addAll(generateCastlingMoves(BOARD, start));
    return moves;
  }
  //castlingRights[0]: White Kingside, castlingRights[1]: White Queenside, [2]: Black Kingside, [3]: Black Queenside
  public ArrayList<Move> generateCastlingMoves(Board BOARD, int[] start){
    Piece[][] board = BOARD.getBoard();
    boolean[] castlingRights = BOARD.castlingRights;
    ArrayList<Move> moves = new ArrayList<Move>();
    int col = board[start[0]][start[1]].getColor();
    //white castling
    if(col == WHITE){
      //kingside
      if(castlingRights[0] && board[7][5] == null && board[7][6] == null){
        moves.add(new Move(start, new int[]{7,6}));
      }
      //queenside
      if(castlingRights[1] && board[7][1] == null && board[7][2] == null && board[7][3] == null){
        moves.add(new Move(start, new int[]{7,2}));
      }
    }
    //black castling
    else{
      //kingside
      if(castlingRights[2] && board[0][5] == null && board[0][6] == null){
        moves.add(new Move(start, new int[]{0,6}));
      }
      //queenside
      if(castlingRights[3] && board[0][1] == null && board[0][2] == null && board[0][3] == null){
        moves.add(new Move(start, new int[]{0,2}));
      }
    }
    return moves;
  }
 
  public PImage getPieceImage() {
    if (getColor()== WHITE) {
      return loadImage("Pieces/WhiteKing.png");
    } else {
      return loadImage("Pieces/BlackKing.png");
    }
  }
}
