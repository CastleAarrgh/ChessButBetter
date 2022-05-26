class Pawn extends Piece{
  public Pawn(int col){
    super(col, 'p');
  }
  public ArrayList<Move> generateMoves(Piece[][] board,int[] square){
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
    //capture move
    int[][] pawnOffsets = new int[][]{{1, -col}, {-1, -col}};
    for(int[] pawnOffset: pawnOffsets){
      target = new int[]{
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
