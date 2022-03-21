classdef GameTutorial
    %GAMETUTORIAL The tutorial class teaches the user about the rules of the
    %game and winning condition, interactive choices to test how to win

    properties
        complete
    end

    methods

        function obj = GameTutorial(name)
            %GAMETUTORIAL Construct an instance of this class
            %   goes through the game tutorial steps and examples
            obj.complete = false;

            while obj.complete == false
                disp(strcat("Welcome to Connect 4 Tutorial ", name, "!"));
                fprintf('\n');
                pause(2);
                disp("In this tutorial we will go over the basics of how to play Connect 4!");
                fprintf('\n');
                pause(3);
                disp("We will do this by playing through different scenarios together");
                fprintf('\n')
                pause(3)
                disp("Connect 4 gameboards have dimensions of 6 x 7");
                fprintf('\n')
                pause(1)
                imshow('IMG_0543.PNG');
                pause(4);
                disp("To win in Connect Four you must connect 4 pieces horizontally...");
                fprintf('\n')
                pause(3)
                %make scenario in UI
                disp("vertically...");
                fprintf('\n')
                pause(3)
                %make scenario in UI
                disp("or diagonally!");
                fprintf('\n')
                pause(3)
                %make scenario in UI
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
                choice = input("In this scenario, which colour should Yellow play to win? \n>>");
                if choice == 4
                    disp("That's correct! This would be a classic example of a horizontal win.")
                elseif choice < 1 || choice > 7
                    disp("You can only choose a column between 1 and 7! To win Yellow should play column 4")
                else
                    disp("Whoops! To win, Yellow should play column 4, that way there will be a Yellow horizontal win!")
                end
                pause(3)
                choice = input("In this scenario, which colour should Red play to win? \n>>");
                if choice == 1
                    disp("That's correct! This would be a classic example of a vertical win.")
                elseif choice < 1 || choice > 7
                    disp("You can only choose a column between 1 and 7! To win Red should play column 1")
                else
                    disp("Whoops! To win, Red should play column 1, that way there will be a red vertical win!")
                end
                pause(3)
                choice = input("In this scenario, which colour should Yellow play to win? \n>>");
                if choice == 6
                    disp("That's correct! This would be a classic example of a diagonal win.")
                elseif choice < 1 || choice > 7
                    disp("You can only choose a column between 1 and 7! To win Yellow should play column 6")
                else
                    disp("Whoops! To win, Yellow should play column 6, that way there will be a Yellow diagonal win!")
                end
                pause(3)
                disp("The game ends when either play connects four!");
                fprintf('\n')
                pause(3)
                disp("In this game, you will have the choice to play with a friend or against computer");
                fprintf('\n')
                pause(3)
                disp("For our computer modes, there will be medium and hard");
                fprintf('\n')
                pause(3)
                disp("For both playing against computer or friend, you will be able to choose which player begins the game");
                fprintf('\n')
                pause(3)
                disp("If you don't choose the default will be Red first!");
                fprintf('\n')
                pause(3)
                disp("Now that you have the basics down...");
                fprintf('\n')
                pause(2)
                ready = input('Are you ready to play? y/n\n>> ', 's') == 'y';
                if ready
                    obj.complete = true;
                end
            end
        end
    end
end
