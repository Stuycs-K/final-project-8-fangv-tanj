# Work Log

Victor Fang

5/22/23

* Added image file for the board, sized the window.
* Started planning how to implement piece movement as well as necessary methods.
* Clicking on a tile in the board will correspond to a tile in an array.

5/23/23

* Added the image files for each piece.
* Began work on Board class
  * Created constructor, class has a 2D array of ints (temporarily, will change to pieces).
  * Start method places all the pieces in the correct position on the array.
  * Wrote flip method which flips the contents of the array (necessary to flip the board after a player makes a move).

5/24/23

* Drew all the pieces on the board
* Pieces can now move (with the exception of king since the constructor is not done yet)

5/25/23

* After every turn the board switches sides as well as the pieces.
* Player can no longer move other player's pieces.
* When a piece is clicked circles are drawn to where the piece can move, clicking on another piece will clear the old circles.

5/26/23

* Worked with Junxi to fix a bug involving movementDraw and the first move of a pawn.
* Discussed ideas on how to make it so pieces can't move past other pieces.

5/27/23

* Added boundaries so circles don't appear off the board.
* Pieces can now only move onto their respective circles, accomplished by returning a 2D array of ints and changing a number to a 1 if a circle was placed there. When a player clicks on a tile while holding a piece, the coords of that tile must correspond to a 1 in the 2D array in order for the piece to be moved.

5/29/23

* Bishop, rook, queen can no longer go through pieces.
* Circles are no longer drawn on player's own pieces for knight, bishop, rook, queen.
* Knight, bishop, rook, queen no longer capture player's own pieces.
* Updated UML diagram.

5/30/23

* Began work on implementing check.

5/31/23

* Fixed pawn going through pieces but the issue is still present for the first move, Junxi went to fix that.

6/1/23

* Check implementation completed and conducted testing
  * inCheck checks if the king is on a tile the other player can move on
  * futureMove checks futureMoves of a piece and removes any moves that would keep a player in check
  * futureMove is now called each time in movementDraw to prevent player from moving a piece that would result in them being
    put into check.
* Fixed a bug with the firstMove of a pawn incorrectly being set to false as a result of futureMove.

* Created the demo branch to showcase missing features
 * Press 1 for castle demo
 * Press 2 for en passant demo
 * Press 3 for check/checkmate demo (check is implemented but not checkmate)
 * Press 4 for pawn promotion demo

 6/4/23

 * Fixed nullpointerexception with reset button. (was actually fixed in another branch)
 * Added text over reset button.
 * Wrote method to check if any moves are available, necessary for checkmate and stalemate
  * Checkmate and stalemate are properly detected, need to add end screen

  6/6/23

  * Created end game screen with a button that starts a new game.
    * Version for Checkmate
    * Version for Stalemate

  6/7/23

  * Created branch for en passant
  * Started en passant

  6/8/23

  * Finished en passant
    * Fixed bug with pawn deleting pieces even if a move isn't made.
    * Added the rules for en passant, pawn can only capture another pawn to the left/right of it
      if that pawn made an initial move of 2 tiles (only the turn right after).

  6/9/23

  * Finished castle implementation, works for both sides and both players.
    * Castle can only be done if king and the rook have not been moved.
    * Can't castle if in check.

  6/10/23

  * Fixed bug where pawns would not activate check correctly.
  * Began work on an undo button.
    * Currently debugging.

  6/11/23

  * Finished undo button.
    * Can now undo multiple turns.
  * Finished pawn promotion.
    * If a pawn reaches the end, the game will pause and a screen will pop up allowing the player to promote the pawn
      to a queen, a rook, a knight, or a bishop.
  * Fixed a bug with game end not properly resetting game variables.
  * Wrote the README but missing the devlog.

Junxi Tan

5/22/23

Made board with Victor.

5/23/23

Began work on Piece class and Pawn class.

5/24/23

Finished the movement for Queen, Knight, Rook and Bishop.

5/25/23

-Removed the boundaries on piece as it does not work.

-Added rook piece.

-pawn can move now.

-started king.

5/26/23
- king can move too
- movementdraw is now in piece class

5/30/23
-red square on capturable pieces

-moved movement from the Board class to the Piece class and its subclasses so Board doesn't do everything

-Pawn and King doesn't go through pieces

6/6/23
- removed reset button and made it a keypress

- pawn promotion (only queen for now)
