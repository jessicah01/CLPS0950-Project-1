classdef GameState
    %GameState Enum of game state values
    %   Enum of game state values
    properties
        text
    end
    methods
      function obj = GameState(text)
         obj.text = text;
      end
    end
    enumeration
        PLAYER_1_WIN ("Player 1 wins!")
        PLAYER_2_WIN ("Player 2 wins!")
        DRAW ("This game is a draw!")
        CONTINUE ("Continue...")
    end
end

