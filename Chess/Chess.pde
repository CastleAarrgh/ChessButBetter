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
  size(800, 800);
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
    if (board.firstClick) {
      board.row1 = mouseY/100;
      board.col1 = mouseX/100;
      board.firstClick = false;
    } else {
      board.row2 = mouseY/100;
      board.col2 = mouseX/100;
      if (!(board.row2 == board.row1 && board.col2 == board.col1)) {
        board.makeMove(new Move(new int[]{board.row1, board.col1},new int[]{board.row2, board.col2}));
        board.firstClick = true;
      }
    }
  }
}
