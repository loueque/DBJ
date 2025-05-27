function [players] = StartPlayers(players_)
    players = table();
    
    for i = 1:height(players_)
        p = players_.Player{i};
        p.IsPlaying = true;
        players = [players; players_(i,:)];
    end
end

