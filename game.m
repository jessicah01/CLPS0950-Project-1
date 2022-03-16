function game()
    quit = false;
    while ~quit
        clc
        fprintf('Connect 4 - MATLAB Edition\nCreated by Isaac Kim, Jessica Hong, and Jenny Wang\n');
        againstComputer = input('Would you like to play against the computer? y/n\n>> ', 's') == 'y';

        % Save board class as gameBoard
        GameBoard = Board(input('Which player should start first, 1 or 2? If playing against the computer, it is player 2. Default: Random\n>> '), againstComputer);
        while GameBoard.gameState == GameState.CONTINUE
            clc
            disp(strcat("Turn ", num2str(GameBoard.turn),": It is currently Player ", num2str(GameBoard.player), "'s turn"))
            if ~isempty(GameBoard.message)
                disp(GameBoard.message);
            else
                fprintf('\n');
            end
            disp(GameBoard.boardState);
            if againstComputer && GameBoard.player == 2
                disp("The computer is thinking...")
                pause(2)
                GameBoard = GameBoard.updateGame(GameBoard.ai.strategy.move(GameBoard.boardState));
            else
                GameBoard = GameBoard.updateGame(input('What column do you want to drop a piece into? 1-7\n>> '));
            end  
        end
        clc
        disp(strcat("Turn ", num2str(GameBoard.turn), ": ", GameBoard.gameState.text))
        fprintf('\n');
        disp(GameBoard.boardState);
        if input('Would you like to play again? y/n\n>> ', 's') == 'n'
            quit = true;
        end
    end
    disp('Thanks for playing - goodbye!');
end
