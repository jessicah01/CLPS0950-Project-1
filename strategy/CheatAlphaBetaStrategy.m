classdef CheatAlphaBetaStrategy < Strategy
    % Computer literally cheating - solved via alpha beta pruning.
    % Hits GameSolver API - we did not code this ourselves!
    % Therefore, requires internet connection + GameSolver site to be
    % online
    properties
        name
        fakeDelay
    end
    
    methods
        
        function obj = CheatAlphaBetaStrategy(~)
            obj.name = "Impossible - Alpha Beta Pruning";
            obj.fakeDelay = 2;
        end
        
        function [column, obj] = move(obj, BoardClass)
            scores = webread(['https://connect4.gamesolver.org/solve?pos=' char(BoardClass.history)]).score.';
            scores(scores == 100) = -100;
            [~, column] = max(scores);
        end
        
    end
end