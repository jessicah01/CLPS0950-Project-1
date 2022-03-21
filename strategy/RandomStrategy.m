classdef RandomStrategy < Strategy
    properties
        name
        fakeDelay
    end
    
    methods
        
        function obj = RandomStrategy(~)
            obj.name = "random";
            obj.fakeDelay = 2;
        end
        
        function column = move(~, ~, ~)
            column = randi([1 7]);
        end
        
    end
end