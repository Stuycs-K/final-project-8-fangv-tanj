import java.util.ArrayList;
public class Piece{
  int row;
  int col;
  String name;
  int Color;
  ArrayList<float[]> space = new ArrayList<float[]>();
  
  public Piece(int r, int c, String n, int co){
   row = r;
   col = c;
   name = n;
   Color = co;
  }
  
  public Piece(String n){
   name = n;
  }
  
  void move(){
    
  }
  
  void movementDraw(int x, int y){
    space = new ArrayList<float[]>();  
    if(name == "Queen"){
       for(int i = 1; i < 8; i++){
          space.add(new float[]{row-i, col-i});
          space.add(new float[]{row-i, col+i});
          space.add(new float[]{row+i, col+i});
          space.add(new float[]{row+i, col-i});          
          space.add(new float[]{row, col-i});
          space.add(new float[]{row, col+i});
          space.add(new float[]{row+i, col});
          space.add(new float[]{row-i, col});  
       }
     }
     
     if(name == "Bishop"){
       for(int i = 1; i < 8; i++){
          space.add(new float[]{row-i, col-i});
          space.add(new float[]{row-i, col+i});
          space.add(new float[]{row+i, col+i});
          space.add(new float[]{row+i, col-i});       
       }
     }
     
     if(name == "Rook"){
       for(int i = 1; i < 8; i++){
          space.add(new float[]{row, col-i});
          space.add(new float[]{row, col+i});
          space.add(new float[]{row+i, col});
          space.add(new float[]{row-i, col});        
       }
     }
     
     if(name == "Knight"){  
        space.add(new float[]{row-2, col-1});
        space.add(new float[]{row-1, col-2});
        space.add(new float[]{row-2, col+1});      
        space.add(new float[]{row-1, col+2});
        space.add(new float[]{row+2, col+1});
        space.add(new float[]{row+1, col+2});
        space.add(new float[]{row+2, col-1});      
        space.add(new float[]{row+1, col-2});
     }
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
  
  void setRow(int r){
  row = r;
  }
  
  void setCol(int c){
  col = c;
  }
  
  void setColor(int co){
  Color = co;
  }
  
}
