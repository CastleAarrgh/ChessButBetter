import java.util.*;
class Board {
  final static int BLACK = -1;
  final static int WHITE = 1;
  public Piece[][] board;
  private int[] passantSquare;
  //castlingRights[0]: White Kingside, castlingRights[1]: White Queenside, [2]: Black Kingside, [3]: Black Queenside
  private boolean[] castlingRights;
  private int activePlayer;
  private int halfmoveclock;
  private int fullmoveclock;
  private ArrayList<int[]> highlightedSquares = new ArrayList<int[]>();
  final private int size = 800;
  final private int squareSize = size / 8;
  public boolean firstClick = true; 
  public int row1, row2, col1, col2;
  boolean promote = false;
  boolean gameOver = false;
  int promoteX, promoteY;
  boolean wKingMoved = false;
  boolean bKingMoved = false;
  boolean wRookMoved1 = false;
  boolean wRookMoved2 = false;
  boolean bRookMoved1 = false;
  boolean bRookMoved2 = false;
  boolean KingsideCastle = false;
  boolean QueensideCastle = false; //<>//

  /*
  Board constructor takes in no positions and generates 
   the default starting chess position.
   */
  Board() {
    importFEN("rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1");
  }
  /* Generate Board based on provided FEN starting position //<>// //<>// //<>// //<>// //<>//
   */
  public void ispromoted() {
    for ( int j=0; j<8; j++) {
      Piece piece = board[0][j];//scan first row for black pieces
      Piece piece2 = board[7][j];//scan eighth row for white pieces
      //checking to see if the pawn is promoted works, getting the pawn to promote doesn't
      if (piece.getType() == 'p') {
        //  print("promoted");
        promote = true;
        promoteY = j;
        promoteX = 7;
      }
      if (piece2.getType() == 'p') {
        promote = true;
        promoteY = j;
        promoteX = 0;
      }
    }
  }
  Board(String startingFen) {
    importFEN(startingFen);
  }
  // display the board background and the pieces
  public void displayBoard(int x, int y) {
    color Dark  = color(118, 150, 86);
    color Light = color(238, 238, 210);
    for (int i = 0; i < 8; i ++) {
      for (int j = 0; j < 8; j ++) {
        if ((i + j + 1) % 2 == 0) {
          fill(Dark); // white
        } else {
          fill(Light); // black
        } 
        int[] square = new int[]{j, i};
        rect(i * squareSize, j * squareSize, squareSize, squareSize); 
        for (int k = 0; k < highlightedSquares.size(); k++) {
          int[] highlightedSquare = highlightedSquares.get(k);
          if (Arrays.equals(square, highlightedSquare)) {
            fill(255, 93, 98, 150);
            rect(i * squareSize, j * squareSize, squareSize, squareSize);
          }
        }
        if (board[j][i] != null) image(board[j][i].getPieceImage(), i* squareSize, j* squareSize, squareSize, squareSize);
      }
    }
    displayNotation();
  }
  private void displayNotation() {
    for (int i = 0; i <8; i++) {
      fill(0);
      textSize(20);
      textAlign(CENTER);
      text((char)('a'+i), 8 + i*100, 795);
    }
    for (int i = 0; i <8; i++) {
      fill(0);
      textSize(20);
      textAlign(CENTER);
      text(""+(i+1), 790, 720 - i*100);
    }
  }
  //board accessor method
  public Piece[][] getBoard() {
    return board;
  }
  //passantSquare accessor method
  public int[] getPassant() {
    return passantSquare;
  }
  //export board state as fen
  public String exportFen() {
    return "";
  }
  //-1: black wins, 1: white wins, 0: tie
  public boolean isEnded() {
    return generateLegalMoves(activePlayer).size() == 0;
  }
  //display game over screen
  public void gameOver() {
    textAlign(CENTER);
    textSize(50);
    fill(255, 93, 98, 200);
    if (isTie()) {
      text("It's a tie.", 400, 400);
    } else if (activePlayer == WHITE) {
      text("Black Wins!", 400, 400);
    } else {
      text("White Wins!", 400, 400);
    }
    //importFEN("rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1");
  }
  public int[] findPiece(char type, int col) {
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        Piece piece = board[i][j];
        if (piece != null && piece.getType() == type && piece.getColor() == col) {
          return new int[]{i, j};
        }
      }
    }
    return new int[]{-1, -1};
  }
  private boolean isTie() {
    ArrayList<Move> possibleResponses = generateLegalMoves(-activePlayer);
    int[] kingPos = findPiece('k', activePlayer);
    for (Move move : possibleResponses) {
      int[] target = move.getTarget();
      if (Arrays.equals(target, kingPos)) {
        return false;
      }
    }
    return true;
  }
  //make a move requested by the main if it is legal
  //if it's legal return true, else return false.
  public boolean makeLegalMove(Move move) {
    if (isValid(move)) {
      makeMove(move);
      return true;
      //println(passantSquare);
    } else {
      print("move: " + move + " is invalid!");
      return false;
    }
  }
  //make move that is determined to be legal.
  private void makeMove(Move move) {
    int[] target = move.getTarget();
    int[] start = move.getStart();
    Piece piece = board[start[0]][start[1]];
    board[target[0]][target[1]] = piece;
    board[start[0]][start[1]] = null;
    if (piece.getType() == 'p') {
      ispromoted();
    }
    if (piece.getType() == 'k') {
      if (activePlayer == WHITE) {
        wKingMoved = true;
      }
      bKingMoved = false;
    }
    if (piece.getType() == 'p' && passantSquare != null && Arrays.equals(target, passantSquare)) {
      board[start[0]][target[1]] = null;
    }
    if (piece.getType() == 'p' && abs(target[0] - start[0]) == 2) {
      passantSquare = new int[]{start[0] - piece.getColor(), start[1]};
    } else {
      passantSquare = null;
    }
    activePlayer = -activePlayer;
  }

  private void castling() {
    if (activePlayer == WHITE) {
      if (wKingMoved ==false && wRookMoved1 ==false && wRookMoved2 == false) {
        if (KingsideCastle) {
          board[7][4]=null;
          board[7][5]= new Rook(1);
          board[7][6] = new King (1);
          board [7][7] = null;
          this.wKingMoved = true;
        }
      }
    } else {
      if (activePlayer == BLACK) {
        if (bKingMoved == false && bRookMoved1 == false && bRookMoved2 == false) {
          if (KingsideCastle) {
            board[0][4] = null;
            board[0][5] = new Rook (-1);
            board [0][6]= new King (-1);
            board [0][7] = null;
          }
        }
      }
    }
  }
   } else if (Board[i0][j0] == wKing) {
    if (wKingMoved == false && j1 == 2) {//castle
      Board[7][0] = null;
      Board[7][3] = wRook;
    }
    if (wKingMoved == false && j1 == 6) {//castle
      Board[7][7] = null;
      Board[7][5] = wRook;
    }


  /*remove all moves which would allow the king to be captured next move(these positions only arise when a check 
   is left unresolved.  If the player is in checkmate, all possible moves should be removed, because any possible 
   move would lead to the capture of the king next turn */
  public ArrayList<Move> removeChecks(ArrayList<Move> moves) {
    if (moves.size() == 0) {
      return moves;
    }
    int col = getMoveColor(moves.get(0));
    ArrayList<Move> newMoves = new ArrayList<Move>();
    int[] oldPassantSquare = null;
    if (passantSquare != null) {
      oldPassantSquare = passantSquare.clone();
    }
    boolean[] oldCastlingRights = castlingRights.clone();
    int oldActivePlayer = activePlayer;
    Piece[][] oldBoard = deepCopy(board);
    for (Move move : moves) {
      boolean IsValid = true;
      makeMove(move);
      ArrayList<Move> possibleKingCaptures = generateAllMoves(-col);
      for (Move newMove : possibleKingCaptures) {
        int[] target = newMove.getTarget();
        Piece piece = board[target[0]][target[1]];
        if (piece != null && piece.getType() == 'k') {
          IsValid = false;
          break;
        }
      }
      if (IsValid) {
        try {
          newMoves.add((Move)move.clone());
        }
        catch(CloneNotSupportedException e) {
          e.printStackTrace();
        }
      }
      board = deepCopy(oldBoard);
      if (oldPassantSquare == null) {
        passantSquare = null;
      } else {
        passantSquare = oldPassantSquare.clone();
      }
      castlingRights = oldCastlingRights.clone();
    }
    board = oldBoard;
    passantSquare = oldPassantSquare;
    castlingRights = oldCastlingRights;
    activePlayer = oldActivePlayer;
    return newMoves;
  }
  //generates all possible moves for one piece
  private ArrayList<Move> generateMoves(int[] start) {
    ArrayList<Move> moves = board[start[0]][start[1]].generateMoves(this, start);
    moves = removeChecks(moves);
    return moves;
  }
  //generatesAllMoves posssible for the board(every piece on board of correct color)
  //does not take check into account
  private ArrayList<Move> generateAllMoves(int col) {
    ArrayList<Move> moves = new ArrayList<Move>();
    for (int r = 0; r < 8; r++) {
      for (int c = 0; c < 8; c++) {
        int[] square = {r, c};
        Piece piece = board[r][c];
        if (piece != null && piece.getColor() == col) {
          moves.addAll(piece.generateMoves(this, square));
        }
      }
    }
    return moves;
  }
  //generates all possible moves for the board, taking check into account
  private ArrayList<Move> generateLegalMoves(int col) {
    ArrayList<Move> moves = generateAllMoves(col);
    moves = removeChecks(moves);
    return moves;
  }
  //get the color of the piece being moved
  private int getMoveColor(Move move) {
    int[] start = move.getStart();
    int col = board[start[0]][start[1]].getColor();
    return col;
  }
  //check if a move attempted by the player isValid
  private boolean isValid(Move move) {
    //ArrayList<Move> possibleMoves = generateAllMoves(activePlayer);
    int[] start = move.getStart();
    ArrayList<Move> possibleMoves = generateMoves(new int[]{start[0], start[1]});
    for (Move possibleMove : possibleMoves) {
      if (move.equals(possibleMove)) {
        return true;
      }
    }
    return false;
  }
  //convert chess Notation(e.g. e6) to something understandable by the program(int[])
  public int[] notationToPos(String str) {
    char firstLetter = str.charAt(0);
    int firstNum = firstLetter - 'a';
    int secondNum = Integer.parseInt("" + str.charAt(1));
    return new int[]{firstNum, secondNum};
  }
  //import standardized chess FORMAT FEN into Board class
  public void importFEN(String fen) {
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
    activePlayer = fenString[1].equals("w")  ? WHITE: BLACK;
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
  //print the board
  public Piece[][] deepCopy(Piece[][] board) {
    Piece[][] out = new Piece[board.length][board[0].length];
    for (int i = 0; i < out.length; i++) {
      out[i] = Arrays.copyOf(board[i], board[i].length);
    }
    return out;
  }
  boolean registerClick(int x, int y) {
    if (firstClick) {
      row1 = y/100;
      col1 = x/100;
      if (board[row1][col1] != null && board[row1][col1].getColor() == activePlayer) {
        firstClick = false;
        ArrayList<Move> possibleMoves = generateMoves(new int[]{row1, col1});
        highlightedSquares.add(new int[]{row1, col1});
        for (Move move : possibleMoves) {
          int[] target = move.getTarget();
          highlightedSquares.add(target);
        }
      }
    } else {
      row2 = y/100;
      col2 = x/100;
      highlightedSquares = new ArrayList<int[]>();
      if (row2 == row1 && col2 == col1) {
        firstClick = true;
      } else {
        Move attemptedMove = new Move(new int[]{row1, col1}, new int[]{row2, col2});
        firstClick = true;
        if (makeLegalMove(attemptedMove)) {
          return true;
        }
      }
    }
    return false;
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
}
