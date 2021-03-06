public class Chesskers extends Board{
   Chesskers(){
    super();
    convertToChesskersBoard();
  }
  Chesskers(String fenString){
    super(fenString);
    convertToChesskersBoard();
  }
  private void convertToChesskersBoard(){
    for(int i = 0; i < 8; i++){
      for(int j = 0; j < 8; j++){
        Piece piece = board[i][j];
        if(piece != null){
           char type = piece.getType();
           int colour = piece.getColor();
           Piece newPiece;
           switch(type) {
            case 'p':
              newPiece = new Checker(colour);
              break;
            case 'n':
              newPiece = new Knight(colour);
              break;
            case 'b':
              newPiece = new Bishop(colour);
              break;
            case 'q':
              newPiece = new Queen(colour);
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
  public void makeMove(Move move){
    int[] start = move.getStart();
    int[] target = move.getTarget();
    Piece piece = board[start[0]][start[1]];
    if(piece.getType() == 'c'){
      if(abs(target[1] - start[1]) == 2 && abs(target[0] - start[0]) == 2){
        board[(target[0] + start[0]) / 2][(target[1] + start[1]) / 2] = null;
      }
    }
    super.makeMove(move);
  }
  public void promote(Move move){
    int[] target = move.getTarget();
    int[] start = move.getStart();
    Piece piece = board[target[0]][target[1]];
    int col = piece.getColor();
    if(piece.getType() == 'c') {
      if(col == WHITE && target[0] == 0){
        board[target[0]][target[1]] = new CheckerKing(col);
      }
      if(col == BLACK && target[0] == 7){
        board[target[0]][target[1]] = new CheckerKing(col);
      }
    }
  }
}
