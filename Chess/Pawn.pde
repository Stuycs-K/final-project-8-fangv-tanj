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
  
  void capture(){
    
  }
}
