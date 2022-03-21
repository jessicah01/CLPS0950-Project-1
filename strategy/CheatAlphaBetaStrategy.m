classdef CheatAlphaBetaStrategy < Strategy
    properties
        name
        fakeDelay
    end
    
    methods
        
        function obj = CheatAlphaBetaStrategy(~)
            obj.name = "Impossible - Alpha Beta Pruning";
            obj.fakeDelay = 2;
        end
        
        function [column, obj] = move(obj, boardState, BoardClass)
            %[~, column] = max(webread("https://connect4.gamesolver.org/solve?pos=343434").score.');
            webread(["http://kevinalbs.com/connect4/back-end/index.php/getMoves?board_data=" reshape(boardState.', 1, []) "&player="])
        end
        
    end
end