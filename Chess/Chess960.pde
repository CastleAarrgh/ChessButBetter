import java.util.*;
public class Chess960 extends Board{
  Chess960(){
    String startingPos = makeStartingPosition();
    println(startingPos);
    importFEN(startingPos);
  }
  Chess960(String startingFen){
    super(startingFen);
  }
  public String makeStartingPosition(){
    boolean rookPlaced = false;
    boolean kingPlaced = false;
    boolean evenBishop = false;
    boolean oddBishop = false;
    Piece[] pieces = {new Knight(BLACK), new Knight(BLACK), new Bishop(BLACK), new Bishop(BLACK), new Rook(BLACK), new Rook(BLACK), new King(BLACK), new Queen(BLACK)};
    String newRow = "";
    for(int i = 0; i < 8; i++){
      boolean squareFound = false;
      Piece piece = pieces[0];
      while(!squareFound){
        int pieceIndex = int(random(0, pieces.length));
        piece = pieces[pieceIndex];
        if(piece.getType() == 'k'){
          if(rookPlaced){
            squareFound = true;
            kingPlaced = true;
          }
        } else if(piece.getType() == 'b'){
          if(i % 2 == 0 && !evenBishop){
            squareFound = true;
            evenBishop = true;
          }
          if(i % 2 == 1 && !oddBishop){
            squareFound = true;
            oddBishop = true;
          }
        } else if(piece.getType() == 'r'){
          if(!rookPlaced || (rookPlaced && kingPlaced)){
            squareFound = true;
            rookPlaced = true;
          }
        }else{
          squareFound = true;
        }
      }
      newRow += piece.getType();
    }
    String whiteRow = newRow.toUpperCase();
    String out = newRow + "/pppppppp/8/8/8/8/PPPPPPPP/" + whiteRow + "w KQkq - 0 1";
    return out;
  }
  //random but:
  //bishops must be placed on opposite squares
  //king must be between the rooks
 
}
