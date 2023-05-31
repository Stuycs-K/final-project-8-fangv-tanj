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
