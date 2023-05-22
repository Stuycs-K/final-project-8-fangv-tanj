
PImage board;
int turnCount;

void setup(){
  size(900, 785);
  board = loadImage("board.png");
  turnCount = 1;
}

void draw(){
  image(board, 0, 0);
}

void mouseClicked(){
}
