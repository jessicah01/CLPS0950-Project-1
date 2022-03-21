classdef GreedyMctsStrategy < Strategy
    % Monte Carlo Tree Search, implemented badly
    % Searches for the best possible moves by simulating X games for each
    % initial valid starting position and chooses the starting position
    % that had the most wins. Not a true MCTS implementation due to a lack
    % of defined tree structure.
    properties
        name
        fakeDelay
        lookForward
        message
    end
    
    methods
        
        function obj = GreedyMctsStrategy(lookForward)
            obj.name = "Greedy Monte Carlo Tree Search";
            obj.fakeDelay = 0;
            obj.lookForward = lookForward; %input('How far forward should MCTS search? Larger numbers = more difficult and longer computation time. Easy: 100, Medium: 250\n>> ');
            obj.message = [];
        end

        function [column, obj] = move(obj, boardState, ~)
            disp(obj.lookForward)
            % This function is called by the game engine to get the next
            % move.
            %
            % Input:
            %   boardState: The current board state.
            %
            % Output:
            %   column: The column where the next move should be played.
            %
            % You can use the MCTS class to find the best move.
            %
            % Example:
            %   MctsStrategy.move(boardState);
            %
            % See also: MCTS

            % Terrible implementation of Monte Carlo Tree Search.
            % For each possible (and legal) initial move, we simulate
            % X random games and count the number that won.
            
            obj.message = [];
            
            % We know that the AI is always Player 2

            wins_per_starting_move = zeros(1,7);
            
            for ii = 1:7
                winning_states = 0;
                if boardState(1, ii) == 0 % check if top piece is empty, or tell algorithm it lost
                    for jj = 1:obj.lookForward
                        winning_states = winning_states + simulateRandomGame(ii, boardState);
                    end
                end
                wins_per_starting_move(ii) = winning_states;
            end
            [~, column] = max(wins_per_starting_move);
            obj.message = wins_per_starting_move;
            disp("Monte Carlo chance of winning per cell:")
            disp(char(cellstr(num2str(round(obj.message(1,:)/obj.lookForward * 100, 2), '%4.2f%% '))));
            disp("Placing tile into slot " + num2str(column))
            fprintf('\n')
        end
    end
end