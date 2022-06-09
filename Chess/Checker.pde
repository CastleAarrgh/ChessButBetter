public class Checker extends Piece{
  public Checker(int col){
    super(col, 'c');
  }
  public ArrayList<Move> generateMoves(Board BOARD,int[] start){
    Piece[][] board = BOARD.getBoard();
    ArrayList<Move> moves = new ArrayList<Move>();
    //support checkers jumping - checkers pieces can jump any number of times in the same direction as long as it is going over pieces and landing on empty squares
    int col = board[start[0]][start[1]].getColor();
    int[][] checkersOffsets = new int[][]{{-col, 1},{-col, -1}};
    for(int[] offset: checkersOffsets){
      int[] target = new int[]{start[0] + 2 * offset[0], start[1] + 2 * offset[1]};
      int[] middle = new int[]{start[0] + offset[0], start[1] + offset[1]};
      if(inBounds(target)){
        Piece targetPiece = pieceOn(board, target);
        Piece middlePiece = pieceOn(board,middle);
        if(targetPiece == null && middlePiece != null && middlePiece.getColor() != col){
          moves.add(new Move(start, target));
        }
      }
    }
    if(moves.size() == 0){
      for(int[] offset: checkersOffsets){
        int[] target = new int[]{start[0] + offset[0], start[1] + offset[1]};
        if(inBounds(target)){
          Piece targetPiece = pieceOn(board, target);
          if(targetPiece == null){
            moves.add(new Move(start, target));
          }
        }
      }
    }
    return moves;
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteChecker.png");
   } else{
    return loadImage("Pieces/BlackChecker.png");
   }
  }
}
