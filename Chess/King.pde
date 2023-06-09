public class King extends Piece{
  boolean inCheck;
  
  public King(int r, int c, String n, int co){
   super(r, c, n, co);
   firstMove = true;
   inCheck = false;
  }
   
   boolean isEmpty(Piece[][] cboard, String side){
     boolean empty = true;
     if (side.equals("left")){
       for (int c = 1; c < col; c +=1){
         if (cboard[row][c] != null){
           empty = false;
         }
       }
     }
     if (side.equals("right")){
       for (int c = col + 1; c < 7; c +=1){
         if (cboard[row][c] != null){
           empty = false;
         }
       }
     }
     return empty;
   }
   
   void movement(Piece[][] cboard){
     space = new ArrayList<float[]>();
     
     
     //Castle code
     if (!inCheck){
       if (firstMove && isEmpty(cboard, "left")){
         if (cboard[row][0] != null){
           if (cboard[row][0].name.equals("Rook") && cboard[row][0].firstMove){
             space.add(new float[]{row, col - 2});
           }
         }
       }
       if (firstMove && isEmpty(cboard, "right")){
         if (cboard[row][7] != null){
           if (cboard[row][7].name.equals("Rook") && cboard[row][7].firstMove){
             space.add(new float[]{row, col + 2});
           }
         }
       }
     }

     
     
     if (legalMove(cboard, row-1, col-1)){
       space.add(new float[]{row-1, col-1});
      }
     if (legalMove(cboard, row-1, col)){
       space.add(new float[]{row-1, col});
     }
     if (legalMove(cboard, row-1, col+1)){
       space.add(new float[]{row-1, col+1});
     }
     if (legalMove(cboard, row, col-1)){
       space.add(new float[]{row, col-1});
     }
     if (legalMove(cboard, row, col+1)){
       space.add(new float[]{row, col+1});
     }
     if (legalMove(cboard, row+1, col-1)){
       space.add(new float[]{row+1, col-1});
     }
     if (legalMove(cboard, row+1, col)){
       space.add(new float[]{row+1, col});
     }
     if (legalMove(cboard, row+1, col+1)){
       space.add(new float[]{row+1, col+1}); 
     }
  }
  
}
