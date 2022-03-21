classdef StrategyType
    %StrategyType Enum of strategy type values
    %   Enum of strategy type values
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
        MCTS (GreedyMctsStrategy(100))
        MCTS_EASY (GreedyMctsStrategy(25))
        MCTS_MEDIUM (GreedyMctsStrategy(100))
        MCTS_HARD (GreedyMctsStrategy(250))
        ALPHABETA (CheatAlphaBetaStrategy)
    end
end

