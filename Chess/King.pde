public class King extends Piece{
  
  public King(int r, int c, String n, int co){
   super(r, c, n, co);
   firstMove = true;
  }
   
   void movement(Piece[][] cboard){
     space = new ArrayList<float[]>();
     if(cboard[row][col+1]==null && cboard[row][col+2]==null && cboard[row][col+3]==null){
       if (legalMove(cboard, row, col+2)){
       space.add(new float[]{row, col+2});
       firstMove = false;
      }
     }
     if (legalMove(cboard, row-1, col-1)){
       space.add(new float[]{row-1, col-1});
       firstMove = false;
      }
     if (legalMove(cboard, row-1, col)){
       space.add(new float[]{row-1, col});
       firstMove = false;
     }
     if (legalMove(cboard, row-1, col+1)){
       space.add(new float[]{row-1, col+1});
       firstMove = false;
     }
     if (legalMove(cboard, row, col-1)){
       space.add(new float[]{row, col-1});
       firstMove = false;
     }
     if (legalMove(cboard, row, col+1)){
       space.add(new float[]{row, col+1});
       firstMove = false;
     }
     if (legalMove(cboard, row+1, col-1)){
       space.add(new float[]{row+1, col-1});
       firstMove = false;
     }
     if (legalMove(cboard, row+1, col)){
       space.add(new float[]{row+1, col});
       firstMove = false;
     }
     if (legalMove(cboard, row+1, col+1)){
       space.add(new float[]{row+1, col+1}); 
       firstMove = false;
     }
     if(firstMove && cboard[row][5]==null && cboard[row][6]==null){ 
       if (legalMove(cboard, row, col+2)){
         space.add(new float[]{row, col+2}); 
         firstMove = false;
       }
     }
  }
  
  
  
}
