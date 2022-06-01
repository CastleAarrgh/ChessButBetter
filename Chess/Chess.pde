int GAMESELECT = 0;
int INPUTSELECT = 1;
int COMPUTERSELECT = 2;
int FENINPUT = 3;
int GAME = 4;
int CHESS = 1;
int COMPUTER = 2;
int CHESS960 = 3;
int ANTICHESS = 4;
int CHESSKERS = 5;
int gamemode = 0;
int OFF = 0;
int ON = 1;
int computer = OFF;
int menu;
int secondTimer = millis();
Board board;
Timer timer;
ArrayList<Button> buttons = new ArrayList<Button>();
void setup() {
  menu = GAMESELECT;
  //Board board = new Chess960();
  //System.out.println(board);
  //board.displayBoard();
  size(1000, 800);
  buttons.add(new Button("Regular Chess", 20, 20, COMPUTERSELECT, CHESS, OFF));
  buttons.add(new Button("Chess 960", 20, 240, COMPUTERSELECT, CHESS960, OFF));
  buttons.add(new Button("Antichess", 20, 460, COMPUTERSELECT, ANTICHESS, OFF));
  timer = new Timer(300, 300);
}
void draw() {
  //println(menu);
  background(255);
  //menu controlling
  for (Button button : buttons) {
    button.displayButton();
  }
  //println(gamemode);
  if (menu == GAME) {
    if (board == null) {
      if (gamemode == CHESS) {
        board = new Board();
      }
      if (gamemode == CHESS960) {
        board = new Chess960();
      }
    }
    board.displayBoard(800, 800);
    if (millis() - secondTimer >= 1000) {
      timer.tick();
      secondTimer = millis();
    }
    fill(111);
    rect(800, 200, 200, 400); 
    fill(255);
    text((int)timer.getBlackTime(), 850, 300);
    text((int)timer.getWhiteTime(), 850, 500);
    if (board.isEnded()) board = new Board();
  }
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
  if (menu == GAME && computer == OFF) {
    if (board.registerClick(mouseX, mouseY)) {
      timer.swap();
    }
  }
  if (menu == GAME && computer == ON) {
    if (board.registerClick(mouseX, mouseY)) {
      if (board.isEnded()) {
        board.GameOver();
      } else {
        ArrayList<Move> possibleMoves = board.generateLegalMoves(board.activePlayer);
        int randNum = (int)random(possibleMoves.size());
        Move randomMove = possibleMoves.get(randNum);
        board.makeLegalMove(randomMove);
      }
    }
  }
  for (Button button : buttons) {
    if (button.inBounds(mouseX, mouseY)) {
      int[] newScreen = button.click();
      menu = newScreen[0];
      gamemode = newScreen[1];
      computer = newScreen[2];
      buttons = new ArrayList<Button>();
    }
  }
  if (menu == COMPUTERSELECT) {
    buttons.add(new Button("Play With Friend", 20, 20, GAME, gamemode, OFF));
    buttons.add(new Button("Play With Computer", 20, 240, GAME, gamemode, ON));
  }
  if (menu == INPUTSELECT) {
    buttons.add(new Button("Play From Start", 20, 20, GAME, gamemode, computer));
    buttons.add(new Button("Play From Position", 20, 240, FENINPUT, gamemode, computer));
  }
  if (menu == FENINPUT) {
  }
}
void mousePressed() {
  if (menu == GAME){
  if (board.promote==true) {
    int x = round(mouseX/ (width/4)-0.5);
    if (board.activePlayer!=Board.WHITE) {
      if (x == 0) board.board[board.promoteX][board.promoteY] = new Queen(1);
      if (x == 1) board.board[board.promoteX][board.promoteY] = new Rook (1);
      if (x == 2) board.board[board.promoteX][board.promoteY] = new Bishop(1);
      if (x == 3) board.board[board.promoteX][board.promoteY] = new Knight (1);
    } else {
      if (x == 0) board.board[board.promoteX][board.promoteY] = new Queen(-1);
      if (x == 1) board.board[board.promoteX][board.promoteY] = new Rook (-1);
      if (x == 2) board.board[board.promoteX][board.promoteY] = new Bishop (-1);
      if (x == 3) board.board[board.promoteX][board.promoteY] = new Knight (-1);
    }
  }
  }
}
