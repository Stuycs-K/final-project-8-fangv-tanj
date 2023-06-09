public class Pawn extends Piece{
  boolean canPassant;
  
  public Pawn(int r, int c, String n, int co){
   super(r, c, n, co);
   firstMove = true;
  }
  
boolean inBound(int r, int c){
   return ((r >= 0) && (r < 8) && (c >= 0) && (c < 8)); 
 }
 
boolean legalMove(Piece[][] cboard, int r, int c){
   if (!inBound(r, c)){
     return false;
    }
    if (cboard[r][c] == null){
      return true;
    }else{
      return false;
    }
  }
 
 void movement(Piece[][] cboard){
   space = new ArrayList<float[]>();
   boolean x = true;
   if(firstMove){
     if (legalMove(cboard, row - 1, col)){
       super.space.add(new float[]{row-1, col});
     }
     else{
       x = false;
     }
     if (x){
       if(legalMove(cboard, row - 2, col)){
         super.space.add(new float[]{row-2, col});
       }
     }
   }
   else{
     if (legalMove(cboard, row - 1, col)){
       super.space.add(new float[]{row-1, col});
     }
   }
   if (inBound(row - 1, col - 1)){
     if (cboard[row - 1][col - 1] != null){
       Piece other = cboard[row - 1][col - 1];
       if (other.Color != Color){
       super.space.add(new float[]{row - 1, col - 1});
       }
     }
   }
   if (inBound(row - 1, col + 1)){
     if (cboard[row - 1][col + 1] != null){
       Piece other = cboard[row - 1][col + 1];
       if (other.Color != Color){
       super.space.add(new float[]{row - 1, col + 1});
       }
     }
    }
   }
 }
