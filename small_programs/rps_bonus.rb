require 'pry'

score = {
  'player' => 0,
  'computer' => 0,
  'no one' => 0
}

WINNING_CHOICE = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'spock' => ['scissors', 'rock'],
  'lizard' => ['spock', 'paper']
}

VALID_CHOICES = WINNING_CHOICE.keys

def prompt(message)
  puts "=> #{message}"
end

def who_won?(player_move, computer_move, winner)
  if winner[player_move].include?(computer_move)
    'player'
  elsif winner[computer_move].include?(player_move)
    'computer'
  else
    'no one'
  end
end

def s_or_s(move)
  prompt 'Do you mean scissors or spock?'
  loop do
    move = gets.chomp.downcase
    if move.start_with?('sc')
      move = 'scissors'
      break
    elsif move.start_with?('sp')
      move = 'spock'
      break
    else
      puts 'invalid choice.'
    end
  end
  move
end

def valid_choice?(choice)
  loop do
    if 
      VALID_CHOICES.each do |selection|
        if selection.start_with?(choice)
          choice = selection
        end
      end
    break
    else prompt "Invalid input, try again."
    end
  end
  choice
end

loop do
  choice = ''
 
    prompt "Choose one: #{WINNING_CHOICE.keys.join(', ')}"
    choice = gets.chomp.downcase

    if choice == 's'
      s_or_s(choice)
    end

    choice = valid_choice?(choice)

  computer_choice = WINNING_CHOICE.keys.sample

  winner = who_won?(choice, computer_choice, WINNING_CHOICE)
  binding.pry
  score[winner] += 1

  prompt "You chose: #{choice}; the computer chose: #{computer_choice}"
  prompt "#{winner.upcase} WON!! \n
    You have #{score['player']}.\n
    The computer has #{score['computer']}\n\n"

  break if score.value?(3)
end

prompt "Game over. Thank you for playing, goodbye!"
