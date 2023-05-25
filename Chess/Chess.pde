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

int lastX;
int lastY;

int turnCount;
int prevTurnCount;
Board field;
int phase;

void setup(){
  size(900, 800);
  loadImages();
  
  prevTurnCount = 1;
  turnCount = 1;
  field = new Board();
  phase = 1;
  background(255);
  field.start(); //add all the pieces to the board
  image(board, 0, 0);
  loadPieces();  //draw out all the pieces
}

void draw(){
  
   textSize(40);
  fill(0);
  text("turnCount: "+turnCount, 600, 400); //sake of testing
  text("prevTurn: "+prevTurnCount, 600, 500); //sake of testing
  
  
  
  if (prevTurnCount < turnCount){
    background(255);
    image(board, 0, 0);
    loadPieces();
    prevTurnCount = turnCount;
  }
  
  //if (phase == 2){
  //  movementDraw();
  //}
  
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
  
  if (field.chessBoard[y][x] != null){ //if player clicks on a tile with a piece
      lastX = x;
      lastY = y;
    phase = 2;
  }
  
  if (field.chessBoard[y][x] == null && phase == 2){ //if player clicks on an empty space after clicking on a piece
    //move that piece
    field.chessBoard[y][x] = field.chessBoard[lastY][lastX];
    
    //remove the old piece
    field.chessBoard[lastY][lastX] = null;
    
    //return to neutral phaase
    phase = 1;
    
    //increase turn count
    turnCount +=1;
  }
}


void loadImages(){
  board = loadImage("board.png");
  WhPawn = loadImage("WhPawn.png");
  WhPawn.resize(80, 0);
  
  WhKnight = loadImage("WhKnight.png");
  WhKnight.resize(80, 0);
  
  WhBishop = loadImage("WhBishop.png");
  WhBishop.resize(80,0);
  
  WhRook = loadImage("WhRook.png");
  WhRook.resize(80, 0);
  
  WhQueen = loadImage("WhQueen.png");
  WhQueen.resize(80, 0);
  
  WhKing = loadImage("WhKing.png");
  
  BlPawn = loadImage("BlPawn.png");
  BlPawn.resize(80, 0);
  
  BlKnight = loadImage("BlKnight.png");
  BlKnight.resize(80, 0);
  
  BlBishop = loadImage("BlBishop.png");
  BlBishop.resize(80, 0);
  
  BlRook = loadImage("BlRook.png");
  BlRook.resize(80, 0);
  
  BlQueen = loadImage("BlQueen.png");
  BlQueen.resize(80, 0);
  
  BlKing = loadImage("BlKing.png");
}

void loadPieces(){
  for (int r = 0; r < 8; r +=1){
    for (int c = 0; c < 8; c +=1){
      if (field.chessBoard[r][c] != null){
        
        
          if (field.chessBoard[r][c].name.equals("Bishop") && field.chessBoard[r][c].Color == 1){
            image(WhBishop, c * 100, r * 100);
          }
          if (field.chessBoard[r][c].name.equals("Rook") && field.chessBoard[r][c].Color == 1){
            image(WhRook, c * 100, r * 100);
          }
          if (field.chessBoard[r][c].name.equals("Queen") && field.chessBoard[r][c].Color == 1){
            image(WhQueen, c * 100, r * 100);
          }
          if (field.chessBoard[r][c].name.equals("Knight") && field.chessBoard[r][c].Color == 1){
            image(WhKnight, c * 100, r * 100);
          }
          if (field.chessBoard[r][c].name.equals("Pawn") && field.chessBoard[r][c].Color == 1){
            image(WhPawn, c * 100, r * 100);
          }
          
          if (field.chessBoard[r][c].name.equals("Bishop") && field.chessBoard[r][c].Color == 0){
            image(BlBishop, c * 100, r * 100);
          }
          if (field.chessBoard[r][c].name.equals("Rook") && field.chessBoard[r][c].Color == 0){
            image(BlRook, c * 100, r * 100);
          }
          if (field.chessBoard[r][c].name.equals("Queen") && field.chessBoard[r][c].Color == 0){
            image(BlQueen, c * 100, r * 100);
            //System.out.println(field.chessBoard[r][c]);
            //System.out.println("" + r + " " + c);
          }
          if (field.chessBoard[r][c].name.equals("Knight") && field.chessBoard[r][c].Color == 0){
            image(BlKnight, c * 100, r * 100);
          }
          if (field.chessBoard[r][c].name.equals("Pawn") && field.chessBoard[r][c].Color == 0){
            image(BlPawn, c * 100, r * 100);
          }
          
      }
    }
  }
}
