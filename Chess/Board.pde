import java.util.ArrayList;
public class Board{
private Piece[][] chessBoard; //change to array of pieces when constructor is done
static final int BLACK = 0;
static final int WHITE = 1;
boolean donePromote = true;
King BlKing = new King(0, 4, "King", BLACK);
King WhKing = new King(7, 4, "King", WHITE);
  
  
  public Board(){
    chessBoard = new Piece[8][8];
    
    //black side
    chessBoard[0][0] = new Piece(0, 0, "Rook", BLACK);
    chessBoard[0][1] = new Piece(0, 1, "Knight", BLACK);
    chessBoard[0][2] = new Piece(0, 2, "Bishop", BLACK);
    chessBoard[0][3] = new Piece(0, 3, "Queen", BLACK);
    chessBoard[0][4] = BlKing;
    chessBoard[0][5] = new Piece(0, 5, "Bishop", BLACK);
    chessBoard[0][6] = new Piece(0, 6, "Knight", BLACK);
    chessBoard[0][7] = new Piece(0, 7, "Rook", BLACK);
    
    for (int i = 0; i < 8; i +=1){
      chessBoard[1][i] = new Pawn(1, i, "Pawn", BLACK);
    }
    
    
    //white side
    chessBoard[7][0] = new Piece(7, 0, "Rook", WHITE);
    chessBoard[7][1] = new Piece(7, 1, "Knight", WHITE);
    chessBoard[7][2] = new Piece(7, 2, "Bishop", WHITE);
    chessBoard[7][3] = new Piece(7, 3, "Queen", WHITE);
    chessBoard[7][4] = WhKing;
    chessBoard[7][5] = new Piece(7, 5, "Bishop", WHITE);
    chessBoard[7][6] = new Piece(7, 6, "Knight", WHITE);
    chessBoard[7][7] = new Piece(7, 7, "Rook", WHITE);
    
    for (int i = 0; i < 8; i +=1){
      chessBoard[6][i] = new Pawn(6, i, "Pawn", WHITE);
    }
  }
  
  void copyOver(Board template){
    for (int r = 0; r < 8; r +=1){
      for (int c = 0; c < 8; c +=1){
        if (template.chessBoard[r][c] != null){
          int ro = template.chessBoard[r][c].getRow();
          int co = template.chessBoard[r][c].getCol();
          String n = template.chessBoard[r][c].getName();
          int colo = template.chessBoard[r][c].getColor();
          if (template.chessBoard[r][c].name.equals("Pawn")){
            Pawn newPawn = new Pawn(ro, co, n, colo);
            Pawn ogPawn = (Pawn)template.chessBoard[r][c];
            this.chessBoard[r][c] = newPawn;
            newPawn.firstMove = template.chessBoard[r][c].firstMove;
            newPawn.canPassant = ogPawn.canPassant;
          }else{
            if (template.chessBoard[r][c].name.equals("King")){
              if (template.chessBoard[r][c].Color == BLACK){
                boolean check = BlKing.inCheck;
                BlKing = new King(ro, co, n, colo);
                this.chessBoard[r][c] = BlKing;
                BlKing.firstMove = template.chessBoard[r][c].firstMove;
                BlKing.inCheck = check;
                }
                if (template.chessBoard[r][c].Color == WHITE){
                  boolean check = WhKing.inCheck;
                  WhKing = new King(ro, co, n, colo);
                  this.chessBoard[r][c] = WhKing;
                  WhKing.firstMove = template.chessBoard[r][c].firstMove;
                  WhKing.inCheck = check;
                }
            }else{
              Piece newCopy = new Piece(ro, co, n, colo);
              this.chessBoard[r][c] = newCopy;
              newCopy.firstMove = template.chessBoard[r][c].firstMove;
            }
          }
        }else{
          this.chessBoard[r][c] = null;
        }
      }
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
  
  
  King getKing(int Color){
    if (Color == WHITE){
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
              current.movement(chessBoard);
              if (current.name.equals("Pawn")){
                current.space.clear();
                current.space.add(new float[]{current.row+ 1, current.col - 1});
                current.space.add(new float[]{current.row+ 1, current.col + 1});
              }
              for (int i = 0; i < current.space.size(); i +=1){
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
  
    boolean movesLeft(int Color){
    boolean endGame = true;
      for (int r = 0; r < 8; r +=1){
        for (int c = 0; c < 8; c +=1){
          if (chessBoard[r][c] != null){
            Piece current = chessBoard[r][c];
            if (current.Color == Color){
              current.movement(chessBoard);
              futureMove(current);
            for (int i = 0; i < current.space.size(); i +=1){
              endGame = false;
            }
          }
        }
      }
     }
    return endGame;
  }
  
     void futureMove(Piece piece){
     int prevRow = piece.row;
     int prevCol = piece.col;
     Piece temp;
    for (int i = 0; i < piece.space.size(); i +=1){
      float[] coord = piece.space.get(i);
      int xCoord = (int)coord[1];
      int yCoord = (int)coord[0];
      if (chessBoard[yCoord][xCoord] != null){
        temp = chessBoard[yCoord][xCoord];
          
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
  
 public void move(int y, int x, int lastY, int lastX){
       chessBoard[y][x] = chessBoard[lastY][lastX];
       chessBoard[y][x].setRow(y);
       chessBoard[y][x].setCol(x);
     
    //remove the old piece
    chessBoard[lastY][lastX] = null;
 }
 
  public void promote(int y, int x){
    fill(255);
   square(x * 100, y * 100, 100);
   println("boon");
 }
 
 public void passantMove(int y, int x, int lastY, int lastX){
   chessBoard[y][x] = chessBoard[lastY][lastX];
   chessBoard[y][x].setRow(y);
   chessBoard[y][x].setCol(x);
   
   //remove the old piece
   chessBoard[lastY][lastX] = null;
   chessBoard[lastY][x] = null;
 }
  
  String toString(Piece[][] board){
  String res = "(";
  for (int r = 0; r < 8; r +=1){
      for (int c = 0; c < 8; c +=1){
        if (board[r][c] == null){
          res = res + "empty ";
        }else{
        if (board[r][c].name.equals("Rook")){
          res = res + "Rook " + board[r][c].row + " " + board[r][c].col + " ";
        }
        if (board[r][c].name.equals("Knight")){
          res = res + "Knight " + board[r][c].row + " " + board[r][c].col + " ";
        }
        if (board[r][c].name.equals("Bishop")){
          res = res + "Bishop " + board[r][c].row + " " + board[r][c].col + " ";
        }
        if (board[r][c].name.equals("Queen")){
          res = res + "Queen " + board[r][c].row + " " + board[r][c].col + " ";
        }
        if (board[r][c].name.equals("King")){
          res = res + "King " + board[r][c].row + " " + board[r][c].col + " ";
        }
        if (board[r][c].name.equals("Pawn")){
          res = res + "Pawn " + board[r][c].row + " " + board[r][c].col + " ";
        }
      }
      }
      res = res + ")";
      res = res + "\n";
      res = res + "(";
    }
    return res;
  }
  
}
