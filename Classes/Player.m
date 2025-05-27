classdef Player < handle    
    properties
        Name
        Score
        IsPlaying
        IsDoneRolling
    end
    
    methods
        function player = Player(name)
            player.Score = 0;
            player.Name = name;
            player.IsPlaying = false;
            player.IsDoneRolling = false;
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

