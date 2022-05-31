int GAMESELECT = 0;
int INPUTSELECT = 1;
int FENINPUT = 2;
int CHESS = 3;
int CHESS960 = 4;
int ANTICHESS = 5;
int CHESSKERS = 6;
int menu;
Board board;
void setup(){
  menu = CHESS;
  board = new Board();
  //Board board = new Chess960();
  //System.out.println(board);
  //board.displayBoard();
  size(1000, 800);
  Timer timer = new Timer();
}
void draw(){
  if (board.isEnded()) board = new Board();
  //println(menu);
  background(111);
  //menu controlling
  if(menu == GAMESELECT){
    rect(20, 20, 760, 200);
    rect(20, 240, 760, 200);
    rect(20, 460, 760, 200);
  }
  if(menu == INPUTSELECT){
    rect(20, 20, 760, 200);
    rect(20, 240, 760, 200);
  }
  if(menu == CHESS){
    board.displayBoard(800,800);
    timer.tick();
    timer.displayTimer();
  }
}
void mouseClicked() {
  if(menu == GAMESELECT){
    println("going");
    if(mouseX > 20 && mouseX < 780 && mouseY > 20 && mouseY < 220) menu = INPUTSELECT;
  }
  if(menu == INPUTSELECT){
    if(mouseX > 20 && mouseX < 780 && mouseY > 240 && mouseY < 440) menu = CHESS;
  }
  if(menu == CHESS){
    Piece[][] pieces = board.getBoard();
    if(board.registerClick(mouseX, mouseY)){
      timer.swap();
    };
  }
}
void mousePressed() {
  /*if (board.promote) {
    int x = round(mouseX/ (width/4)-0.5);
    if (board.activePlayer!=Board.WHITE) {
      if (x == 0) board.board[down1][right1] = new Queen(1);
      if (x == 1) board.board[down1][right1] = new Rook (1);
      if (x == 2) board.board[down1][right1] = new Bishop(1);
      if (x == 3) board.board[down1][right1] = new Knight (1);
    } else {
      if (x == 0) board.board[down1][right1] = new Queen(-1);
      if (x == 1) board.board[down1][right1] = new Rook (-1);
      if (x == 2) board.board[down1][right1] = new Bishop (-1);
      if (x == 3) board.board[down1][right1] = new Knight (-1);
    }
  }*/
  }
