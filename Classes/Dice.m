classdef Dice < handle
    % Dice class, rolls a random dice based off 21, goes through
    % permutaitonal loops from 1-6, with only one function rolling and
    % setting RollValue to that, and fetching the RollValue using GetRoll
    % JEREMY WAS HERE!
    properties (Access = protected)
        RollValue
        Score
        HasRolled
    end
    
    methods
        function die = Dice()
            %DICE Construct an instance of this class
            %   Detailed explanation goes here

            die.RollValue = 0;
            die.Score = 0;
        end

        function die = RollDice()
            die.RollValue = Roll();
            die.Score = die.Score + die.RollValue;
        end

        function rollValue = GetRolledValue(die)
            rollValue = die.RollValue;
        end
    end
end

