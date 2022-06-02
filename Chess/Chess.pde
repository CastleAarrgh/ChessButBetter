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
int computer = OFF;
int menu;
int secondTimer = millis();
Board board;
Checkers checkers;
Timer timer;
ArrayList<Button> buttons = new ArrayList<Button>();
void setup() {
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
void draw() {
  //println(menu);
  background(255);
  //menu controlling
  for (Button button : buttons) {
    button.displayButton();
  }
  //println(gamemode);
  if (menu == GAME && gamemode != CHESSKERS) {
    if (board == null) {
      if (gamemode == CHESS) {
        board = new Board();
      }
      if (gamemode == CHESS960) {
        board = new Chess960();
      }
      if (gamemode == CHESS20) {
        board = new Chess2();
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
    if (board.promote) {
      rectMode(CORNER);
      rect(800, 0, 100, 100);
      rect(900, 0, 100, 100);
      rect(800, 100, 100, 100);
      rect( 900, 100, 100, 100);
      if (board.isEnded()) {
        board.gameOver();
        if (buttons.size() == 0) {
          buttons.add(new Button("Main Menu", 250, 400, 300, 100, 50, color(111, 111, 111, 220), GAMESELECT, gamemode, COMPUTER));
        }
      }
    }}
    if (menu == GAME && gamemode == CHESSKERS) {
      if (checkers == null) {
        checkers = new Checkers(0, 0, 500);
      }
      checkers.displayBoard();
    }
    for (Button button : buttons) {
      button.displayButton();
    }
  }
  
  
  void mouseClicked() {

    if (menu == GAME && computer == OFF) {
      if (board.registerClick(mouseX, mouseY)) {
        if (menu == GAME && computer == OFF) {
          Piece[][] pieces = board.getBoard();
          if (board.registerClick(mouseX, mouseY)) {
            timer.swap();
          }
        }
        if (menu == GAME && computer == ON) {
          if (board.registerClick(mouseX, mouseY)) {
            if (board.isEnded()) {
              board.gameOver();
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
            if (menu == GAME && board != null) {
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
        if (menu == COMPUTERSELECT) {
          buttons.add(new Button("Play With Friend", 20, 20, GAME, gamemode, OFF));
          buttons.add(new Button("Play With Computer", 20, 240, GAME, gamemode, ON));
        }
        if (menu == INPUTSELECT) {
          buttons.add(new Button("Play From Start", 20, 20, GAME, gamemode, computer));
          buttons.add(new Button("Play From Position", 20, 240, FENINPUT, gamemode, computer));
        }
          if (menu == FENINPUT) {
          if (menu == GAMESELECT) {
            buttons.add(new Button("Regular Chess", 20, 20, COMPUTERSELECT, CHESS, OFF));
            buttons.add(new Button("Chess 960", 20, 210, COMPUTERSELECT, CHESS960, OFF));
            buttons.add(new Button("Chesskers", 20, 400, COMPUTERSELECT, CHESSKERS, OFF));
            buttons.add(new Button("Chess 2.0", 20, 590, COMPUTERSELECT, CHESS20, OFF));
          }
        }
      }
    }
  }
        
        
        public static boolean between(int variable, int minValueInclusive, int maxValueInclusive) {
          return variable >= minValueInclusive && variable <= maxValueInclusive;
        }

        void mousePressed() {
          if (menu == GAME) {
            if (board.promote) {

              if (board.activePlayer!=Board.WHITE) {
                if (between(mouseX, 800, 900 )&& between(mouseY, 0, 100)) board.board[board.promoteX][board.promoteY] = new Queen(1);
                if (between(mouseX, 900, 1000 )&& between(mouseY, 0, 100)) board.board[board.promoteX][board.promoteY] = new Rook (1);
                if (between(mouseX, 800, 900 )&& between(mouseY, 100, 200)) board.board[board.promoteX][board.promoteY] = new Bishop(1);
                if (between(mouseX, 900, 1000  )&& between(mouseY, 100, 200)) board.board[board.promoteX][board.promoteY] = new Knight (1);
              } else {
                if (between(mouseX, 800, 900 )&& between(mouseY, 0, 100)) board.board[board.promoteX][board.promoteY] = new Queen(-1);
                if (between(mouseX, 900, 1000 )&& between(mouseY, 0, 100))  board.board[board.promoteX][board.promoteY] = new Rook (-1);
                if (between(mouseX, 800, 900 )&& between(mouseY, 100, 200)) board.board[board.promoteX][board.promoteY] = new Bishop (-1);
                if (between(mouseX, 900, 1000  )&& between(mouseY, 100, 200)) board.board[board.promoteX][board.promoteY] = new Knight (-1);
              }
            }
          }
        }
