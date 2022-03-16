classdef Board
    %Board Stores gamestate
    %   Stores gamestate
    
    properties
        ai
        boardState
        gameState
        history
        message
        player
        turn
    end
    
    methods
        
        function obj = Board(playerThatStarts, againstComputer)
            %Board Construct an instance of Board
            %   Creates an empty board - intakes int 1 or int 2 or nothing
            
            % Randomly set whether player 1 or player 2 goes first if it is
            % not specified
            disp(playerThatStarts)
            if ~exist('playerThatStarts', 'var') || isempty(playerThatStarts)
                playerThatStarts = randi([1 2]);
            end
            if againstComputer
                obj.ai = StrategyType(input('What strategy should the computer use? random\n>> ', 's'));
            else
                obj.ai = [];
            end
            obj.player = playerThatStarts;
            obj.boardState = zeros(6, 7);
            obj.turn = 1;
            obj.gameState = GameState.CONTINUE;
        end
        
        function obj = updateGame(obj, column)
            %updateGame Called to drop a piece into a column
            %   Called to drop a piece into a column
            obj.message = [];
            if ~exist('column', 'var') || isempty(column)
                obj.message = "Invalid input - you didn't type anything. Please try again.";
                return;
            end
            %% FOR DEBUGGING PURPOSES
            % If you enter 8, make player 1 win, if you enter 9, make
            % player 2 win, and if you enter 10, make player 3 win. After
            % everything is implemented, delete the section labeled as the
            % debugging block and it'll just reject output higher than 7
            if column > 7
                obj.message = 'Invalid input - the range of acceptable values is 1-7. Please try again.';
                % == START DEBUGGING BLOCK ==
                if column == 8
                    obj.turn = obj.turn + 1;
                    obj.gameState = GameState.PLAYER_1_WIN;
                elseif column == 9
                    obj.turn = obj.turn + 1;
                    obj.gameState = GameState.PLAYER_2_WIN;
                elseif column == 10
                    obj.turn = obj.turn + 1;
                    obj.gameState = GameState.DRAW;
                end
                % == END DEBUGGING BLOCK ==
                return;
            end
            %%
            firstEmptySlot = findFirstEmptySlot(obj.boardState, column);
            if firstEmptySlot == -1
                obj.message = 'Invalid input - that column is full. Please choose another column.';
            else
                obj.boardState(firstEmptySlot, column) = obj.player;
                obj.turn = obj.turn + 1;
                if obj.player == 1
                    obj.player = 2;
                else
                    obj.player = 1;
                end
                obj.gameState = checkBoardState(obj.boardState);
            end 
        end
        
    end
end

function slot = findFirstEmptySlot(boardState, columnNum)
    slot = -1;
    for ii = 6:-1:1
        if ~boardState(ii, columnNum)
            slot = ii;
            break
        end
    end
end

function state = checkBoardState(boardState)
    % Returns the game state when passed in a board state (matrix)
    state = validation(boardState);
    % TODO: @Jenny Write logic to detect a draw, if a player wins, or if
    % the game should continue
    % Should set "state" to GameState.PLAYER_1_WIN, GameState.PLAYER_2_WIN,
    % GameState.DRAW, or GameState.CONTINUE
end

%Validation function takes in boardState matrix and return state
%(one of the GameState Enums)
function state = validation(boardState)

%define state initially as empty string
state = "";

%player 1 and 2 horizontal win matrix, also used to check for diags
p1winH = [1,1,1,1];
p2winH = [2,2,2,2];

%player 1 and 2 vertical win matrix
p1winV = [1;1;1;1];
p2winV = [2;2;2;2];

%checks if board is full yet validation function ran implying no winner
%thus draw
if ~ismember(0,boardState)
    state = GameState.DRAW;
    return;
end

%checks for horizontal win scenario, returns if win condition reached
for j = 1:4
    %sets checkBoardState as area of 6*4 rectangle
    checkBoardState = boardState(1:6,0+j:3+j);
    if all(ismember(p1winH,checkBoardState, 'rows'))
        state = GameState.PLAYER_1_WIN;
        return;
    elseif all(ismember(p2winH,checkBoardState, 'rows'))
        state = GameState.PLAYER_2_WIN;
        return;
    end
end

%checks for vertical win scenario, breaks loop if win condition reached
for i = 1:3
    for j = 1:7
        %sets checkBoardState as 1*4 column vector
        checkBoardState = boardState(0+i:3+i,j);
        if all(p1winV == checkBoardState)
            state = GameState.PLAYER_1_WIN;
            return;
        elseif all(p2winV == checkBoardState)
            state = GameState.PLAYER_2_WIN;
            return;
        end
    end
end

%checks for diagonal win scenario, breaks loop if win condition reached,
%else sets state to CONTINUE
for i = 1:3
    for j = 1:4
        %bottom to top diagonal (/)
        A = diag(boardState(0+i:3+i,0+j:3+j));
        %reshape from column to row vector
        check = reshape(A,1,4);
        %top to bottom diagonal (\)
        B = diag(flip(boardState(0+i:3+i,0+j:3+j)));
        %reshape from column to row vector
        flipCheck = reshape(B,1,4);
        %concatenate two 1*4 matricies into a single 2*4 matrix
        checkBoardState = [check;flipCheck];

        if ismember(p1winH,checkBoardState, 'rows')
            state = GameState.PLAYER_1_WIN;
            return;
        elseif ismember(p2winH,checkBoardState, 'rows')
            state = GameState.PLAYER_2_WIN;
            return;
        end
    end
end

%If state has not been set by above conditions, set state as CONTINUE
if state == ""
    state = GameState.CONTINUE;
end

end