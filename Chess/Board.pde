public class Board{
private int[][] chessBoard; //change to array of pieces when constructor is done
  
  
  public Board(){
    chessBoard = new int[8][8];
  }
  
  //place all the pices
  public void start(){
    /*black side
    chessBoard[0][0] = new Piece("Rook", "Black");
    chessBoard[0][1] = new Piece("Knight", "Black");
    chessBoard[0][2] = new Piece("Bishop", "Black");
    chessBoard[0][3] = new Piece("Queen", "Black");
    chessBoard[0][4] = new King("Black");
    
    for (int i = 0; i < 8; i +=1){
      chessBoard[1][i] = new Pawn("Black");
    }
    */
    
    /*white side
    chessBoard[0][0] = new Piece("Rook", "White");
    chessBoard[0][1] = new Piece("Knight", "White");
    chessBoard[0][2] = new Piece("Bishop", "White");
    chessBoard[0][3] = new Piece("Queen", "White");
    chessBoard[0][4] = new King("Black");
    
    for (int i = 0; i < 8; i +=1){
      chessBoard[1][i] = new Pawn("White");
    }
    */
  }
  
  //flip the board 
  public void flip(){
    
    int[][] res = new int[8][8];
    for (int r = 7; r >= 0; r -=1){
      for (int c = 7; c >= 0; c -=1){
        res[7 - r][7 - c] = chessBoard[r][c];
      }
    }
    chessBoard = res;
  }
  
}
