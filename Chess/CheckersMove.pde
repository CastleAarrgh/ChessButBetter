import java.util.*;
class CheckersMove extends Move{
 public int[][] hoppedSquares;
 CheckersMove(int[] start, int[] target, int[][] hoppedSquares){
   super(start, target);
   this.hoppedSquares = hoppedSquares;
 }
 public int[][] getHopped(){
   return hoppedSquares;
 }
 public boolean equals(CheckersMove other){
   return Arrays.equals(getStart(), other.getStart()) && Arrays.equals(getTarget(), other.getTarget()) && Arrays.equals(getHopped(), other.getHopped());
 }
 public String toString(){
   return "(start: (" + start[0] + ", " + start[1] + "), target: (" + target[0] + ", " + target[1] + "))" + "\n Hopped: Arrays.deepToString(getHopped())";
 }  
  public CheckersMove clone(){
    int[] newStart = start.clone();
    int[] newEnd = target.clone();
    int[][] newHopped = Board.deepCopy(getHopped());
    return new CheckersMove(newStart, newEnd, getHopped());
  }
  public int[][] deepCopy(int[][] board) {
    int[][] out = new int[board.length][board[0].length];
    for (int i = 0; i < out.length; i++) {
      out[i] = Arrays.copyOf(board[i], board[i].length);
    }
    return out;
  }
}
