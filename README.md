# Straight Outta Compsci
Sam Lubelsky, Jason Xia

It’s Chess, the 1500-year-old open  pvp strategy game, but with additional variants and features attached that make it objectively better and cooler. These will range from being fairly small changes that are easy to implement to larger overhauls of the game that will require a greater work investment, such as alternate game variations.


## Link To The Prototype: https://docs.google.com/document/d/1uOZb5EjacHRWJZKRKkogWzKWCsG52Fl7tPDo-tDyDxk/edit?usp=sharing
## How to Compile/Run:
  * git clone the repo
  * install the inbuilt processing sound library if you don't already have it
    * On the toolbar at the top: Sketch --> Import Library --> add Library
    * input sound in the search bar, select Sound from the shown options and click install
  * run the program from processing: there is a basic UI which will allow you to select each mode and who your opponent will be.
  * cheat keys exist to show off the various features of the program that are maybe not as easy to find just moving pieces around: the purpose of each cheat key is outlined below.  Pressing the key shown will take you to a position which allows you to easily demo the specified feature.
    * q: en-passant
    * w: promotion 
    * e: castling kingside 
    * r: castling queenside
    * t: check 
    * y: checkmate 
    * u: tie
    * i: timer loss
    * o: Chesskers capturing
    * p: Chesskers promotion
    * m: back to main menu

## Development Log
  ### Sam
    5/21 - created README Skeleton and finished the project skeleton I started on Friday.
    5/23 - added new methods to Piece classes and did some work on importFEN and the Board class in general
    5/24 - finished importFEN, added various structural methods/fields to Board class
    5/25 - displayBoard and importFEN() integrated, various other small changes
    5/26 - Added Piece Logic for all Pieces and Check Detection, though everything is untested currently.
    5/27 - Started fixing bugs with Piece move logic. Knight moves are working and pawn moves are mostly working.
    5/28 - Fixed logic for all regular pieces(castling and checking are still not done)
    5/29 - implemented check
    5/30 - refactored some code, added in piece highlighting, and fixed various bugs
    5/31 - added a timer, added a simple UI, and an AI opponent that plays random moves.
    6/1 - many minor changes to the UI and Button class.  Created a game over screen and way to go back to main menu.  Implemented the class for Chess2.0 and put in one new piece(pawn).  Started on Chesskers but I think I'm abondoning that.
    6/2 - changed UI further added modified Queen and modified Knight to Chess2.0
    6/3 - started work on escape king and minimax
    6/4 - fixed minimax and various other bug fixes; added final Chess2 pieces
    6/5 - Fixed a lot of bugs related to Chess and Chess2.  Fixed minimax computer algorithm.
    6/7 - Started work on Chesskers.  Made chesskers class and checkers piece
    6/8 - More work on Chesskers, had to rewrite a lot of the code.  Checkers piece almost done i think
    6/9 - Completely redid Checkers Piece move generation and it's interaction with the Chesskers class due to technical difficulties involving use of CheckersMove class.  Simplified it substantially and scaled back scope but should work now.
    6/10 - Chesskers is complete besides promotion to ChesskersKing if I ever get around to that.
    6/11 - updated readme, added cheat keys, added move sounds and other minor changes
    6/12 - fixed promotion and castling.  added more cheat keys and made more updates to readme.  added checkers promotion and fixed various bugs.
  ### Jason
    5/23 - figured out git branching, finished method displaying board background in board class
    5/24 - consolidated display board and piece methods into single method, finished displayBoard()
    5/25 - started work on piece dragging, fixed git problems
    5/27 - finished piece draggging mechanics, tested, resolved merge conflict
    5/28 - started work on promotion, check logic
    5/29 - started work on castling
    5/30 - working on promoting, checkmate, finished notation, demo branch
    5/31 - added promotion menu to choose which piece the pawn is going to promote to, fixing nullpointerexceptions in board
    6/1 - worked on debugging nullpointers from promotion
    6/2 - changed promotion mechanics from panel system to button system above the clock
    6/3 - updated prototype, modified promotion, started castling
    6/4 - castling method work
    6/5 - working on checking to see if king/rook moved
    6/6 - differentiated h and a rooks for separate castling
    6/7 - differentiated kingside and queenside castling, added booleans for kinside and queenside castling
    6/8 -  moved promotion function to board class
    6/11 = finished promotion
    6/12 - finished castling, updated prototype, updated uml
    
