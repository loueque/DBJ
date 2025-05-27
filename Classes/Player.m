classdef Player    
    properties
        Name
        Score
        IsPlaying
        IsDoneRolling
    end
    
    methods
        function player = Player(name)
            %PLAYER Construct an instance of this class
            %   Detailed explanation goes here
            player.Score = 0;
            player.Name = name;
            player.IsPlaying = true;
            player.IsDoneRolling = false;
        end
        
        function playerScore = GetPlayerScore(player)
            playerScore = player.Score;
        end

        function UpdateScore(player, f)
            player.Score = player.Score + f
        end

        function FinishTheRoll(player)
            player.IsDoneRolling = true;
        end
    end
end

