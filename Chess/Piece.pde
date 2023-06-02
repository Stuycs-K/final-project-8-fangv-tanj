import java.util.ArrayList;
public class Piece{
  int row;
  int col;
  String name;
  int Color;
  ArrayList<float[]> space = new ArrayList<float[]>();
  
  public Piece(int r, int c, String n, int co){
   row = r;
   col = c;
   name = n;
   Color = co;
  }
  
  public Piece(String n){
   name = n;
  }
  
 boolean inBound(int r, int c){
   return ((r >= 0) && (r < 8) && (c >= 0) && (c < 8)); 
 }
 
 void movement(Piece[][] cboard){
   space = new ArrayList<float[]>();
    if(name == "Queen"){
      direction(cboard, "UP", "LEFT");
      direction(cboard, "UP", "RIGHT");
      direction(cboard, "DOWN", "LEFT");
      direction(cboard, "DOWN", "RIGHT");
      direction(cboard, "UP", "NONE");
      direction(cboard, "DOWN", "NONE");
      direction(cboard, "NONE", "RIGHT");
      direction(cboard, "NONE", "LEFT");
   }
   if (name == "Rook"){
      direction(cboard, "UP", "NONE");
      direction(cboard, "DOWN", "NONE");
      direction(cboard, "NONE", "RIGHT");
      direction(cboard, "NONE", "LEFT");
   }
   if (name == "Bishop"){
      direction(cboard, "UP", "LEFT");
      direction(cboard, "UP", "RIGHT");
      direction(cboard, "DOWN", "LEFT");
      direction(cboard, "DOWN", "RIGHT");
   }
   if (name == "Knight"){
      if (legalMove(cboard, row - 2, col -1)){
        space.add(new float[]{row - 2, col - 1});
      }
      if (legalMove(cboard, row - 1, col - 2)){
        space.add(new float[]{row - 1, col - 2}); 
      }
      if (legalMove(cboard, row - 2, col + 1)){
        space.add(new float[]{row - 2, col + 1});
      }
      if (legalMove(cboard, row - 1, col + 2)){
        space.add(new float[]{row - 1, col + 2});
      }
      if (legalMove(cboard, row + 2, col + 1)){
        space.add(new float[]{row + 2, col + 1});
      }
      if (legalMove(cboard, row + 1, col + 2)){
        space.add(new float[]{row + 1, col + 2});
      }
      if (legalMove(cboard, row + 2, col - 1)){
        space.add(new float[]{row + 2, col - 1});
      }
      if (legalMove(cboard, row + 1, col - 2)){
        space.add(new float[]{row + 1, col - 2});
      }
   }
  }
     
   boolean legalMove(Piece[][] cboard, int r, int c){
     if (cboard[row][col] == null){
     return false;
     }
     if (!inBound(r, c)){
       return false;
     }
     if (cboard[r][c] == null){
       return true;
     }else{
       System.out.println(r);
       System.out.println(c);
       return cboard[r][c].Color != cboard[row][col].Color;
     }
   }
     
     
   void direction(Piece[][] cboard, String dirOne, String dirTwo){
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
     while (cont && inBound(row + r, col + c)){
       boolean empty = cboard[row + r][col + c] == null;
       boolean capturable = false;
       if (!empty){
       capturable = cboard[row + r][col + c].Color != cboard[row][col].Color;
       }
      if (empty || capturable){
          space.add(new float[]{row + r, col + c});
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
   
   void futureMove(Piece[][] chessBoard){
     int prevRow = row;
     int prevCol = col;
     Piece temp;
    for (int i = 0; i < space.size(); i +=1){
      float[] coord = space.get(i);
      int xCoord = (int)coord[1];
      int yCoord = (int)coord[0];
      if (chessBoard[yCoord][xCoord] != null){
        temp = chessBoard[yCoord][xCoord];
          
          move(yCoord, xCoord, prevRow, prevCol, chessBoard);
          
           if (field.inCheck(turnCount % 2)){
             space.remove(i);
             i -=1;
          }
           move(prevRow, prevCol, yCoord, xCoord, chessBoard);
            chessBoard[yCoord][xCoord] = temp;
      }else{
      
         move(yCoord, xCoord, prevRow, prevCol, chessBoard);
           if (field.inCheck(turnCount % 2)){
           space.remove(i);
           i -=1;
          }
          move(prevRow, prevCol, yCoord, xCoord, chessBoard);
      }
    }
  }
 
  public void move(int y, int x, int lastY, int lastX, Piece[][] chessBoard){
     chessBoard[y][x] = chessBoard[lastY][lastX];
     chessBoard[y][x].setRow(y);
     chessBoard[y][x].setCol(x);
     
    //remove the old piece
    chessBoard[lastY][lastX] = null;
 }
  
  
  void setRow(int r){
  row = r;
  }
  
  void setCol(int c){
  col = c;
  }
  
  String toString(){
  return name;
  }
}
