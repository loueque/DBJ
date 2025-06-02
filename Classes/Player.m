classdef Player < handle    
    properties
        Name
        Score
        FinalScore
        Points
        IsPlaying
        IsDoneRolling
    end
    
    methods
        function player = Player(name)
            if nargin > 0
                player.Score = 0;
                player.Name = name;
                player.Points = 0;
                player.IsPlaying = false;
                player.IsDoneRolling = false;
            end
        end
        
        function playerScore = GetPlayerScore(player)
            playerScore = player.Score;
        end

        function player = UpdateScore(player, f)
            player.Score = player.Score + f;
        end

        function player = FinishTheRoll(player)
            player.IsDoneRolling = true;
        end
    end
end

