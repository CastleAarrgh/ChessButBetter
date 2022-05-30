int GAMESELECT = 0;
int INPUTSELECT = 1;
int FENINPUT = 2;
int CHESS = 3;
int menu;
Board board;
void setup(){
  menu = CHESS;
  board = new Board();
  //Board board = new Chess960();
  //System.out.println(board);
  //board.displayBoard();
  size(850, 850);
}
void draw(){
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
    board.displayBoard();
  }
  strokeWeight(2);
  line(0,800,850,800);
  line(800,0,800,850);
  for (int i = 0; i <8; i++){
    fill(0);
textSize(20);
textAlign(CENTER);
text((char)('a'+i), 50 + i*100, 825);
  }
  for (int i = 0; i <8; i++){
    fill(0);
textSize(20);
textAlign(CENTER);
text(""+(i+1), 825, 750 - i*100);
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
    board.registerClick(mouseX, mouseY);
  }
}
void mousePressed() {
  if (board.isEnded()) board.importFEN("rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1");
  if (board.promote) {
    int x = round(mouseX/ (width/4)-0.5);
    if (board.activePlayer!=Board.WHITE) {
      if (x == 0) board.board[down1][right1] = new Queen(1);
;
      if (x == 1) board.board[down1][right1] = new Rook (1);
      if (x == 2) board.board[down1][right1] = new Bishop(1);
      if (x == 3) board.board[down1][right1] = new Knight (1);
    } else {
      if (x == 0) board.board[down1][right1] = new Queen(-1);
      if (x == 1) board.board[down1][right1] = new Rook (-1);
      if (x == 2) board.board[down1][right1] = new Bishop (-1);
      if (x == 3) board.board[down1][right1] = new Knight (-1);
    }
  }}
