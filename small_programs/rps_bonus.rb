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

def user_choice(input)
  VALID_CHOICES.include?(input)
end

def who_won?(player_move, computer_move, winning_choice)
  if winning_choice[player_move].include?(computer_move)
    'player'
  elsif winning_choice[computer_move].include?(player_move)
    'computer'
  else
    'no one'
  end
end

loop do
  choice = ''
  loop do
    prompt "Choose one: #{WINNING_CHOICE.keys.join(', ')}"
    choice = gets.chomp.downcase

    if choice == 's'
      prompt 'Do you mean scissors or spock?'
      choice = gets.chomp.downcase
      if choice.start_with?('sc')
        choice = 'scissors'
      elsif choice.start_with?('sp')
        choice = 'spock'
      else
        puts 'invalid choice.'
      end
    else
      VALID_CHOICES.each do |selection|
        if selection.start_with?(choice)
          choice = selection
        end
      end
    end
    break if user_choice(choice)
    prompt "Invalid input, try again."
  end

  computer_choice = WINNING_CHOICE.keys.sample

  winner = who_won?(choice, computer_choice, WINNING_CHOICE)

  score[winner] += 1

  prompt "You chose: #{choice}; the computer chose: #{computer_choice}"
  prompt "#{winner.upcase} WON!! \n
    You have #{score['player']}.\n
    The computer has #{score['computer']}\n\n"

  break if score.value?(3)
end

prompt "Game over. Thank you for playing, goodbye!"
