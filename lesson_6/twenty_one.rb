require 'pry'
# card values
# 2 - 10  Face value
# jack, queen, king 10
# ace 1 or 11 calculated programatically
# example: [['H', '2'], ['S', 'J'], ['C', 'A']] 2 of hearts, jack of spades, ace
# of clubs

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', 'A', 'J', 'Q', 'K']

player_cards = []
dealer_cards = []

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.
end

def deal_cards(num)
  
end

def player_turn(player_cards)
  answer = nil

  loop do
    puts "your cards: "
    p player_cards
    prompt "Hit or Stay?"
    answer = gets.chomp.downcase
    break if answer == 'stay' || busted?(total(player_cards))
    player_cards << [['S', '10']]
  end
end

def dealer_turn(dealer_cards)
  loop do
    # dealer turn check for break condition at top b/c it's done programatically?
    break if dealer_stay?(total(dealer_cards)) || busted?(total(dealer_cards))
    dealer_cards << [['S', '10']]
  end
  
end

def total(cards)
  values = cards.map {|card| card[1]  }
  prompt 'totalling cards ...'
  
  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11  
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end
  prompt "Sum before checking aces is #{sum}"
  # correct for aces
  values.select { |value| value == 'A'}.count.times do
    sum -= 10 if sum > 21
  end
  prompt "Sum after checking aces is #{sum}"
  sum
end

def busted?(total)
  total > 21
end

def dealer_stay?(total)
  total > 17
end

def determine_winner(player_total,dealer_total)
  if busted?(player_total)
    return 'Dealer'
  elsif busted?(dealer_total)
    return 'Player'
  end
  
  player_diff = 21 - player_total
  dealer_diff = 21 - dealer_total
  
  if player_diff < dealer_diff && player_diff >= 0
    'Player'
  elsif dealer_diff < player_diff && dealer_diff >= 0 && 
    'Dealer'
  else
    'Draw'
  end
end

def display_result(who_won)
  if who_won == 'Player' || who_won == 'Dealer'
    puts "winner is #{who_won}!"
  else
    puts "It's a draw!"
  end
end

player_cards = [['S', 'A'], ['D', 'A'], ['S', '2']]
dealer_cards = [['S', 'A'], ['D', 'A'], ['S', '2']]

#prompt(player_cards)
player_turn(player_cards)
puts 'player cards'
p player_cards
dealer_turn(dealer_cards)
p 'dealer_cards'
p dealer_cards

# total([['S', 'A'], ['D', 'A'], ['S', '2']])
# total([['S', 'A'], ['D', '2'], ['S', '2']])
# total([['S', '10'],['S','A']])

if busted?(total(player_cards))
  # end the game or ask user to play again?
  prompt "Sorry! You busted!"
else
  # user "stay-ed"
  prompt "You chose to stay"
end

winner = determine_winner(22, 20)
#winner = determine_winner(total(player_cards),total(dealer_cards))
display_result(winner)
prompt "Thank you for playing Twenty-one! Good-bye!"
