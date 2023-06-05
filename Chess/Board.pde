import java.util.ArrayList;
public class Board{
private Piece[][] chessBoard; //change to array of pieces when constructor is done
King BlKing = new King(0, 4, "King", 0);
King WhKing = new King(7, 4, "King", 1);
  
  
  public Board(){
    chessBoard = new Piece[8][8];
    
    //black side
    //chessBoard[0][0] = new Piece(0, 0, "Rook", 0);
    //chessBoard[0][1] = new Piece(0, 1, "Knight", 0);
    //chessBoard[0][2] = new Piece(0, 2, "Bishop", 0);
    //chessBoard[0][3] = new Piece(0, 3, "Queen", 0);
    chessBoard[0][4] = BlKing;
    //chessBoard[0][5] = new Piece(0, 5, "Bishop", 0);
    //chessBoard[0][6] = new Piece(0, 6, "Knight", 0);
    //chessBoard[0][7] = new Piece(0, 7, "Rook", 0);
    
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
              current.movement(chessBoard);
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
              current.futureMove(chessBoard);
            for (int i = 0; i < current.space.size(); i +=1){
              endGame = false;
            }
          }
        }
      }
     }
    return endGame;
  }
  
 public void move(int y, int x, int lastY, int lastX){
     chessBoard[y][x] = chessBoard[lastY][lastX];
     chessBoard[y][x].setRow(y);
     chessBoard[y][x].setCol(x);
     
    //remove the old piece
    chessBoard[lastY][lastX] = null;
 }
}
