PImage board;

PImage WhPawn;
PImage WhKnight;
PImage WhBishop;
PImage WhRook;
PImage WhQueen;
PImage WhKing;

PImage BlPawn;
PImage BlKnight;
PImage BlBishop;
PImage BlRook;
PImage BlQueen;
PImage BlKing;


int turnCount;
Board field;
int phase;

void setup(){
  size(900, 800);
  loadImages();
  
  turnCount = 1;
  field = new Board();
  phase = 1;
  image(board, 0, 0);
}

void draw(){

  
  if (turnCount == 1){  //initial board draw
  field.start(); //add all the pieces to the board
  //draw out all the pieces
  }
  
  if (phase == 2){
    movementDraw();
  }
  
//after each turn flip the board
  
  
}

void movementDraw(){
  //highlight the piece that was clicked
  //draw a circle where the piece can move
  turnCount +=1;
}

void mouseClicked(){
  
  int x = mouseX/100;
  int y = mouseY/100;
  textSize(40);
  fill(0);
  text("(" + y + " " + x + ")", mouseX, mouseY); //sake of testing
  
  //phase 1 "neutral phase"
  //phase 2 begins when player clicks on a piece, returns to phase 1 after player moves the piece
  
  if (field.chessBoard[x][y] == 1){ //change to != null when piece constructor is made (aka checking if a piece is on that tile)
    phase = 2;
  }
  
  if (field.chessBoard[x][y] == 0 && phase == 2){ //if player clicks on an empty space after clicking on a piece
    //move that piece
    phase = 1;
  }
}

void loadImages(){
  board = loadImage("board.png");
  WhPawn = loadImage("WhPawn.png");
  WhKnight = loadImage("WhKnight.png");
  WhBishop = loadImage("WhBishop.png");
  WhRook = loadImage("WhRook.png");
  WhQueen = loadImage("WhQueen.png");
  WhKing = loadImage("WhKing.png");
  
  BlPawn = loadImage("BlPawn.png");
  BlKnight = loadImage("BlKnight.png");
  BlBishop = loadImage("BlBishop.png");
  BlRook = loadImage("BlRook.png");
  BlQueen = loadImage("BlQueen.png");
  BlKing = loadImage("BlKing.png");
}
