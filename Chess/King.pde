public class King extends Piece{
  
  public King(int r, int c, String n, int co){
   super(r, c, n, co);
  }
  
  void move(){
    
  }
  
  void movement(int x, int y){
   super.space = new ArrayList<float[]>(); 
   space.add(new float[]{row-1, col-1});
   space.add(new float[]{row-1, col});
   space.add(new float[]{row-1, col+1});
   space.add(new float[]{row, col-1});
   space.add(new float[]{row, col+1});
   space.add(new float[]{row+1, col-1});
   space.add(new float[]{row+1, col});
   space.add(new float[]{row+1, col+1});
  
  
   }
  
  void capture(){
    
  }
}
