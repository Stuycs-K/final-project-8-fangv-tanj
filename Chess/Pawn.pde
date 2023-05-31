public class Pawn extends Piece{
  boolean firstMove;
  boolean canPassant;
  
  public Pawn(int r, int c, String n, int co){
   super(r, c, n, co);
   firstMove = true;
  }
  
  void movement(int x, int y){
   super.space = new ArrayList<float[]>(); 
   if(row != 6){
     firstMove = false;
   }
   if(firstMove){
     super.space.add(new float[]{row-1, col});
     super.space.add(new float[]{row-2, col});
   }
   else{
     super.space.add(new float[]{row-1, col});
   }
  }
  
boolean inBound(int r, int c){
   return ((r >= 0) && (r < 8) && (c >= 0) && (c < 8)); 
 }
 
 void movement(Piece[][] cboard){
   space = new ArrayList<float[]>();
   boolean x = true;
   if(row != 6){
     firstMove = false;
   }
   if(firstMove){
     if (legalMove(cboard, row - 1, col)){
       super.space.add(new float[]{row-1, col});
     }
     else{
       x = false;
     }
     if (legalMove(cboard, row - 2, col)){
       if(x){
         super.space.add(new float[]{row-2, col});
       }
     }
   }
   else{
     if (legalMove(cboard, row - 1, col)){
       super.space.add(new float[]{row-1, col});
     }
   }
  }
     
   boolean legalMove(Piece[][] cboard, int r, int c){
     if (!inBound(r, c)){
       return false;
     }
     if (cboard[r][c] == null){
       return true;
     }else{
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
  
  void capture(){
    
  }
}
