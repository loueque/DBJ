addpath(genpath(fullfile(pwd)));

CHANNEL_ID = 2977598;
WRITE_API_KEY = "";
READ_API_KEY = "";

Dice = Dice();

for i = 1:10
    % Dice.RollValue = Roll();
end

disp("Hi")
disp("CAN YOU SEE THIS")

function new = Diff(inputs)
    new = 2 .* inputs;
end

disp(Dice.GetRolledValue())
