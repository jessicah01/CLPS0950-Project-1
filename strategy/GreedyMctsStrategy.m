classdef GreedyMctsStrategy < Strategy
    properties
        name
        fakeDelay
        lookForward
    end
    
    methods
        
        function obj = GreedyMctsStrategy()
            obj.name = "Greedy Monte Carlo Tree Search";
            obj.fakeDelay = 0;
            obj.lookForward = input('How far forward should MCTS search? Larger numbers = more difficult and longer computation time. Easy: 100, Medium: 250\n>> ');
        end

        function column = move(obj, boardState)
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
        end
        
    end
end