PImage board;

void setup(){
  size(900, 785);
  board = loadImage("board.png");
}

void draw(){
  image(board, 0, 0);
}
