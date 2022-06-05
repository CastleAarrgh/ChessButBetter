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
              newPiece = new SuperKnight(colour);
              break;
            case 'b':
              newPiece = new SwitcherBishop(colour);
              break;
            case 'q':
              newPiece = new UltraQueen(colour);
              break;
            case 'k':
              newPiece = new MegaKing(colour);
              break;
            default:
              newPiece = new JumpyRook(colour);
              break;
           } 
           board[i][j] = newPiece;
        }
      }
    }
  }
  public void makeMove(Move move){
    //println("making move");
    super.makeMove(move);
    int[] target = move.getTarget();
    int[] start = move.getStart();
    Piece piece = board[target[0]][target[1]];
    //println(this);
    //println(start);
    //println(target);
    //println(piece);
    if (piece.getType() == 'q' && getPassant() != null && Arrays.equals(target, getPassant())) {
      board[target[0] + piece.getColor()][target[1]] = null;
    }
    if(piece.getType() == 'k'){
      MegaKing king = (MegaKing)piece;
    }
  }
  public boolean inRange(int[] start, int[] target){
    return (target[1] - start[1]) <= 1 && (target[0] - start[0]) <= 1;
  }
  public boolean makeLegalMove(Move move){
    boolean res = super.makeLegalMove(move);
    if(res == false){
      return false;
    }
    int[] target = move.getTarget();
    int[] start = move.getStart();
    Piece piece = board[target[0]][target[1]];
    if(piece.getType() == 'k'){
      if(inRange(start, target)){
        MegaKing king = (MegaKing)piece;
        king.hasEscape = false;
        piece = king;
      }
    }
    return true;
  }
}
