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
    int[] target = {square[0] - col, square[1]};
    if(inBounds(target)){
      Piece piece = pieceOn(board, target);
      if(piece == null){
        moves.add(new Move(square, target));
      }
    }
    //double move
    if((col == WHITE && square[0] == 6) || (col == BLACK && square[0] == 1)){
      target = new int[]{square[0] - col * 2, square[1]};
      if(inBounds(target)){
        Piece piece = pieceOn(board, target);
        if(piece == null && board[(square[0] + target[0]) / 2][square[1]] == null){
          moves.add(new Move(square, target));
        }
      }
    }
    //capture move and en-passant
    int[][] pawnOffsets = new int[][]{{-col, 1}, {-col, -1}};
    for(int[] pawnOffset: pawnOffsets){
      target = new int[]{square[0] + pawnOffset[0], square[1] + pawnOffset[1]};
      if(inBounds(target)){
        Piece piece = pieceOn(board, target);
        if((piece != null && piece.getColor() != col) || (passantSquare != null && Arrays.equals(target, passantSquare))){
          moves.add(new Move(square, target));
        }
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
