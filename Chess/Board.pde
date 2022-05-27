import java.util.*;

public class Board {
  
  final static int BLACK = -1;
  final static int WHITE = 1;
  private Piece[][] board;
  private int[] passantSquare;
  //castlingRights[0]: White Kingside, castlingRights[1]: White Queenside, [2]: Black Kingside, [3]: Black Queenside
  private boolean[] castlingRights;
  private int activePlayer;
  private int halfmoveclock;
  private int fullmoveclock;
  final private int size = 800;
  final private int squareSize = size / 8;
  private boolean firstClick;
  int row1, col1, row2, col2;

  /*
  Board constructor takes in no positions and generates 
   the default starting chess position.
   */
  Board() {
    importFEN("rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1");
  }
  
  /* Generate Board based on provided FEN starting position
   */
  Board(String startingFen) {
    importFEN(startingFen);
  }
  
  // display the board background and the pieces
  public void displayBoard() {
    color Black  = color(118, 150, 86);
    color White = color(238, 238, 210);

    for (int i = 0; i < 8; i ++) {
      for (int j = 0; j < 8; j ++) {
        if ((i + j + 1) % 2 == 0) {
          fill(White); // white
        } else {
          fill(Black); // black
        }
        rect(i * squareSize, j * squareSize, (i + 1) * squareSize, (j + 1) * squareSize);  
        if (board[j][i] != null) image(board[j][i].getPieceImage(), i*width/8, j*height/8, squareSize, squareSize);
      }
    }
  }

  //board accessor method
  public Piece[][] getBoard() {
    return board;
  }
  
  public int[] getPassant(){
    return passantSquare;
  }
  
  //export board state as fen
  public String exportFen() {
    return "";
  }
  
  //-1: black wins, 1: white wins, 0: tie
  public int isEnded() {
    return 0;
  }
  
  //display game over screen
  private void GameOver() {
  }
  
  private void makeMove(Move move) {
    int[] target = move.getTarget();
    int[] start = move.getStart();
    Piece piece = board[start[0]][start[1]];
    board[target[0]][target[1]] = piece;
    board[start[0]][start[1]] = null;
  }
  
  private ArrayList<Move> generateMoves(int[] start) {
    ArrayList<Move> moves = board[start[0]][start[1]].generateMoves(this, start);
    return moves;
  }
  
  private ArrayList<Move> generateAllMoves() {
    ArrayList<Move> moves = new ArrayList<Move>();
    for (int r = 0; r < 8; r++) {
      for (int c = 0; c < 8; c++) {
        int[] square = {r, c};
        Piece piece = board[r][c];
        if (piece != null) {
          moves.addAll(piece.generateMoves(board, square));
        }
      }
    }
    return moves;
  }
  
  private boolean isValid(Move move) {
    ArrayList<Move> possibleMoves = generateAllMoves();
    for (Move possibleMove : possibleMoves) {
      if (move.equals(possibleMove)) {
        return true;
      }
    }
    return false;
  }
  
  public int[] notationToPos(String str) {
    char firstLetter = str.charAt(0);
    int firstNum = firstLetter - 'a';
    int secondNum = Integer.parseInt("" + str.charAt(1));
    return new int[]{firstNum, secondNum};
  }
  
  private void importFEN(String fen) {
    board = new Piece[8][8];
    String[] fenString = fen.split(" ");
    String boardString = fenString[0];
    int row = 0;
    int col = 0;
    int colour;
    for (int i = 0; i < boardString.length(); i++) {
      char c = boardString.charAt(i);
      if (Character.isUpperCase(c)) {
        colour = WHITE;
      } else {
        colour = BLACK;
      }
      c = Character.toLowerCase(c);
      Piece piece;
      if (c == '/') {
        col = 0;
        row++;
      } else if (Character.isDigit(c)) {
        col += Character.getNumericValue(c);
      } else {
        switch(c) {
        case 'p':
          piece = new Pawn(colour);
          break;
        case 'n':
          piece = new Knight(colour);
          break;
        case 'b':
          piece = new Bishop(colour);
          break;
        case 'q':
          piece = new Queen(colour);
          break;
        case 'k':
          piece = new King(colour);
          break;
        default:
          piece = new Rook(colour);
          break;
        }      
        board[row][col] = piece;
        col++;
      }
    }
    
    activePlayer = fenString[1] == "w" ? WHITE: BLACK;
    castlingRights = new boolean[4];
    String castleStr = fenString[2];
    castlingRights[0] = castleStr.indexOf("K") != -1;
    castlingRights[1] = castleStr.indexOf("Q") != -1;
    castlingRights[2] = castleStr.indexOf("k") != -1;
    castlingRights[3] = castleStr.indexOf("q") != -1;
    if (!fenString[3].equals("-")) {
      passantSquare = notationToPos(fenString[3]);
    }
    
    halfmoveclock = Integer.parseInt(fenString[4]);
    fullmoveclock = Integer.parseInt(fenString[5]);
  }
  
  public String toString() {
    String out = "";
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (board[i][j] != null) {
          out += board[i][j] + " ";
        } else {
          out += "- ";
        }
      }
      out += "\n";
    }
    return out;
  }
  
  void mouseReleased() {
    if (firstClick) {
      row1 = mouseY/100;
      col1 = mouseX/100;
      firstClick = false;
    } else {
      row2 = mouseY/100;
      col2 = mouseX/100;
      if (!(row2 == row1 && col2 == col1)) {
        board[row2][col2] = board[row1][col1];
        board[row1][col1] = null;
        firstClick = true;
      }
    }
  }
}
