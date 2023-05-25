public class Pawn extends Piece{
  boolean firstMove;
  boolean canPassant;
  
  public Pawn(int r, int c, String n, int co){
   super(r, c, n, co);
   firstMove = true;
  }
  
  void move(){
    super.space = new ArrayList<float[]>(); 
    if(firstMove){
      super.space.add(new float[]{row-1, col});
      super.space.add(new float[]{row-2, col});
      firstMove = false;
    }
    else{
      super.space.add(new float[]{row-1, col});
    }
  }
  
  void capture(){
    
  }
}
