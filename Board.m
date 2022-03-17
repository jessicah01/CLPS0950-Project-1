classdef Board
    %Board Stores gamestate
    %   Stores gamestate
    
    properties
        ai
        boardState
        gameState
        history
        message
        player
        turn
    end
    
    methods
        
        function obj = Board(playerThatStarts, againstComputer)
            %Board Construct an instance of Board
            %   Creates an empty board - intakes int 1 or int 2 or nothing
            
            % Randomly set whether player 1 or player 2 goes first if it is
            % not specified
            disp(playerThatStarts)
            if ~exist('playerThatStarts', 'var') || isempty(playerThatStarts)
                playerThatStarts = randi([1 2]);
            end
            if againstComputer
                obj.ai = StrategyType(input('What strategy should the computer use? random/mcts\n>> ', 's'));
            else
                obj.ai = [];
            end
            obj.player = playerThatStarts;
            obj.boardState = zeros(6, 7);
            obj.turn = 1;
            obj.gameState = GameState.CONTINUE;
        end
        
        function obj = updateGame(obj, column)
            %updateGame Called to drop a piece into a column
            %   Called to drop a piece into a column
            obj.message = [];
            if ~exist('column', 'var') || isempty(column)
                obj.message = "Invalid input - you didn't type anything. Please try again.";
                return;
            end
            %% FOR DEBUGGING PURPOSES
            % If you enter 8, make player 1 win, if you enter 9, make
            % player 2 win, and if you enter 10, make player 3 win. After
            % everything is implemented, delete the section labeled as the
            % debugging block and it'll just reject output higher than 7
            if column > 7
                obj.message = 'Invalid input - the range of acceptable values is 1-7. Please try again.';
                % == START DEBUGGING BLOCK ==
                if column == 8
                    obj.turn = obj.turn + 1;
                    obj.gameState = GameState.PLAYER_1_WIN;
                elseif column == 9
                    obj.turn = obj.turn + 1;
                    obj.gameState = GameState.PLAYER_2_WIN;
                elseif column == 10
                    obj.turn = obj.turn + 1;
                    obj.gameState = GameState.DRAW;
                end
                % == END DEBUGGING BLOCK ==
                return;
            end
            %%
            firstEmptySlot = findFirstEmptySlot(obj.boardState, column);
            if firstEmptySlot == -1
                obj.message = 'Invalid input - that column is full. Please choose another column.';
            else
                obj.boardState(firstEmptySlot, column) = obj.player;
                obj.turn = obj.turn + 1;
                if obj.player == 1
                    obj.player = 2;
                else
                    obj.player = 1;
                end
                obj.gameState = checkBoardState(obj.boardState);
            end 
        end
    end
end