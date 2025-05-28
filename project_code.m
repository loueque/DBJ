clear;

% Ask how many players will play
num = input('How many players will play? ');

% Call function to get players
players = get_players(num);

% Ask for points to win
points_to_win = input('First to How Many Points Wins? ', 's');

fprintf('The game will be played to %s points!\n', points_to_win);

% --- Local function below ---

function players = get_players(num)
    for i = 1:num
        prompt = sprintf('Player %d, enter name: ', i);
        name = input(prompt, 's');
        players(i).name = name;
        players(i).rollAmount = 0;
        players(i).score = 0;
    end
end

computer.name = "house"
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
    computer.rollAmount = 10
end
fprintf('House rolled a %d!\n', computer.rollAmount);

% --- Second roll for players ---

num = length(players); % number of players

for i = 1:num
   prompt = sprintf('%s, press Enter to roll the dice again...', players(i).name);
    input(prompt, 's');
    
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
    
    fprintf('%s, your new total sum is %d.\n', players(i).name, players(i).rollAmount);
end

% --- Second roll for house (no display of new total) ---
secondRoll = randi([2,14]);
if ismember(computer.rollAmount, [10,12,13,14])
    computer.rollAmount = 10
end
computer.rollAmount = computer.rollAmount + secondRoll;  % update silently

