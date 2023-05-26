public class King extends Piece{
  
  public King(int r, int c, String n, int co){
   super(r, c, n, co);
  }
  
  void move(){
    
  }
  
  void movementDraw(int x, int y){
   super.space = new ArrayList<float[]>(); 
   space.add(new float[]{row-1, col-1});
   space.add(new float[]{row-1, col});
   space.add(new float[]{row-1, col+1});
   space.add(new float[]{row, col-1});
   space.add(new float[]{row, col+1});
   space.add(new float[]{row+1, col-1});
   space.add(new float[]{row+1, col});
   space.add(new float[]{row+1, col+1});
   //highlight the piece that was clicked
  
   Piece held = field.chessBoard[y][x];
   held.move();
   int spaces = held.space.size();
   for (int i = 0; i < spaces; i +=1){
     float[] a = held.space.get(i);
     System.out.println(a[1]);
     fill(211, 211, 211);
     circle(a[1] * 100 + 50, a[0] * 100 + 50, 30);
  //draw a circle where the piece can move
  
   }
  }
  
  void capture(){
    
  }
}
