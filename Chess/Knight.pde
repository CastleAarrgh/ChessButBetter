class Knight extends Piece{
  public Knight(int col){
    super(col, 'n');
  }
  public ArrayList<Move> generateMoves(Piece[][] board, int[] start){
    int[][] knightOffsets = new int[][]{{-2, 1}, {-2, -1}, {2, 1}, {2, -1}, {1, -2},{1, 2}, {-1, -2}, {-1, 2}};
    ArrayList<Move> moves = new ArrayList<Move>();
    int col = board[start[0]][start[1]].getColor();
    for(int[] offset: knightOffsets){
      int[] target = {start[0] + offset[0], start[1] + offset[1]};
      if(inBounds(target)){
        if(board[start[0]][start[1]] == null || board[start[0]][start[1]].getColor() != col){
          moves.add(new Move(start, target));
        }
      }
    }
    return moves;
  }
  public PImage getPieceImage(){
   if(getColor() == WHITE){
    return loadImage("Pieces/WhiteKnight.png");
   } else{
    return loadImage("Pieces/BlackKnight.png");
   }
  }
}
