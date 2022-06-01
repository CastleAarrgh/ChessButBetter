int GAMESELECT = 0;
int INPUTSELECT = 1;
int FENINPUT = 2;
int GAME = 3;
int CHESS = 1;
int COMPUTER = 2;
int CHESS960 = 3;
int ANTICHESS = 4;
int CHESSKERS = 5;
int gamemode = 0;
int OFF = 0;
int ON = 1;
int computerOn = OFF;
int menu;
int secondTimer = millis();
Board board;
Chess960 chess960;
Timer timer;
ArrayList<Button> buttons = new ArrayList<Button>();
void setup(){
  menu = GAMESELECT;
  board = new Board();
  chess960 = new Chess960();
  //Board board = new Chess960();
  //System.out.println(board);
  //board.displayBoard();
  size(1000, 800);
  buttons.add(new Button("Regular Chess", 20, 20, INPUTSELECT, CHESS, OFF));
  buttons.add(new Button("Chess 960", 20, 240, INPUTSELECT, CHESS960, OFF));
  buttons.add(new Button("Antichess", 20, 460, INPUTSELECT, ANTICHESS, OFF));
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
  if(gamemode == CHESS){
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
  if(gamemode == CHESS960){
    chess960.displayBoard(800,800);
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
  if(gamemode == COMPUTER){
    println("hello");
    board.displayBoard(800, 800);
    fill(111);
    rect(800, 200, 200, 400); 
  }
}
void mouseClicked() {
  for(Button button: buttons){
    if(button.inBounds(mouseX, mouseY)){
      int[] newScreen = button.click();
      menu = newScreen[0];
      gamemode = newScreen[1];
      computerOn = newScreen[2];
    }
  }
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
