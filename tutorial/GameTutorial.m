classdef GameTutorial
    %GAMETUTORIAL The tutorial class teaches the user about the rules of the
    %game and winning conditions by showing automatically generated winning
    %conditions with AI games
    
    properties
        complete
        user
    end
    
    methods

        function obj = GameTutorial(name)
            %TUTORIAL Construct an instance of this class
            %   Detailed explanation goes here
            obj.complete = false;
            
            while obj.complete == false
            disp(strcat("Welcome to Connect 4 Tutorial ", name, " !"));
            fprintf('\n');
            pause(2);
            disp("In this tutorial we will go over the basics of how to play Connect 4!");
            fprintf('\n');
            pause(3);
            disp("We will do this by playing through different scenarios together");
            fprintf('\n')
            pause(3)
            disp("All examples of games shown are real examples of our AI playing against eachother!");
            fprintf('\n')
            pause(3)
            disp("Connect 4 gameboards have dimensions of 6 x 7");
            fprintf('\n')
            pause(1)
            imshow('IMG_0543.PNG');
            pause(2)
            disp("To win in Connect for you must connect 4 pieces horizontally...");
            fprintf('\n')
            pause(3)
            %ask jessica for UI photo or Isaac for simulated game
            disp("vertically...");
            fprintf('\n')
            pause(3)
            %ask jessica for UI photo or Isaac for simulated game
            disp("or diagonally!");
            fprintf('\n')
            pause(3)
            %ask jessica for UI photo or Isaac for simulated game
            disp("Now, let's watch how a real match works");
            fprintf('\n')
            pause(3)
            disp("There are two players in Connect Four, represented by Yellow and Red");
            fprintf('\n')
            pause(3)
            disp("Each player takes turns to choose a column...");
            fprintf('\n')
            pause(3)
            disp("The piece falls down from the top until it reaches" + ...
                " the bottom or the lowest piece in the column");
            fprintf('\n')
            pause(3)
            disp("You cannot move pieces once they have been played!");
            fprintf('\n')
            pause(3)
            disp("If the entire board has been filled and neither player" + ...
                " has a Connect 4, then the game is a Draw!");
            fprintf('\n')
            pause(3)
            ready = input('Are your ready to play? y/n\n>> ', 's') == 'y';
            if ready
                obj.complete = true;
            end
            end
            
        end
        
           

    end
end

