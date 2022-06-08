int GAMESELECT = 0;
int INPUTSELECT = 1;
int COMPUTERSELECT = 2;
int FENINPUT = 3;
int GAME = 4;
int CHESS = 1;
int COMPUTER = 2;
int CHESS960 = 3;
int CHESS20 = 4;
int CHESSKERS = 5;
int gamemode = 0;
int OFF = 0;
int ON = 1;
int BOTH = 2;
int computer = OFF;
int menu;
int secondTimer = millis();
boolean computerTurn = false;
int computerTimer;
Board board;
Timer timer;
ArrayList<Button> buttons = new ArrayList<Button>();
void setup(){
  menu = GAMESELECT;
  //Board board = new Chess960();
  //System.out.println(board);
  //board.displayBoard();
  size(1000, 800);
  timer = new Timer(300, 300);
  buttons.add(new Button("Regular Chess", 20, 20, COMPUTERSELECT, CHESS, OFF));
  buttons.add(new Button("Chess 960", 20, 210, COMPUTERSELECT, CHESS960, OFF));
  buttons.add(new Button("Chesskers", 20, 400, COMPUTERSELECT, CHESSKERS, OFF));
  buttons.add(new Button("Chess 2.0", 20, 590, COMPUTERSELECT, CHESS20, OFF));
}
void draw(){
  //println(menu);
  background(255);
  //menu controlling
  //println(gamemode);
  if(menu == GAME){
    if(board == null){
      if(gamemode == CHESS){
        board = new Board();
      }
      if(gamemode == CHESS960){
        board = new Chess960();
      }
      if(gamemode == CHESS20){
        board = new Chess2();
      }
      if(gamemode == CHESSKERS){
        board = new Chesskers();
      }
      if(computer == BOTH){
        computerTurn = true;
      }
    }
    board.displayBoard(800,800);
    if(millis() - secondTimer >= 1000){
      timer.tick();
      secondTimer = millis();
    }
    if(computerTurn && millis() - computerTimer > 200){
      int timeBefore = millis();
      board.makeComputerMove();
      int timeElapsed = millis() - timeBefore;
      timer.swap();
      timer.tick(timeElapsed / 1000.0);
      timer.swap();
      if(computer == ON){
        computerTurn = false;
      }
    }
    timer.displayTimer();
    if (board.isEnded()){
      board.gameOver();
      if(buttons.size() == 0){
        buttons.add(new Button("Main Menu", 250, 400, 300, 100, 50, color(111,111,111, 220), GAMESELECT, gamemode, COMPUTER));
      }
    }
  }
  for(Button button: buttons){
    button.displayButton();
  }
}
void mouseClicked() {
  if(menu == GAME && computer == OFF){
    Piece[][] pieces = board.getBoard();
    if(board.registerClick(mouseX, mouseY)){
      timer.swap();
      secondTimer = millis();
      //println(board instanceof Chess2);
    }
  }
  if(menu == GAME && computer == ON){
    if(!computerTurn && board.registerClick(mouseX, mouseY)){
      if(board.isEnded()){
        board.gameOver();
      } else{
        //board.makeLegalMove(randomMove);
        computerTurn = true;
        computerTimer = millis();
        //board.makeComputerMove();
      }
    }
  }
   for(Button button: buttons){
    if(button.inBounds(mouseX, mouseY)){
      if(menu == GAME && board != null){
        board = null;
        menu = GAMESELECT;
      }
      int[] newScreen = button.click();
      menu = newScreen[0];
      gamemode = newScreen[1];
      computer = newScreen[2];
      buttons = new ArrayList<Button>();
    }
  }
  if(menu == COMPUTERSELECT){
    buttons.add(new Button("Play With Friend", 20, 20, GAME, gamemode, OFF));
    buttons.add(new Button("Play With Computer", 20, 240, GAME, gamemode, ON));
    buttons.add(new Button("Computer Showdown", 20, 460, GAME, gamemode, BOTH));
  }
  if(menu == INPUTSELECT){
    buttons.add(new Button("Play From Start", 20, 20, GAME, gamemode, computer));
    buttons.add(new Button("Play From Position", 20, 240, FENINPUT, gamemode, computer));
  }
  if(menu == GAMESELECT){
    buttons.add(new Button("Regular Chess", 20, 20, COMPUTERSELECT, CHESS, OFF));
    buttons.add(new Button("Chess 960", 20, 210, COMPUTERSELECT, CHESS960, OFF));
    buttons.add(new Button("Chesskers", 20, 400, COMPUTERSELECT, CHESSKERS, OFF));
    buttons.add(new Button("Chess 2.0", 20, 590, COMPUTERSELECT, CHESS20, OFF));
  }
  if(menu == FENINPUT){
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
