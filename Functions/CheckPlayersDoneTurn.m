function allTurnsDone = CheckPlayersDoneTurn(players)
    playerStatus = [];
    for x = 1:length(players)
        playerStatus(x) = players(x).IsDoneRolling;
    end

    allTurnsDone = all(playerStatus);
end

