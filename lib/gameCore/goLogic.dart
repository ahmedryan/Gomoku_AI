import 'package:go_game/boardstate.dart';

class GoLogic{

  int rows = 10, coloumns = 10;

  bool fiveInA_row(int player){

    BoardState board = new BoardState();
    List<List<int>> currentBoard = board.getBoard();
    int stones=0;

    for(int i = 0; i < rows; i++)
      for(int j=0; j <= coloumns-5; j++){

        if(currentBoard[i][j] == player){
          stones+= 1;
          for(int k =1; k<5; k++){
            if(currentBoard[i][++j] == player) {
              stones += 1;
            }
            else
              break;
          }
          if(stones == 5)
            return true;
          else
            continue;
          stones = 0;
        }
      }

    return false;
  }

  bool fiveInA_column(int player){

    BoardState board = new BoardState();

    List<List<int>> currentBoard = board.getBoard();
    int stones=0;

    for(int i = 0; i < coloumns; i++)
      for(int j=0; j <= rows-5; j++){

        if(currentBoard[i][j] == player){
          stones+= 1;
          for(int k =1; k<5; k++){
            if(currentBoard[i][++j] == player) {
              stones += 1;
            }
            else
              break;
          }
          if(stones == 5)
            return true;
          else
            continue;
          stones = 0;
        }
      }
    return false;
  }

  bool fiveInA_leftDiagonal(int player){

    BoardState board = new BoardState();

    List<List<int>> currentBoard = board.getBoard();
    int stones=0;

    for(int i = 0; i <= rows-5; i++)
      for(int j=0; j <= coloumns-5; j++){

        if(currentBoard[i][j+4] == player){
          stones+= 1;
          for(int k =1; k<5; k++){
            if(currentBoard[i+1][j-k+4] == player) {
              stones += 1;
            }
            else
              break;
          }
          if(stones == 5)
            return true;
          else
            continue;
          stones = 0;
        }
      }
    return false;
  }
  bool fiveInA_RightDiagonal(int player){

    BoardState board = new BoardState();

    List<List<int>> currentBoard = board.getBoard();
    int stones=0;

    for(int i = 0; i <= rows-5; i++)
      for(int j=0; j <= coloumns-5; j++){

        if(currentBoard[i][j] == player){
          stones+= 1;
          for(int k =1; k<5; k++){
            if(currentBoard[i+1][j+1] == player) {
              stones += 1;
            }
            else
              break;
          }
          if(stones == 5)
            return true;
          else
            continue;
          stones = 0;
        }
      }
    return false;
  }

  bool findTwoOpenEndInRow(int stones, int playerStone){

    for(int i=0;i<rows;i++){
      for(int r= 0; r < rows-stones-1; r++){

        if(BoardState.board[i][r]==null && BoardState.board[i][r+stones+1]==null){
          bool pattern = true;
          for(int k= r+1; k <= r+stones; k++){
            if(BoardState.board[i][k] != playerStone){
              pattern = false;
              break;
            }
          }
          if(pattern)
            return true;
        }
      }
    }
   return false;
  }

  bool findOneOpenEndInRow(int stones, int playerStone){

    for(int r=0; r < rows; r++){
      for(int sp=0; sp < rows-stones; sp++){

        if(BoardState.board[r][sp] == null){
          bool pattern = true;
            for(int k= sp + 1; k <= sp + stones; sp++){
                if(BoardState.board[r][sp] != playerStone){
                  pattern = false;
                  break;
                }
            }
            if(pattern)
              return true;
        }
      }
      if(BoardState.board[r][rows-1] == null){
        bool pattern = true;
        for(int bs= rows-2; bs>=rows-stones-1; bs--){
            if(BoardState.board[r][bs] != playerStone){
              pattern = false;
              break;
            }
        }
        if(pattern)
          return true;
      }
    }
    return false;
  }
}