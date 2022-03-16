classdef (Abstract) Strategy
    %Strategy Superclass for all strategies
    %   Defines base methods of a strategy
    
    properties (Abstract)
        name
    end
    
    methods (Abstract)
        obj = move(obj)
    end
end

