classdef Dice
    % Dice class, rolls a random dice based off 21, goes through
    % permutaitonal loops from 1-6, with only one function rolling and
    % setting RollValue to that, and fetching the RollValue using GetRoll

    properties
        RollValue
        Score
        HasRolled
    end
    
    methods
        function obj = Dice()
            %DICE Construct an instance of this class
            %   Detailed explanation goes here
            obj.RollValue = 0;
            obj.Score = 0;
        end

        function rollValue = GetRolledValue(obj)
            rollValue = obj.RollValue;
        end
    end
end

