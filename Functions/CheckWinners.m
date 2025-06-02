function winners = CheckWinners(playerValues, houseValue)
    winners = [];

    players = fieldnames(playerValues);
    for i = 1:length(players)
        playerName = players{i};
        playerValue = playerValues.(playerName);
        if playerValue >= houseValue
            winners(end) = i;
        end
    end
end

