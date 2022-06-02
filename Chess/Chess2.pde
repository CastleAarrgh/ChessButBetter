class Chess2 extends Board{
  Chess2(){
    super();
    convertToFairyBoard();
  }
  private void convertToFairyBoard(){
    for(int i = 0; i < 8; i++){
      for(int j = 0; j < 8; j++){
        Piece piece = board[i][j];
        if(piece != null){
           char type = piece.getType();
           int colour = piece.getColor();
           Piece newPiece;
           switch(type) {
            case 'p':
              newPiece = new FairyPawn(colour);
              break;
            case 'n':
              newPiece = new Knight(colour);
              break;
            case 'b':
              newPiece = new Bishop(colour);
              break;
            case 'q':
              newPiece = new UltraQueen(colour);
              break;
            case 'k':
              newPiece = new King(colour);
              break;
            default:
              newPiece = new Rook(colour);
              break;
           } 
           board[i][j] = newPiece;
        }
      }
    }
  }
  private void makeMove(Move move){
    println("making move");
    super.makeMove(move);
    int[] target = move.getTarget();
    int[] start = move.getStart();
    Piece piece = board[start[0]][start[1]];
    println(piece.getType());
    println(getPassant());
    if(getPassant() != null){
      println(Arrays.equals(target, getPassant()));
    }
    if (piece.getType() == 'q' && getPassant() != null && Arrays.equals(target, getPassant())) {
      println("passant found");
      board[start[0]][target[1]] = null;
    }
  }
}
