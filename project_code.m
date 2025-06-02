clear;

% Ask how many players will play
num = input('How many players will play? (1 or 2)');

% Call function to get players
players = get_players(num);

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
    disp(players(i))
end

function players = get_players(num)
    for i = 1:num
        prompt = sprintf('Player %d, enter name: ', i);
        name = input(prompt, 's');
        players(i).name = name;
        players(i).rollAmount = 0;
        players(i).score = 0;
        players(i).scoreFinal = 0;
        players(i).doneBetting = 0;
    end
end

computer.name = "house";
computer.rollAmount = 0;
computer.score = 0;

% --- First roll for players ---

num = length(players);  % number of players

for i = 1:num
    prompt = sprintf('%s, press Enter to roll the dice...', players(i).name);
    input(prompt, 's');  % wait for Enter
    
    roll = randi([2,14]);  % roll dice from 1 to 11
    if ismember(roll, [10,12,13,14])
        roll = 10;
    end
    
    fprintf('%s rolled a %d!\n', players(i).name, roll);
   
      
        if roll == 11
          isValid = false;
          fprintf('%s, choose if you want your roll to be 1 or 11.\n', players(i).name)
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
    players(i).rollAmount = players(i).rollAmount + roll;
end

computer.rollAmount = randi([2,14]);  % The houses First roll
if ismember(computer.rollAmount, [10,12,13,14])
    computer.rollAmount = 10;
elseif computer.rollAmount == 11
    computer.rollAmount = 11;
end
fprintf('House rolled a %d!\n', computer.rollAmount);

% --- Second roll for players ---

num = length(players); % number of players

for i = 1:num
   prompt = sprintf('%s, press Enter to roll the dice again...', players(i).name);
    input(prompt, 's');
    
    roll = randi([2,14]);  % roll dice from 1 to 14
    if ismember(roll, [10,12,13,14])
        roll = 10;
    end
    
    fprintf('%s rolled a %d!\n', players(i).name, roll);
   
      
        if roll == 11
          isValid = false;
          fprintf('%s, choose if you want your roll to be 1 or 11.\n', players(i).name)
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
    players(i).rollAmount = players(i).rollAmount + roll;
    
    fprintf('%s, your new total sum is %d.\n', players(i).name, players(i).rollAmount);
end

% --- Second roll for house (no display of new total) ---
secondRoll = randi([2,14]);
if ismember(secondRoll, [10,12,13,14])
    secondRoll = 10;
elseif secondRoll == 11
    secondRoll = 1;
end
computer.rollAmount = computer.rollAmount + secondRoll;  % update silently

% Loop through all players
for i = 1:num
    while true
        % Show current total
        fprintf('%s, your current total is %d.\n', players(i).name, players(i).rollAmount);

        % Ask if they want to roll again
        choice = input('Do you want to roll again? (y/n): ', 's');
        
        if strcmpi(choice, 'n')
            fprintf('%s has chosen to stand with %d as their total sum.\n', players(i).name, players(i).rollAmount);
            players(i).doneBetting = 1;  % You can use this flag later
            break;
        end

        % Roll the dice
        roll = randi([2,14]);
        if ismember(roll, [10,12,13,14])
            roll = 10;
        elseif roll == 11
            isValid = false;
            fprintf('%s, choose if you want your roll to be 1 or 11.\n', players(i).name);
            while ~isValid
                roll = input('Enter your choice (1 or 11): ');
                if ismember(roll, [1, 11])
                    isValid = true;
                else
                    fprintf('Please enter a valid number (1 or 11)\n');
                end
            end
        end
        
        fprintf('%s rolled a %d!\n', players(i).name, roll);
        players(i).rollAmount = players(i).rollAmount + roll;

        % Check for bust
        if players(i).rollAmount > 21
            fprintf('%s busted with a total of %d!\n', players(i).name, players(i).rollAmount);
            players(i).scoreFinal = 0;  % Optional: store final result
            break;
        end
    end
end

while computer.rollAmount < 17
    roll = randi([2,14]);
    if ismember(roll, [10,12,13,14])
        roll = 10;
    elseif roll == 11
        % Basic strategy for house: use 11 if it won’t cause a bust
        if computer.rollAmount + 11 > 21
            roll = 1;
        else
            roll = 11;
        end
    end
    
    computer.rollAmount = computer.rollAmount + roll;
    fprintf('House rolled a %d. Total is now %d.\n', roll, computer.rollAmount);
end

% Final outcome
if computer.rollAmount > 21
    fprintf('House busted with a total of %d!\n', computer.rollAmount);
else
    fprintf('House stands with a total of %d.\n', computer.rollAmount);
end