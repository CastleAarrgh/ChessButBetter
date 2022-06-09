public class Chesskers extends Board{
   Chesskers(){
    super();
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
    super.makeMove(move);
    int[] start = move.getStart();
    Piece piece = board[start[0]][start[1]];
    /*if(piece.getType() == 'c'){
    }*/
  }
}
