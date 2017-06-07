require 'pry'
# tic tac toe game

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

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

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    # binding.pry
    break if empty_squares(brd).include?(square)
    prompt "Sorry that is not a valid choice"
  end

  # modify board
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker)  == 2
    board.select{ |k,v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil
  
  # computer AI defense
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end
  
  # computer AI offense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
      break if square
    end
  end

  # pick a random square
  if !square
    square = empty_squares(brd).sample # this returns an integer
  end

  brd[square] = COMPUTER_MARKER
end

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

player_wins = 0
computer_wins = 0

loop do
  # win_counts = {'Player'=>0, 'Computer'=>0}
  
  board = initialize_board

  # ask the user to mark a square

  loop do
   

    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
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
