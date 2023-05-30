import java.util.ArrayList;
public class Board{
private Piece[][] chessBoard; //change to array of pieces when constructor is done
  
  
  public Board(){
    chessBoard = new Piece[8][8];
  }
  
  //place all the pieces
  public void start(){
    //black side
    chessBoard[0][0] = new Piece(0, 0, "Rook", 0);
    chessBoard[0][1] = new Piece(0, 1, "Knight", 0);
    chessBoard[0][2] = new Piece(0, 2, "Bishop", 0);
    chessBoard[0][3] = new Piece(0, 3, "Queen", 0);
    chessBoard[0][4] = new King(0, 4, "King", 0);
    chessBoard[0][5] = new Piece(0, 5, "Bishop", 0);
    chessBoard[0][6] = new Piece(0, 6, "Knight", 0);
    chessBoard[0][7] = new Piece(0, 7, "Rook", 0);
    
    for (int i = 0; i < 8; i +=1){
      chessBoard[1][i] = new Pawn(1, i, "Pawn", 0);
    }
    
    //white side
    chessBoard[7][0] = new Piece(7, 0, "Rook", 1);
    chessBoard[7][1] = new Piece(7, 1, "Knight", 1);
    chessBoard[7][2] = new Piece(7, 2, "Bishop", 1);
    chessBoard[4][3] = new Piece(4, 3, "Queen", 1);
    chessBoard[7][4] = new King(7, 4, "King", 1);
    chessBoard[7][5] = new Piece(7, 5, "Bishop", 1);
    chessBoard[7][6] = new Piece(7, 6, "Knight", 1);
    chessBoard[4][5] = new Piece(4, 5, "Rook", 1);
    
    for (int i = 0; i < 8; i +=1){
      chessBoard[6][i] = new Pawn(6, i, "Pawn", 1);
    }
  }
  
  //flip the board 
  public void flip(){
    
    Piece[][] res = new Piece[8][8];
    for (int r = 7; r >= 0; r -=1){
      for (int c = 7; c >= 0; c -=1){
        res[7 - r][7 - c] = chessBoard[r][c];
        if (res[7 - r][7 - c] != null){
          res[7 - r][7 - c].setRow(7 - r);
          res[7 - r][7 - c].setCol(7 - c);
        }
      }
    }
    chessBoard = res;
  }
  
 public void move(int y, int x, int lastY, int lastX){
     //move that piece
     chessBoard[y][x] = chessBoard[lastY][lastX];
     chessBoard[y][x].setRow(y);
     chessBoard[y][x].setCol(x);
     
    //remove the old piece
    chessBoard[lastY][lastX] = null;
 }
 
 /*need to figure out a way for movement to be stopped if piece is blocking path
 movement should probably be moved to board class because position of the other pieces
 is needed in order for this to work */
 
 boolean inBound(int r, int c){
   return (r >= 0 && r < 8 && c >= 0 && c < 8); 
 }
 
 void movement(Piece piece){
   piece.space = new ArrayList<float[]>(); 
    if(piece.name == "Queen"){
      direction(piece, "UP", "LEFT");
      direction(piece, "UP", "RIGHT");
      direction(piece, "DOWN", "LEFT");
      direction(piece, "DOWN", "RIGHT");
      direction(piece, "UP", "NONE");
      direction(piece, "DOWN", "NONE");
      direction(piece, "NONE", "RIGHT");
      direction(piece, "NONE", "LEFT");
   }
   if (piece.name == "Rook"){
      direction(piece, "UP", "NONE");
      direction(piece, "DOWN", "NONE");
      direction(piece, "NONE", "RIGHT");
      direction(piece, "NONE", "LEFT");
   }
      
     }
     
   void direction(Piece piece, String dirOne, String dirTwo){
     boolean cont = true;
     int r = 0;
     int c = 0;
     if (dirOne.equals("UP")){
       r = -1;
     }
     if (dirOne.equals("DOWN")){
       r = 1;
     }
     if (dirTwo.equals("RIGHT")){
       c = 1;
     }
     if (dirTwo.equals("LEFT")){
       c = -1;
     }
     while (cont && inBound(piece.row + r, piece.col + c)){
      if (chessBoard[piece.row + r][piece.col + c] == null){
          piece.space.add(new float[]{piece.row + r, piece.col + c});
          if (r < 0){
          r -=1;
          }
          if (r > 0){
          r +=1;
          }
          if (c < 0){
          c -=1;
          }
          if (c > 0){
          c +=1;
          }
       }else{
       cont = false;
       }
      }
   }
  
}
