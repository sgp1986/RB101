require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = ''
COMPUTER_MARKER = ''

def prompt(msg)
  puts "=> #{msg}"
end

scoreboard = {
  'Player' => 0,
  'Computer' => 0,
  'Ties' => 0
}

def display_score(scoreboard)
  prompt <<~SCOREBOARD
  The current score is:
  Player: #{scoreboard['Player']}
  Computer: #{scoreboard['Computer']}
  Ties: #{scoreboard['Ties']}

  SCOREBOARD
end

def choose_x_or_o(player, computer)
  prompt "Welcome to Tic Tac Toe! Would you like to play as X or O?"
  loop do
    answer = gets.chomp.upcase
    if answer == 'X'
      player << 'X'
      computer << 'O'
      break
    elsif answer == 'O'
      player << 'O'
      computer << 'X'
      break
    else
      prompt "That's not a valid option."
    end
  end
end

def display_board(brd)
  system 'clear'
  prompt <<~BOARD
  You are #{PLAYER_MARKER}
  Computer is #{COMPUTER_MARKER}
  X goes first
  
       |     |
    #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}
       |     |
  -----+-----+-----
       |     |
    #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}
       |     |
  -----+-----+-----
       |     |
    #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}
       |     |

  BOARD
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator = ', ', word = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(separator)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(brd)
  at_risk_line = []
  WINNING_LINES.map do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      at_risk_line << line
    end
  end
  at_risk_line.flatten.select { |square| brd[square] == INITIAL_MARKER }[0]
end

def offensive_move(brd)
  winning_line = []
  WINNING_LINES.map do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      winning_line << line
    end
  end
  winning_line.flatten.select { |square| brd[square] == INITIAL_MARKER }[0]
end

def computer_places_piece!(brd)
  if offensive_move(brd)
    brd[offensive_move(brd)] = COMPUTER_MARKER
  elsif find_at_risk_square(brd)
    brd[find_at_risk_square(brd)] = COMPUTER_MARKER
  elsif brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def place_piece!(board, current)
  if current == 'Player'
    player_places_piece!(board)
  else
    sleep(0.3)
    computer_places_piece!(board)
  end
end

def alternate_player(current)
  if current == 'Player'
    'Computer'
  else
    'Player'
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def game_over?(scrbrd)
  scrbrd['Player'] == 5 || scrbrd['Computer'] == 5
end

# START OF GAME
choose_x_or_o(PLAYER_MARKER, COMPUTER_MARKER)

loop do # Main Loop
  current_player = if PLAYER_MARKER == 'X'
                     'Player'
                   else
                     'Computer'
                   end
  board = initialize_board
  loop do # Gameplay Loop
    display_board(board)
    display_score(scoreboard)

    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end
  sleep(1.25)

  if detect_winner(board) == 'Player'
    scoreboard['Player'] += 1
  elsif detect_winner(board) == 'Computer'
    scoreboard['Computer'] += 1
  else
    scoreboard['Ties'] += 1
  end

  break if game_over?(scoreboard)
end

prompt "Game Over! Thanks for playing Tic Tac Toe! Goodbye!"
