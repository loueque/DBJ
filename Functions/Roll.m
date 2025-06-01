function rolled = Roll(playerNum, key)
    % Will roll up to 4-8 times (randomized), and returns a value between 1
    % and 6.

    rolled = ceil(randi([1, 6]));
    pause(3);
    baseUrl = 'https://api.thingspeak.com/update';
    data = sprintf('api_key=%s&field%d=%d', key, playerNum, rolled);

    pause(1);
    response = webwrite(baseUrl, data);
end

