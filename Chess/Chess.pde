int GAMESELECT = 0;
int INPUTSELECT = 1;
int FENINPUT = 2;
int menu = 0;
void setup(){
  //Board board = new Board();
  //Board board = new Chess960();
  //System.out.println(board);
  //board.displayBoard();
  size(800, 800);
}
void draw(){
  //menu controlling
  if(menu == GAMESELECT){
    rect(20, 20, 760, 200);
  }
}
