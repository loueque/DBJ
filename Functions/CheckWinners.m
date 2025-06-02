function winners = CheckWinners(playerValues, houseValue)
    winners = {};

    players = fieldnames(playerValues);
    for i = 1:length(players)
        playerName = players{i};
        playerValue = playerValues.(playerName);
        disp(playerName)
        disp(playerValue)
        if playerValue >= houseValue
            winners{end+1} = playerName;
        end
    end
end

