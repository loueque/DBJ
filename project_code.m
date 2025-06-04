clear;

% Ask how many players will play
num = input('How many players will play? (1 or 2)');

% Call function to get players
% players = get_players(num);

% Ask for points to win
points_to_win = input('First to How Many Points Wins? ', 's');

fprintf('The game will be played to %s points!\n', points_to_win);

% --- Local function below ---

playerNames = {};
for i = 1:num
    prompt = sprintf('Player %d, enter name: ', i);
    playerNames{end+1} = input(prompt, "s");
end

players(1, length(playerNames)) = Player();
for i = 1:length(playerNames)
    players(i) = Player(playerNames{i});
end

DiceDealer = Dice();
DiceDealer.Score = 0;
DiceDealer.Name = "House";

% --- First roll for players ---

num = length(players);  % number of players

for x = 1:2
    for i = 1:num
        prompt = sprintf('%s, press Enter to roll the dice...', players(i).Name);
        input(prompt, 's');  % wait for Enter

        roll = randi([2,14]);  % roll dice from 1 to 11
        if ismember(roll, [10,12,13,14])
            roll = 10;
        end

        fprintf('%s rolled a %d!\n', players(i).Name, roll);


        if roll == 11
            isValid = false;
            fprintf('%s, choose if you want your roll to be 1 or 11.\n', players(i).Name)
            while isValid == false
                roll = input('Enter your choice (1 or 11): ');
                if ismember(roll, [1, 11])
                    fprintf('Your roll is %d\n', roll)
                    isValid = true;
                else
                    fprintf('Please enter a valid number (1 or 11) ')
                end
            end
        end
        players(i).UpdateScore(roll)
    end

    DiceDealer.Roll();
    fprintf('House rolled a %d!\n', DiceDealer.Score);
end

disp(CheckPlayersDoneTurn(players))
while CheckPlayersDoneTurn(players) ~= true
    for i = 1:num
        while true
            fprintf('%s, your current total is %d.\n', players(i).Name, players(i).Score);

            % Ask if they want to roll again
            choice = input('Do you want to roll again? (y/n): ', 's');

            if strcmpi(choice, 'n')
                fprintf('%s has chosen to stand with %d as their total sum.\n', players(i).Name, players(i).Score);
                players(i).IsDoneRolling = 1;  % You can use this flag later
                break;
            end

            % Roll the dice
            roll = randi([2,14]);
            if ismember(roll, [10,12,13,14])
                roll = 10;
            elseif roll == 11
                isValid = false;
                fprintf('%s, choose if you want your roll to be 1 or 11.\n', players(i).Name);
                while ~isValid
                    roll = input('Enter your choice (1 or 11): ');
                    if ismember(roll, [1, 11])
                        isValid = true;
                    else
                        fprintf('Please enter a valid number (1 or 11)\n');
                    end
                end
            end

            fprintf('%s rolled a %d!\n', players(i).Name, roll);
            players(i).UpdateScore(roll)

            % Check for bust
            if players(i).Score > 21
                fprintf('%s busted with a total of %d!\n', players(i).Name, players(i).Score);
                players(i).FinalScore = 0;  % Optional: store final result
                players(i).IsDoneRolling = 1;
                break;
            end
        end
    end
end

DiceDealer.PlayEnd();

% Final outcome
if DiceDealer.Score > 21
    fprintf('House busted with a total of %d!\n', DiceDealer.Score);
else
    fprintf('House stands with a total of %d.\n', DiceDealer.Score);
end