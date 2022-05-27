Board board;

void setup(){
    size(800, 800);
 board = new Board();
  System.out.println(board);
    board.displayBoard();
}
void draw() {
    board.displayBoard();
}
    void mouseClicked() {
    if (board.firstClick) {
      board.row1 = mouseY/100;
      board.col1 = mouseX/100;
      board.firstClick = false;
    } else {
      board.row2 = mouseY/100;
      board.col2 = mouseX/100;
      if (!(board.row2 == board.row1 && board.col2 == board.col1)) {
        board.board[board.row2][board.col2] = board.board[board.row1][board.col1];
        board.board[board.row1][board.col1] = null;
        board.firstClick = true;
      }
    }
  }
