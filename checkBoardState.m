function state = checkBoardState(boardState)
  % Returns the game state when passed in a board state (matrix)
  state = validation(boardState);
  % TODO: @Jenny Write logic to detect a draw, if a player wins, or if
  % the game should continue
  % Should set "state" to GameState.PLAYER_1_WIN, GameState.PLAYER_2_WIN,
  % GameState.DRAW, or GameState.CONTINUE
end

%Validation function takes in boardState matrix and return state
%(one of the GameState Enums)
function state = validation(boardState)

%define state initially as empty string
state = "";

%player 1 and 2 horizontal win matrix, also used to check for diags
p1winH = [1,1,1,1];
p2winH = [2,2,2,2];

%player 1 and 2 vertical win matrix
p1winV = [1;1;1;1];
p2winV = [2;2;2;2];

%checks if board is full yet validation function ran implying no winner
%thus draw
if ~ismember(0,boardState)
  state = GameState.DRAW;
  return;
end

%checks for horizontal win scenario, returns if win condition reached
for j = 1:4
  %sets checkBoardState as area of 6*4 rectangle
  checkBoardState = boardState(1:6,0+j:3+j);
  if all(ismember(p1winH,checkBoardState, 'rows'))
      state = GameState.PLAYER_1_WIN;
      return;
  elseif all(ismember(p2winH,checkBoardState, 'rows'))
      state = GameState.PLAYER_2_WIN;
      return;
  end
end

%checks for vertical win scenario, breaks loop if win condition reached
for i = 1:3
  for j = 1:7
      %sets checkBoardState as 1*4 column vector
      checkBoardState = boardState(0+i:3+i,j);
      if all(p1winV == checkBoardState)
          state = GameState.PLAYER_1_WIN;
          return;
      elseif all(p2winV == checkBoardState)
          state = GameState.PLAYER_2_WIN;
          return;
      end
  end
end

%checks for diagonal win scenario, breaks loop if win condition reached,
%else sets state to CONTINUE
for i = 1:3
  for j = 1:4
      %bottom to top diagonal (/)
      A = diag(boardState(0+i:3+i,0+j:3+j));
      %reshape from column to row vector
      check = reshape(A,1,4);
      %top to bottom diagonal (\)
      B = diag(flip(boardState(0+i:3+i,0+j:3+j)));
      %reshape from column to row vector
      flipCheck = reshape(B,1,4);
      %concatenate two 1*4 matricies into a single 2*4 matrix
      checkBoardState = [check;flipCheck];

      if ismember(p1winH,checkBoardState, 'rows')
          state = GameState.PLAYER_1_WIN;
          return;
      elseif ismember(p2winH,checkBoardState, 'rows')
          state = GameState.PLAYER_2_WIN;
          return;
      end
  end
end

%If state has not been set by above conditions, set state as CONTINUE
if state == ""
  state = GameState.CONTINUE;
end

end