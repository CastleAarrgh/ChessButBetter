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
<<<<<<< HEAD
    int[] start = move.getStart();
    int[] target = move.getTarget();
    Piece piece = board[start[0]][start[1]];
    if(piece.getType() == 'c'){
      if(target[1] - start[1] == 2 && target[0] - start[0] == 2){
        board[(target[0] + start[0]) / 2][(target[1] + start[1]) / 2] = null;
      }
    }
    super.makeMove(move);
=======
    if(move instanceof CheckersMove){
      super.makeMove(move);
      CheckersMove checkersMove = (CheckersMove) move;
      int[][] hoppedSquares = checkersMove.getHopped();
      for(int[] square: hoppedSquares){
        board[square[0]][square[1]] = null;
      }
    }
    else{
      super.makeMove(move);
    }
>>>>>>> a1ff8a269fde5ab17294091397132170fa39263b
  }
}
