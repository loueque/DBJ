function rolled = Roll()
    % Will roll up to 4-8 times (randomized), and returns a value between 1
    % and 6.

    rolled = ceil(randi([1, 6]));
end

