addpath(genpath(fullfile(pwd)));

Dice = Dice();

for i = 1:10
    Dice.RollValue = Roll();
end

disp(Dice.GetRolledValue())
