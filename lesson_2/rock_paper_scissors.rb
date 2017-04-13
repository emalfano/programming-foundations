# Rock paper scissors
VALID_CHOICES = { r: 'rock', p: 'paper', sc: 'scissors', sp: 'spock',
                  l: 'lizard' }
WINNING_COMBINATIONS = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  spock: ['scissors', 'rock'],
  lizard: ['paper', 'spock']
}
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
  WINNING_COMBINATIONS[first.to_sym].include?(second)
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

def game_over(player_wins, computer_wins, ties)
  player_wins == 5 || computer_wins == 5 || ties == 5
end

def we_have_a_winner(player_wins, computer_wins, ties)
  if player_wins > computer_wins && player_wins > ties
    'Player'
  elsif computer_wins > player_wins && computer_wins > ties
    'Computer'
  else
    'It is a tie!'
  end
end

pick_one = []
VALID_CHOICES.each do |key, value|
  pick_one.push("#{key} for #{value}")
end
choose_one = "Choose one: #{pick_one.join(', ')}"

prompt('Welcome to Rock Paper Scissors Spock Lizard!')
loop do
  choice = ''
  loop do
    prompt(choose_one)
    choice = Kernel.gets().chomp().to_sym

    if VALID_CHOICES.keys.include?(choice.downcase)
      choice = VALID_CHOICES[choice.downcase]
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
  answer = ''
  loop do
    prompt('Do you want to play again? (y/n)')
    answer = Kernel.gets().chomp()
    break if answer.downcase().start_with?('y', 'n')
    prompt("Please select y or n")
  end

  break if game_over(player_wins, computer_wins, ties) ||
           !answer.downcase().start_with?('y')
end

prompt("Player won #{player_wins} time(s)")
prompt("Computer won #{computer_wins} time(s)")
prompt("There were #{ties} ties")
prompt('')
prompt("And the overall winner is:\
 #{we_have_a_winner(player_wins, computer_wins, ties)}!!!")
prompt('Thank you for playing!')
