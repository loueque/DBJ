function players = StartPlayers(players)
    % players = [...] < handle
    % Sets IsPlaying = true for each Player in a Player array

    for i = 1:length(players)
        players(i).IsPlaying = true;
    end
end

