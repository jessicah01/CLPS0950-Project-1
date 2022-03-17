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

[rows, cols] = size(boardState);

%player 1 and 2 horizontal win matrix, also used to check for diags
p1winH = [1,1,1,1];
p2winH = [2,2,2,2];

%player 1 and 2 vertical win matrix
p1winV = [1;1;1;1];
p2winV = [2;2;2;2];

%checks if board is full yet validation function ran implying no winner
%thus draw
if all(boardState(:) ~= 0)
  state = GameState.DRAW;
  return;
end

%checks for horizontal win scenario, returns if win condition reached
% Isaac - rewriting this to increase the speed of execution. MCTS takes
% forever to execute due to board state validation taking too long
% Main function taking time, according to profiler, is ismember - so I
% reduced dependence on that function as much as possible
for row = 1:rows
    count = 1;
    prev = 0;
    for col = 1:cols
        if boardState(row, col) == prev && boardState(row, col) ~= 0
            count = count + 1;
        else
            count = 1;
            prev = boardState(row, col);
        end
        if count >= 4
            if prev == 1
                state = GameState.PLAYER_1_WIN;
            elseif prev == 2
                state = GameState.PLAYER_2_WIN;
            else
                disp('Error - Invalid State')
            end
            return;
        end
    end
    if state ~= ""
        return;
    end
end

%checks for vertical win scenario, breaks loop if win condition reached
for i = 1:3
  for j = 1:7
      %sets checkBoardState as 1*4 column vector
      checkBoardState = boardState(0+i:3+i,j);
      if isequal(p1winV, checkBoardState)
          state = GameState.PLAYER_1_WIN;
          return;
      elseif isequal(p2winV, checkBoardState)
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
      %top to bottom diagonal (\)
      B = diag(flip(boardState(0+i:3+i,0+j:3+j)));

      if isequal(A, p1winV) || isequal(B, p1winV)
          state = GameState.PLAYER_1_WIN;
          return;
      elseif isequal(A, p2winV) || isequal(B, p2winV)
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