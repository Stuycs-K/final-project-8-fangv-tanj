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
int[][]moveable;

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
    field.flip(); //after each turn flip the board
    image(board, 0, 0);
    loadPieces();
    prevTurnCount = turnCount;
  }
  
}

int[][] movementDraw(int x, int y){
  
  int[][] moveable = new int[8][8];
  
  if (field.chessBoard[y][x] != null){
    //highlight the piece that was clicked
    if ((x + y) % 2 == 1){
    fill(187, 203, 43);
    }
    if ((x + y) % 2 == 0){
    fill(247, 247, 105);
    }
    
    square(x * 100, y * 100, 100);
    loadPieces();
    
    Piece held = field.chessBoard[y][x];

    field.movement(held);

    int spaces = held.space.size();
      
    for (int i = 0; i < spaces; i +=1){
    
      float[] coord = held.space.get(i);
      int xCoord = (int)coord[1];
      int yCoord = (int)coord[0];
    
      //draw a circle where the piece can move
     
      if (xCoord < 8 && xCoord >= 0 && yCoord < 8 && yCoord >= 0){
        if(field.chessBoard[yCoord][xCoord] != null && field.chessBoard[yCoord][xCoord].Color != held.Color){
          fill(200, 0, 0);
          square(xCoord * 100, yCoord * 100, 100);
          loadPieces();
          moveable[yCoord][xCoord] = 1;
        }
        else{
          fill(211, 211, 211);
          circle(xCoord * 100 + 50, yCoord * 100 + 50, 30);
    
          moveable[yCoord][xCoord] = 1;
        }
      }
    }
  }
  return moveable;
}

void mouseClicked(){
  
  int x = mouseX/100;
  int y = mouseY/100;
  textSize(40);
  fill(0);
  text("(" + y + " " + x + ")", mouseX, mouseY); //sake of testing
  
  if (field.chessBoard[y][x] != null){
    System.out.println(field.chessBoard[y][x].toString());
  }
  
  
  //phase 1 "neutral phase"
  //phase 2 begins when player clicks on a piece, returns to phase 1 after player moves the piece
    Piece clicked = field.chessBoard[y][x];
    int playerTurn = turnCount % 2;

  if (clicked != null && playerTurn == clicked.Color){ //if player clicks on a tile with a piece
      //reset screen
      background(255);
      image(board, 0, 0);
      loadPieces();
      
      phase = 2;
      lastX = x;
      lastY = y;
      int[][]temp = movementDraw(x, y);
      moveable = temp;
  }
  
          
  
  if (phase == 2 && moveable[y][x] == 1){ //if player clicks on an empty space after clicking on a piece
    field.move(y, x, lastY, lastX);
    
    
    //return to neutral phaase
    phase = 1;
    
    //increase turn count
    turnCount +=1;
  }
}


void loadImages(){
  board = loadImage("board.png");
  board.resize(800, 0);
  
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
  WhKing.resize(80, 0);
  
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
  BlKing.resize(80, 0);
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
          if (field.chessBoard[r][c].name.equals("King") && field.chessBoard[r][c].Color == 1){
            image(WhKing, c * 100, r * 100);
          }
          
          if (field.chessBoard[r][c].name.equals("Bishop") && field.chessBoard[r][c].Color == 0){
            image(BlBishop, c * 100, r * 100);
          }
          if (field.chessBoard[r][c].name.equals("Rook") && field.chessBoard[r][c].Color == 0){
            image(BlRook, c * 100, r * 100);
          }
          if (field.chessBoard[r][c].name.equals("Queen") && field.chessBoard[r][c].Color == 0){
            image(BlQueen, c * 100, r * 100);
          }
          if (field.chessBoard[r][c].name.equals("Knight") && field.chessBoard[r][c].Color == 0){
            image(BlKnight, c * 100, r * 100);
          }
          if (field.chessBoard[r][c].name.equals("Pawn") && field.chessBoard[r][c].Color == 0){
            image(BlPawn, c * 100, r * 100);
          }
          if (field.chessBoard[r][c].name.equals("King") && field.chessBoard[r][c].Color == 0){
            image(BlKing, c * 100, r * 100);
          }
          
      }
    }
  }
}
