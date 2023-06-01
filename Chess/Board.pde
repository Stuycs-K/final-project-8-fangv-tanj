import java.util.ArrayList;
public class Board{
private Piece[][] chessBoard; //change to array of pieces when constructor is done
King BlKing = new King(0, 4, "King", 0);
King WhKing = new King(7, 4, "King", 1);
  
  
  public Board(){
    chessBoard = new Piece[8][8];
    
    //black side
    chessBoard[0][0] = new Piece(0, 0, "Rook", 0);
    chessBoard[0][1] = new Piece(0, 1, "Knight", 0);
    chessBoard[0][2] = new Piece(0, 2, "Bishop", 0);
    chessBoard[0][3] = new Piece(0, 3, "Queen", 0);
    chessBoard[0][4] = BlKing;
    chessBoard[0][5] = new Piece(0, 5, "Bishop", 0);
    chessBoard[0][6] = new Piece(0, 6, "Knight", 0);
    chessBoard[0][7] = new Piece(0, 7, "Rook", 0);
    
    //for (int i = 0; i < 8; i +=1){
    //  chessBoard[1][i] = new Pawn(1, i, "Pawn", 0);
    //}
    
    //white side
    chessBoard[7][0] = new Piece(7, 0, "Rook", 1);
    chessBoard[7][1] = new Piece(7, 1, "Knight", 1);
    chessBoard[7][2] = new Piece(7, 2, "Bishop", 1);
    chessBoard[7][3] = new Piece(7, 3, "Queen", 1);
    chessBoard[7][4] = WhKing;
    chessBoard[7][5] = new Piece(7, 5, "Bishop", 1);
    chessBoard[7][6] = new Piece(7, 6, "Knight", 1);
    chessBoard[7][7] = new Piece(7, 7, "Rook", 1);
    
    //for (int i = 0; i < 8; i +=1){
    //  chessBoard[6][i] = new Pawn(6, i, "Pawn", 1);
    //}
  }
  
  public void futureMove(Piece piece){
     int prevRow = piece.row;
     int prevCol = piece.col;
     Piece temp;
    for (int i = 0; i < piece.space.size(); i +=1){
      float[] coord = piece.space.get(i);
      int xCoord = (int)coord[1];
      int yCoord = (int)coord[0];
      if (chessBoard[yCoord][xCoord] != null){
        temp = chessBoard[yCoord][xCoord];
        capture = true;
          
          move(yCoord, xCoord, prevRow, prevCol);
          
           if (field.inCheck(turnCount % 2)){
             piece.space.remove(i);
             i -=1;
          }
           move(prevRow, prevCol, yCoord, xCoord);
            chessBoard[yCoord][xCoord] = temp;
      }else{
      
         move(yCoord, xCoord, prevRow, prevCol);
           if (field.inCheck(turnCount % 2)){
           piece.space.remove(i);
           i -=1;
          }
          move(prevRow, prevCol, yCoord, xCoord);
      }
    }
  }
  
