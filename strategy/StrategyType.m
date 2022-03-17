classdef StrategyType
    %GameState Enum of game state values
    %   Enum of game state values
    properties
        strategy
    end
    methods
      function obj = StrategyType(strat)
         obj.strategy = strat;
      end
    end
    enumeration
        RANDOM (RandomStrategy)
        MCTS (GreedyMctsStrategy)
    end
end

