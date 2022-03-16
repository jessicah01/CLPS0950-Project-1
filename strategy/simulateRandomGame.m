function win_loss = simulateRandomGame(column, boardState)
  %simulateGame Simulates a game randomly given a column
  %   Called by a few strategies

  simulated_player = 2; % We know that AI is always player 2
  simulated_boardState = boardState;
  simulated_gameState = GameState.CONTINUE;

  if column > 7
      column = 7;
  end
  if column < 1
      column = 1;
  end

  firstEmptySlot = findFirstEmptySlot(simulated_boardState, column);
  if firstEmptySlot == -1
      % if the slot is bad, just tell the AI that it lost because
      % the move is illegal. Only for the first iteration though
      win_loss = 0;
  else
      simulated_boardState(firstEmptySlot, column) = simulated_player;
      if simulated_player == 1
          simulated_player = 2;
      else
          simulated_player = 1;
      end
      simulated_gameState = checkBoardState(simulated_boardState);
      while simulated_gameState == GameState.CONTINUE
          % if the game is not over, we need to simulate a random
          % move
          simulated_column = randi(7);
          firstEmptySlot = findFirstEmptySlot(simulated_boardState, simulated_column);
          if firstEmptySlot == -1
              % if the slot is illegal, skip this iteration
              continue;
          else
              simulated_boardState(firstEmptySlot, simulated_column) = simulated_player;
              if simulated_player == 1
                  simulated_player = 2;
              else
                  simulated_player = 1;
              end
              simulated_gameState = checkBoardState(simulated_boardState);
          end
      end
      if simulated_gameState == GameState.PLAYER_1_WIN
          win_loss = 0;
      elseif simulated_gameState == GameState.PLAYER_2_WIN
          win_loss = 1;
      elseif simulated_gameState == GameState.DRAW
          win_loss = 0.5;
      else
          disp("Error: Game state not recognized");
      end
  end 
end