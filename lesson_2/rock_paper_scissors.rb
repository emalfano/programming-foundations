# Rock paper scissors
VALID_CHOICES = { r: 'rock', p: 'paper', sc: 'scissors', sp: 'spock',
                  l: 'lizard' }
player_wins = 0
computer_wins = 0
ties = 0

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer)
  winner = get_winner(player, computer)
  if winner == 'player'
    prompt('Player won!')
  elsif winner == 'computer'
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock')) ||
    (first == 'lizard' && (second == 'spock' || second == 'spock'))
end

def get_winner(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  else
    'tie'
  end
end

loop do
  choice = ''
  prompt('Welcome to Rock Paper Scissors Spock Lizard!')
  loop do
    pick_one = []
    VALID_CHOICES.each do |key, value|
      pick_one.push("#{key} for #{value}")
    end
    prompt("Choose one: #{pick_one.join(', ')}")
    choice = Kernel.gets().chomp().to_sym

    if VALID_CHOICES.keys.include?(choice)
      choice = VALID_CHOICES[choice]
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.values.to_a.sample()
  prompt("You chose #{choice}. Computer chose #{computer_choice}.")

  display_results(choice, computer_choice)

  if get_winner(choice, computer_choice) == 'player'
    player_wins += 1
  elsif get_winner(choice, computer_choice) == 'computer'
    computer_wins += 1
  else
    ties += 1
  end

  prompt('Do you want to play again?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Player won #{player_wins} time(s)")
prompt("Computer won #{computer_wins} time(s)")
prompt("There were #{ties} ties")
prompt('Thank you for playing!')
