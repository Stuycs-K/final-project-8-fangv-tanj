
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
  
  if (turnCount == 1){  //initial board draw
  image(WhPawn, 0, 0);
  }
  
  if (phase == 2){
    movementDraw();
  }
  
  //if turn count is odd, call whiteBoard
  //if turn count is even, call blackBoard
  
  
}

void movementDraw(){
  //highlight the piece that was clicked
  //draw a circle where the piece can move
  turnCount +=1;
}

void whiteDraw(){
  //draw board from white POV
}

void blackDraw(){
  //draw board from black POV
}

void mouseClicked(){
  
  int x = mouseX/100;
  int y = mouseY/100;
  textSize(40);
  fill(0);
  text("(" + y + " " + x + ")", mouseX, mouseY); //sake of testing
  
  //phase 1 "neutral phase"
  //phase 2 begins when player clicks on a piece, returns to phase 1 after player moves the piece
  
  if (chessBoard[x][y] == 0){ //change to != null when piece constructor is made (aka checking if a piece is on that tile)
      if (phase == 2){
      phase = 1;
    }else{
      phase +=1;
    }
  }
  
  


}
