public class King extends Piece{
  
  public King(int r, int c, String n, int co){
   super(r, c, n, co);
  }
   
   void movement(Piece[][] cboard){
     space = new ArrayList<float[]>();
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
