import java.util.*;
public class Chess960 extends Board {
  Chess960() {
    String startingPos = makeStartingPosition();
    importFEN(startingPos);
  }
  Chess960(String startingFen) {
    super(startingFen);
  }
  public String makeStartingPosition() {
    boolean rookPlaced = false;
    boolean kingPlaced = false;
    boolean evenBishop = false;
    boolean oddBishop = false;
    List<Piece> pieces = new ArrayList<Piece>(Arrays.asList(new Piece[]{new Knight(BLACK), new Knight(BLACK), new Bishop(BLACK), new Bishop(BLACK), new Rook(BLACK), new Rook(BLACK), new King(BLACK), new Queen(BLACK)}));
    String newRow = "";
    int i = 0;
    while (pieces.size() > 0) {
      boolean squareFound = false;
      Piece piece = pieces.get(0);
      int pieceIndex = 0;
      int j = 0;
      while (!squareFound) {
        pieceIndex = int(random(0, pieces.size()));
        piece = pieces.get(pieceIndex);
        if (piece.getType() == 'k') {
          if (rookPlaced) {
            squareFound = true;
            kingPlaced = true;
          }
        } else if (piece.getType() == 'b') {
          if (i % 2 == 0 && !evenBishop) {
            squareFound = true;
            evenBishop = true;
          }
          if (i % 2 == 1 && !oddBishop) {
            squareFound = true;
            oddBishop = true;
          }
        } else if (piece.getType() == 'r') {
          if (!rookPlaced || (rookPlaced && kingPlaced)) {
            squareFound = true;
            rookPlaced = true;
          }
        } else {
          squareFound = true;
        }
        j++;
        if (j > 10) {
          i = 0;
          newRow = "";
          evenBishop = false;
          oddBishop = false;
          kingPlaced = false;
          rookPlaced = false;
          continue;
        }
      }
      pieces.remove(pieceIndex);
      newRow += piece.getType();
      i++;
    }
    String whiteRow = newRow.toUpperCase();
    String out = newRow + "/pppppppp/8/8/8/8/PPPPPPPP/" + whiteRow + " w KQkq - 0 1";
    return out;
  }
  //random but:
  //bishops must be placed on opposite squares
  //king must be between the rooks
}
