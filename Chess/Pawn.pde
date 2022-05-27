import java.util.*;
class Pawn extends Piece{
  public Pawn(int col){
    super(col, 'p');
  }
  public ArrayList<Move> generateMoves(Board BOARD, int[] square){
    Piece[][] board = BOARD.getBoard();
    int[] passantSquare = BOARD.getPassant();
    ArrayList<Move> moves = new ArrayList<Move>();
    int col = getColor();
    //single move
    int[] target = {square[0], square[1] - col};
    moves.add(new Move(square, target));
    //double move
    if((col == WHITE && square[1] == 6) || (col == BLACK && square[1] == 1)){
      target = new int[]{square[0], square[1] - col * 2};
      if(inBounds(target)){
        moves.add(new Move(square, target));
      }
    }
    //capture move and en-passant
    int[][] pawnOffsets = new int[][]{{1, -col}, {-1, -col}};
    for(int[] pawnOffset: pawnOffsets){
      target = new int[]{square[0] + pawnOffset[0], square[1] + pawnOffset[1]};
      if(board[square[0]][square[1]].getColor() != col || (passantSquare != null && Arrays.equals(target, passantSquare))){
        moves.add(new Move(square, target));
      }
    }
    
    return moves;
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhitePawn.png");
   } else{
    return loadImage("Pieces/BlackPawn.png");
   }
  }
}
