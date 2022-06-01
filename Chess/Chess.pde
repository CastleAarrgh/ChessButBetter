int GAMESELECT = 0;
int INPUTSELECT = 1;
int FENINPUT = 2;
int CHESS = 0;
int COMPUTER = 1;
int CHESS960 = 2;
int ANTICHESS = 3;
int CHESSKERS = 4;
int mode = CHESS;
int menu;
int secondTimer = millis();
Board board;
Timer timer;
ArrayList<Button> buttons = new ArrayList<Button>();
void setup(){
  menu = GAMESELECT;
  board = new Board();
  //Board board = new Chess960();
  //System.out.println(board);
  //board.displayBoard();
  size(1000, 800);
  buttons.add(new Button("Regular Chess", 20, 20, INPUTSELECT, CHESS));
  buttons.add(new Button("Chess 960", 20, 20, INPUTSELECT, CHESS960));
  buttons.add(new Button("Antichess", 20, 20, INPUTSELECT, ANTICHESS));
  timer = new Timer(300, 300);
}
void draw(){
  if (board.isEnded()) board = new Board();
  //println(menu);
  background(255);
  //menu controlling
  for(Button button: buttons){
    button.displayButton();
  }
  /*if(menu == GAMESELECT){
    fill(238, 238, 210);
    rect(20, 20, 760, 200);
    rect(20, 240, 760, 200);
    rect(20, 460, 760, 200);
    textSize(100);
    fill(0);
    text("Regular Chess", 50, 180);
    text("Chess 960", 50, 400);
    text("Antichess", 50, 620);
  }
  if(menu == INPUTSELECT){
    fill(238, 238, 210);
    rect(20, 180, 960, 200);
    rect(20, 420, 960, 200);
  }
  */
  if(menu == CHESS){
    board.displayBoard(800,800);
    if(millis() - secondTimer >= 1000){
      timer.tick();
      secondTimer = millis();
    }
    fill(111);
    rect(800, 200, 200, 400); 
    fill(255);
    text((int)timer.getBlackTime(), 850, 300);
    text((int)timer.getWhiteTime(), 850, 500);
  }
  if(menu == COMPUTER){
    board.displayBoard(800, 800);
    fill(111);
    rect(800, 200, 200, 400); 
  } */
}
void mouseClicked() {
  /*if(menu == GAMESELECT){
    println("going");
    if(mouseX > 20 && mouseX < 780 && mouseY > 20 && mouseY < 220){
      menu = INPUTSELECT;
      mode = CHESS;
    }
  }
  if(menu == INPUTSELECT){
    if(mouseX > 20 && mouseX < 780 && mouseY > 240 && mouseY < 440) menu = CHESS;
  }*/
  if(menu == CHESS){
    Piece[][] pieces = board.getBoard();
    if(board.registerClick(mouseX, mouseY)){
      timer.swap();
    }
  }
  if(menu == COMPUTER){
    if(board.registerClick(mouseX, mouseY)){
      if(board.isEnded()){
        board.gameOver();
      } else{
        ArrayList<Move> possibleMoves = board.generateLegalMoves(board.activePlayer);
        int randNum = (int)random(possibleMoves.size());
        Move randomMove = possibleMoves.get(randNum);
        board.makeLegalMove(randomMove);
      }
    }
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
