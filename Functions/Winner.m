function winnerName = Winner(players, pointsToWin)
    winnerName = '';
    for i = 1:length(players)
        points = players(i).Points;
        if players(i).Points >= pointsToWin
            winnerName = players(i).Name;
            return;
        end
    end
end

