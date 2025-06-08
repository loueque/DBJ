function winnerName = Winner(players, pointsToWin, house)
    winnerName = '';
    % Check players first
    for i = 1:length(players)
        if players(i).Points >= pointsToWin
            winnerName = players(i).Name;
            return;
        end
    end
    % Then check house
    if house.Points >= pointsToWin
        winnerName = house.Name; 
    end
end