  String toString(Piece[][] board){
  String res = "(";
  for (int r = 0; r < 8; r +=1){
      for (int c = 0; c < 8; c +=1){
        if (board[r][c] == null){
          res = res + "empty ";
        }else{
        if (board[r][c].name.equals("Rook")){
          res = res + "Rook ";
        }
        if (board[r][c].name.equals("Knight")){
          res = res + "Knight ";
        }
        if (board[r][c].name.equals("Bishop")){
          res = res + "Bishop ";
        }
        if (board[r][c].name.equals("Queen")){
          res = res + "Queen ";
        }
        if (board[r][c].name.equals("King")){
          res = res + "King ";
        }
        if (board[r][c].name.equals("Pawn")){
          res = res + "Pawn ";
        }
      }
      }
      res = res + ")";
      res = res + "\n";
      res = res + "(";
    }
    return res;
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
  
  /*check implementation
  1. have a way to keep track of the kings pos on the board -done
  2. after player A makes a move check the moves player A's pieces can make
  3. if any of those moves are the same position as player B's king, activate 
    "check" for player B - done
  4. if player B clicks on a piece check if those moves will get 
     player B out of check (use the same method as step 3)if they don't 
     circles are not drawn
  */
  
  
  
  King getKing(int Color){
    if (Color == 1){
      return WhKing;
    }else{
      return BlKing;
    }
  }
  
  boolean inCheck(int Color){
    boolean check = false;
    King k = getKing(Color);
      int kingRow = k.row;
      int kingCol = k.col;
      for (int r = 0; r < 8; r +=1){
        for (int c = 0; c < 8; c +=1){
          if (chessBoard[r][c] != null){
            Piece current = chessBoard[r][c];
            if (current.Color != Color){
              for (int i = 0; i < current.space.size(); i +=1){
                movement(current);
                float[] coord = current.space.get(i);
                int xCoord = (int)coord[1];
                int yCoord = (int)coord[0];
                if (xCoord == kingCol && yCoord == kingRow){
                  check = true;
                }
              }
            }
          }
        }
      }
    return check;
  }
  
 public void move(int y, int x, int lastY, int lastX){
     //move that piece
     System.out.println(y);
     System.out.println(x);
     System.out.println(lastY);
     System.out.println(lastX);
     chessBoard[y][x] = chessBoard[lastY][lastX];
     chessBoard[y][x].setRow(y);
     chessBoard[y][x].setCol(x);
     
    //remove the old piece
    chessBoard[lastY][lastX] = null;
 }
 
 boolean inBound(int r, int c){
   return ((r >= 0) && (r < 8) && (c >= 0) && (c < 8)); 
 }
 
 void movement(Piece piece){
   piece.space = new ArrayList<float[]>();
   int row = piece.row;
   int col = piece.col;
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
   if (piece.name == "Bishop"){
      direction(piece, "UP", "LEFT");
      direction(piece, "UP", "RIGHT");
      direction(piece, "DOWN", "LEFT");
      direction(piece, "DOWN", "RIGHT");
   } 
   if (piece.name == "Knight"){
      if (legalKnightMove(piece, row - 2, col -1)){
        piece.space.add(new float[]{row - 2, col - 1});
      }
      if (legalKnightMove(piece, row - 1, col - 2)){
        piece.space.add(new float[]{row - 1, col - 2}); 
      }
      if (legalKnightMove(piece, row - 2, col + 1)){
        piece.space.add(new float[]{row - 2, col + 1});
      }
      if (legalKnightMove(piece, row - 1, col + 2)){
        piece.space.add(new float[]{row - 1, col + 2});
      }
      if (legalKnightMove(piece, row + 2, col + 1)){
        piece.space.add(new float[]{row + 2, col + 1});
      }
      if (legalKnightMove(piece, row + 1, col + 2)){
        piece.space.add(new float[]{row + 1, col + 2});
      }
      if (legalKnightMove(piece, row + 2, col - 1)){
        piece.space.add(new float[]{row + 2, col - 1});
      }
      if (legalKnightMove(piece, row + 1, col - 2)){
        piece.space.add(new float[]{row + 1, col - 2});
      }
   }
     if (piece.name.equals("Pawn")){
       Pawn a = (Pawn)piece;
          if(row != 6){
     a.firstMove = false;
   }
   if(a.firstMove){
     if (legalMove(a, row - 1, col)){
     a.space.add(new float[]{row-1, col});
     }
     if (legalMove(a, row - 2, col)){
     a.space.add(new float[]{row-2, col});
     }
   }
   else{
     if (legalMove(a, row - 1, col)){
     a.space.add(new float[]{row-1, col});
     }
   }
     }
      
     }
     
   boolean legalKnightMove(Piece piece, int r, int c){
     if (!inBound(r, c)){
       return false;
     }
     if (chessBoard[r][c] == null){
       return true;
     }else{
       System.out.println("a");
       return chessBoard[r][c].Color != chessBoard[piece.row][piece.col].Color;
     }
   }
   
      boolean legalMove(Pawn piece, int r, int c){
     if (!inBound(r, c)){
       return false;
     }
     if (chessBoard[r][c] == null){
       return true;
     }else{
       System.out.println("a");
       return chessBoard[r][c].Color != chessBoard[piece.row][piece.col].Color;
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
       boolean empty = chessBoard[piece.row + r][piece.col + c] == null;
       boolean capturable = false;
       if (!empty){
       capturable = chessBoard[piece.row + r][piece.col + c].Color != chessBoard[piece.row][piece.col].Color;
       }
      if (empty || capturable){
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
          if (capturable){
          cont = false;
          }
       }else{
       cont = false;
       }
      }
   }
  
}
