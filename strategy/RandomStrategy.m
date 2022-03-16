classdef RandomStrategy < Strategy
    properties
        name
    end
    
    methods
        
        function obj = RandomStrategy()
            obj.name = "random";
        end
        
        function column = move(~, ~)
            column = randi([1 7]);
        end
        
    end
end