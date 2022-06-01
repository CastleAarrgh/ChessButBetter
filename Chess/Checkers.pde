public class Checkers{
  int[][] board;
  int WHITE = 1;
  int BLACK = -1;
  int x;
  int y;
  int boardSize;
  int squareSize;
  Checkers(int x, int y, int boardSize){
    board = new int[][]{
    {0, -1, 0, -1, 0, -1, 0, -1},
    {-1, 0, -1, 0, -1, 0, -1, 0},
    {0, -1, 0, -1, 0, -1, 0, -1},
    {0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0},
    {1, 0, 1, 0, 1, 0, 1, 0},
    {0, 1, 0, 1, 0, 1, 0, 1},
    {1, 0, 1, 0, 1, 0, 1, 0}
    };
    this.x = x;
    this.y = y;
    this.boardSize = boardSize;
    squareSize = boardSize / 8;
  }
  public void displayBoard(){
    color Dark  = color(118, 150, 86);
    color Light = color(238, 238, 210);
    for (int i = 0; i < 8; i ++) {
      for (int j = 0; j < 8; j ++) {
        if ((i + j + 1) % 2 == 0) {
          fill(Dark); // white
        } else {
          fill(Light); // black
        } 
        int[] square = new int[]{j, i};
        rect(i * squareSize, j * squareSize, squareSize, squareSize);
        if(board[j][i] == 1){
          fill(255);
        }
        if(board[j][i] == -1){
          fill(0);
        }
        if(board[j][i] != 0){
          ellipse(i * squareSize + squareSize / 2, j * squareSize + squareSize / 2, squareSize, squareSize);
        }
     }
   }
  }
  public void generateRegularMoves(){
    
  }
}
