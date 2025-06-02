classdef Dice < handle
    % Dice class, rolls a random dice based off 21, goes through permutaitonal loops from 1-6, with only one function rolling and setting RollValue to that, and fetching the RollValue using GetRoll
    % JEREMY WAS HERE!
    properties (Access = public)
        Score = 0;
        Points = 0;
        RolledValue = 0;
        Name = "";
    end
    
    methods
        function die = UpdateScore(die, roll)
            die.Score = die.Score + roll;
        end

        function die = Roll(die)
            die.Score = randi([2,14]);  % The houses First roll
            if ismember(die.Score, [10,12,13,14])
                die.Score = 10;
            elseif die.Score == 11
                die.Score = 11;
            end
        end

        function die = PlayEnd(die)
            while die.Score < 17
                roll = randi([2,14]);
                if ismember(roll, [10,12,13,14])
                    roll = 10;
                elseif roll == 11
                    % Basic strategy for house: use 11 if it won’t cause a bust
                    if die.Score + 11 > 21
                        roll = 1;
                    else
                        roll = 11;
                    end
                end

                die = die.UpdateScore(roll);
                fprintf('House rolled a %d. Total is now %d.\n', roll, die.Score);
            end
        end
    end
end

