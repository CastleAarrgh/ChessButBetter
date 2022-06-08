public class Checker extends Piece{
  public Checker(int col){
    super(col, 'q');
  }
  public ArrayList<Move> generateMoves(Board BOARD,int[] start){
    Piece[][] board = BOARD.getBoard();
    ArrayList<Move> moves = new ArrayList<Move>();
    //support checkers jumping - checkers pieces can jump any number of times in the same direction as long as it is going over pieces and landing on empty squares
    int col = board[start[0]][start[1]].getColor();
    int[][] checkersOffsets = new int[][]{{-col, 1},{-col, -1}};
    boolean go = true;
    ArrayList<Move> currentMoves = new ArrayList<Move>();
    ArrayList<Move> oldMoves = new ArrayList<Move>();
    int[][] targets = new int[][]{{start[0], start[1]}};
    while(go){
       oldMoves = new ArrayList<Move>(currentMoves);
       currentMoves = new ArrayList<Move>();
       print(Arrays.deepToString(targets));
       println();
       println(oldMoves);
       println();
       for(int[] offset: checkersOffsets){
        for(int[] oldTarget: targets){
          int[] target = new int[]{oldTarget[0] + 2 * offset[0], oldTarget[1] + 2 * offset[1]};
          int[] middle = new int[]{oldTarget[0] + offset[0], oldTarget[1] + offset[1]};
           //move works
          if(inBounds(target)){
            Piece middlePiece = board[middle[0]][middle[1]];
            if(board[target[0]][target[1]] == null && middlePiece != null && middlePiece.getColor() != col)
            currentMoves.add(new Move(start, target));
          }
        }
      }
      targets = new int[currentMoves.size()][2];
      int i = 0;
      for(Move move: currentMoves){
        targets[i] = move.getTarget().clone();
        i++;
      }
      if(currentMoves.size() == 0){
        go = false;
      }
      if(currentMoves.size() > 10){
        System.exit(1);
      }
    }
    ArrayList<Move> captureMoves = new ArrayList<Move>(oldMoves);
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
