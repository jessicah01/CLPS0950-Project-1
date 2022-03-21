function game()
    % Function to run text-base graphical interface for testing
    % Add strategies to path
    addpath(genpath("strategy"));
    addpath(genpath("tutorial"));
    % Yes - the "all" is required or it gives us issues
    clear all;
    quit = false;
    while ~quit
        clc
        fprintf('Connect 4 - MATLAB Edition\nCreated by Isaac Kim, Jessica Hong, and Jenny Wang\n');
        tutor = input('Would you like to go through the tutorial? y/n\n>> ', 's') == 'y';
       
        
        if tutor
            completed = false;
            while ~completed
            Tutorial = GameTutorial(input('What is your name? \n>> ', 's'));
            completed = Tutorial.complete;
            end
        end

        againstComputer = input('Would you like to play against the computer? y/n\n>> ', 's') == 'y';

        if againstComputer
            aiType = StrategyType(input('What strategy should the computer use? random/mcts\n>> ', 's'));
        else
            aiType = [];
        end

       
        % Save board class as gameBoard
        GameBoard = Board(input('Which player should start first, 1 or 2? If playing against the computer, it is player 2. Default: Random\n>> '), aiType);
        while GameBoard.gameState == GameState.CONTINUE
            %clc
            disp(strcat("Turn ", num2str(GameBoard.turn),": It is currently Player ", num2str(GameBoard.player), "'s turn"))
            if ~isempty(GameBoard.message)
                disp(GameBoard.message);
            else
                fprintf('\n');
            end
            chars = '_XO';
            disp(chars(GameBoard.boardState + 1))
            if againstComputer && GameBoard.player == 2
                disp("The computer is thinking...")
                pause(GameBoard.ai.strategy.fakeDelay)
                GameBoard = GameBoard.updateGame(GameBoard.ai.strategy.move(GameBoard.boardState, GameBoard));
            else
                GameBoard = GameBoard.updateGame(input('What column do you want to drop a piece into? 1-7\n>> '));
            end  
        end
        %clc
        disp(strcat("Turn ", num2str(GameBoard.turn), ": ", GameBoard.gameState.text))
        fprintf('\n');
        disp(chars(GameBoard.boardState + 1));
        if input('Would you like to play again? y/n\n>> ', 's') == 'n'
            quit = true;
        end
    end
    disp('Thanks for playing - goodbye!');
end
