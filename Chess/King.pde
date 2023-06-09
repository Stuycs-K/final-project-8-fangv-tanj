public class King extends Piece{
  
  public King(int r, int c, String n, int co){
   super(r, c, n, co);
   firstMove = true;
  }
   
   void movement(Piece[][] cboard){
     space = new ArrayList<float[]>();
     
     //CHECK THIS:
     if (firstMove && cboard[row][col + 1] == null && cboard[row][col + 2] == null && cboard[row][col + 3].name.equals("Rook")){
       space.add(new float[]{row, col + 2});
       cboard[row][col + 3] = null;
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
     if(firstMove && cboard[row][5]==null && cboard[row][6]==null){ 
       if (legalMove(cboard, row, col+2)){
         space.add(new float[]{row, col+2}); 
       }
     }
  }
  
}
