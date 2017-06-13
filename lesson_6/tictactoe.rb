require 'pry'
# tic tac toe game

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
FIRST_PLAYER = 'computer' # options are 'computer', 'player', 'choose'
VALID_CHOICES = ['computer', 'player']

def prompt(msg)
  puts "=> #{msg}"
end

# Method to display empty squares with an "or" before last square
# def joinor(empty_squares_array, separator=',', operand='or')
#   formatted_array = ''
#   empty_squares_array.each_with_index do |square, index|
#     if empty_squares_array.size == 1
#       formatted_array = square
#     elsif empty_squares_array.size == 2 && index == 0
#     # this condition won't ever happen?
#       formatted_array << square.to_s + ' '
#     elsif index == empty_squares_array.size - 1
#       formatted_array << operand + ' ' + square.to_s
#     else
#       formatted_array << square.to_s + separator + ' '
#     end
#   end
#   formatted_array
# end

# LS solution suggests use case statement like this:
def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  prompt("You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}.")
  puts " "
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def check_for_offense(brd,sqr)
  # computer AI offense
  # computer offense move should be played first
  WINNING_LINES.each do |line|
    sqr = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if sqr
  end
end

# consolidate player and computer places piece methods into one
def place_piece!(brd, player)
  square = nil
  if player == 'player'
    marker = PLAYER_MARKER
    loop do
      prompt "Choose a square (#{joinor(empty_squares(brd))}):"
      square = gets.chomp.to_i
      break if empty_squares(brd).include?(square)
      prompt "Sorry that is not a valid choice"
    end
  elsif player == 'computer'
    marker = COMPUTER_MARKER
    check_for_offense(brd,square)
    # computer AI defense
    if !square
      WINNING_LINES.each do |line|
        square = find_at_risk_square(line, brd, PLAYER_MARKER)
        break if square
      end
    end

    # pick square #5
    if !square && brd[5] == ' '
      square = 5
    end
    # pick a random square
    if !square
      square = empty_squares(brd).sample # this returns an integer
    end
  end

  # modify board
  brd[square] = marker
end

# def player_places_piece!(brd)
#   square = nil
#   loop do
#     prompt "Choose a square (#{joinor(empty_squares(brd))}):"
#     square = gets.chomp.to_i
#     # binding.pry
#     break if empty_squares(brd).include?(square)
#     prompt "Sorry that is not a valid choice"
#   end

#   # modify board
#   brd[square] = PLAYER_MARKER
# end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

# def computer_places_piece!(brd)
#   square = nil

#   # computer AI offense
#   # computer offense move should be played first
#     WINNING_LINES.each do |line|
#       square = find_at_risk_square(line, brd, COMPUTER_MARKER)
#       break if square
#     end

#   # computer AI defense
#   if !square
#     WINNING_LINES.each do |line|
#       square = find_at_risk_square(line, brd, PLAYER_MARKER)
#       break if square
#     end
#   end

#   # pick square #5
#   if !square && brd[5] == ' '
#     square = 5
#   end

#   # pick a random square
#   if !square
#     square = empty_squares(brd).sample # this returns an integer
#   end

#   brd[square] = COMPUTER_MARKER
# end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # if brd[line[0]] == PLAYER_MARKER &&
    #   brd[line[1]] == PLAYER_MARKER &&
    #   brd[line[2]] == PLAYER_MARKER
    #   return 'Player'
    # elsif brd[line[0]] == COMPUTER_MARKER &&
    #       brd[line[1]] == COMPUTER_MARKER &&
    #       brd[line[2]] == COMPUTER_MARKER
    #   return 'Computer'
    # end
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def alternate_player(player)
  if player == 'player'
    'computer'
  else
    'player'
  end
end

player_wins = 0
computer_wins = 0

if FIRST_PLAYER == 'choose'
  loop do
    prompt 'Who goes first? (player or computer)'
    current_player = gets.chomp.downcase
    break if VALID_CHOICES.include?(current_player)
    prompt "Sorry that is not a valid choice"
  end
else
  current_player = FIRST_PLAYER
end

loop do
  board = initialize_board

  # loop do

  #   display_board(board)
  #   p board

  #   if player_selection == 'player'
  #     player_places_piece!(board)
  #     break if someone_won?(board) || board_full?(board)

  #     computer_places_piece!(board)
  #     break if someone_won?(board) || board_full?(board)
  #   elsif player_selection == 'computer'
  #     computer_places_piece!(board)
  #     break if someone_won?(board) || board_full?(board)

  #     display_board(board)
  #     p board
  #     player_places_piece!(board)
  #     break if someone_won?(board) || board_full?(board)
  #   end

  # end

  # improve the game loop by removing repetitive code

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    if detect_winner(board) == 'Player'
      player_wins += 1
    elsif detect_winner(board) == 'Computer'
      computer_wins += 1
    end
    prompt "Player: #{player_wins} to computer: #{computer_wins}"
  else
    prompt "It's a tie!"
  end
  if player_wins == 5 || computer_wins == 5
    prompt "#{detect_winner(board)} has won 5 games! Game Over!"
    break
  end

  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for playing Tic Tac Toe. Good Bye!'
