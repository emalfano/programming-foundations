require 'pry'
# card values
# 2 - 10  Face value
# jack, queen, king 10
# ace 1 or 11 calculated programatically
# example: [['H', '2'], ['S', 'J'], ['C', 'A']] 2 of hearts, jack of spades, ace
# of clubs

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', 'A', 'J', 'Q', 'K']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle # combines the suits and values arrays and
  # returns shuffled
end

# rubocop:disable Metrics/MethodLength
def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == "A"
             11
           elsif value.to_i == 0
             10
           else
             value.to_i
           end
  end

  # correct for aces
  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def busted?(cards)
  total(cards) > 21
end

def dealer_stay?(total)
  total > 17
end

# rubocop:disable Metrics/MethodLength
def determine_winner(player_cards, dealer_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(who_won)
  case who_won
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You won!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    puts "It's a tie!"
  end
end
# rubocop:enable Metrics/MethodLength

prompt "Welcome to Twenty-one!"

loop do
  prompt "Shuffling deck ..."
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # deal cards
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have #{player_cards[0]} and #{player_cards[1]}, for a total of
    #{total(player_cards)}"

  # Player turn
  loop do
    player_answer = nil

    loop do
      prompt "(H)it or (S)tay?"
      player_answer = gets.chomp.downcase
      break if player_answer == 's' || player_answer == 'h'
      prompt "Please enter 'h' or 's'"
    end

    if player_answer == 'h'
      player_cards << deck.pop
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end
    break if player_answer == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_result(determine_winner(player_cards, dealer_cards))
    break
  end

  prompt "You stayed at #{total(player_cards)}"

  # Dealer turn
  prompt "Dealer turn..."
  def dealer_turn(dealer_cards, deck)
    loop do
      # dealer turn check for break condition at top b/c it's done
      # programatically?
      break if total(dealer_cards) >= 17
      prompt "Dealer hits!"

      dealer_cards << deck.pop
      prompt "Dealer's cards are now: #{dealer_cards}"
    end
    prompt "Dealer stayed!"
  end

  if busted?(dealer_cards)
    # end the game or ask user to play again?
    prompt "Dealer total is now #{total(dealer_cards)}"
    display_result(determine_winner(player_cards, dealer_cards))
    break
  end

  # both player and dealer stays - compare cards!
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="

  winner = determine_winner(player_cards, dealer_cards)
  # winner = determine_winner(total(player_cards),total(dealer_cards))
  display_result(winner)

  prompt "Do you want to play again?(Y/N)"
  answer = gets.chomp.downcase
  break unless answer == 'y'
end
prompt "Thank you for playing Twenty-one! Good-bye!"
