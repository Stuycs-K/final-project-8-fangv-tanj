
PImage board;
PImage WhPawn;
int turnCount;
int[][] chessBoard; //will change it to array of pieces when piece constructor is made
int phase;

void setup(){
  size(900, 800);
  board = loadImage("board.png");
  WhPawn = loadImage("WhPawn.png");
  
  turnCount = 1;
  chessBoard = new int[8][8];
  phase = 1;
}

void draw(){
  image(board, 0, 0);
  image(WhPawn, 0, 0);
  
  if (phase == 2){
    pieceDraw();
  }
  
}

void pieceDraw(){
  image(WhPawn, mouseX, mouseY);
}

void mouseClicked(){
  
  int x = mouseX/100;
  int y = mouseY/100;
  textSize(40);
  fill(0);
  text("(" + y + " " + x + ")", mouseX, mouseY); //sake of testing
  
  if (chessBoard[x][y] == 0){
      if (phase == 2){
      phase = 1;
    }else{
      phase +=1;
    }
  }
  


}
