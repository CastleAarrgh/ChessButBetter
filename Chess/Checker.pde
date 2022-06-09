public class Checker extends Piece{
  public Checker(int col){
    super(col, 'q');
  }
  public ArrayList<Move> generateMoves(Board BOARD, int[] start){
    Piece[][] board = BOARD.getBoard();
    ArrayList<CheckersMove> moves = new ArrayList<CheckersMove>();
    //support checkers jumping - checkers pieces can jump any number of times in the same direction as long as it is going over pieces and landing on empty squares
    int col = board[start[0]][start[1]].getColor();
    int[][] checkersOffsets = new int[][]{{-col, 1},{-col, -1}};
    boolean go = true;
    ArrayList<CheckersMove> currentMoves = new ArrayList<CheckersMove>(Arrays.asList(new CheckersMove(start, start, new int[][]{})));
    ArrayList<CheckersMove> oldMoves = new ArrayList<CheckersMove>();
    while(go){
       oldMoves = new ArrayList<CheckersMove>(currentMoves);
       currentMoves = new ArrayList<CheckersMove>();
       int i = 0;
       for(int[] offset: checkersOffsets){
        for(CheckersMove oldMove: oldMoves){
          int[] oldStart = oldMove.getStart().clone();
          int[] oldTarget = oldMove.getTarget().clone();
          int[] target = new int[]{oldTarget[0] + 2 * offset[0], oldTarget[1] + 2 * offset[1]};
          int[] middle = new int[]{oldTarget[0] + offset[0], oldTarget[1] + offset[1]};
          println(oldMove);
           //move works
          if(inBounds(target)){
            Piece middlePiece = board[middle[0]][middle[1]];
            if(board[target[0]][target[1]] == null && middlePiece != null && middlePiece.getColor() != col){
              if(Arrays.equals(oldStart, oldTarget)){
                currentMoves.add(new CheckersMove(start, target, new int[][]{}));
              } else{
                int[][] newHops = new int[oldMove.getHopped().length + 1][2];
                i = 0;
                for(int[] oldHop: oldMove.getHopped()){
                  newHops[i] = oldHop.clone();
                  i++;
                }
                newHops[i] = middle.clone();
                currentMoves.add(new CheckersMove(start, target, newHops).clone());
              }
            }
          }
        }
      }
      if(currentMoves.size() == 0){
        go = false;
      }
    }
    //println(oldMoves);
    moves = new ArrayList<CheckersMove>(oldMoves);
    //add regular moves
    if(moves.size() == 0){
      for(int[] offset: checkersOffsets){
        int[] target = new int[]{start[0] + offset[0], start[1] + offset[1]};
        if(inBounds(target) && board[target[0]][target[1]] == null){
          moves.add(new CheckersMove(start, target, new int[][]{}));
        }
      }
    }
    ArrayList<Move> finalMoves = new ArrayList<Move>();
    for(int i = 0; i < moves.size(); i++){
      finalMoves.add((Move)(moves.get(i)));
    }
    return finalMoves;
  }
   public <T> T[][] deepCopy(T[][] board) {
    T[][] out = (T[][])new Object[board.length][board[0].length];
    for (int i = 0; i < out.length; i++) {
      out[i] = Arrays.copyOf(board[i], board[i].length);
    }
    return out;
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteChecker.png");
   } else{
    return loadImage("Pieces/BlackChecker.png");
   }
  }
}
