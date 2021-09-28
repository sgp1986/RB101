WINNING_CHOICE = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'spock' => ['scissors', 'rock'],
  'lizard' => ['spock', 'paper']
}

VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'sp' => 'spock',
  'l' => 'lizard'
}

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  WINNING_CHOICE[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt "You won!"
  elsif win?(computer, player)
    prompt "Computer won!"
  else
    prompt "It's a tie!"
  end
end

def user_choice(move)
  VALID_CHOICES.include?(move)
end

loop do
  choice = ''
  loop do
    prompt "Choose one: #{WINNING_CHOICE.keys.join(', ')}"
    choice = gets.chomp

    if user_choice(choice)
      break
    else
      prompt "That's not a valid choice."
    end
  end

  computer_choice = WINNING_CHOICE.keys.sample

  prompt "You chose: #{choice}; computer chose: #{computer_choice}"

  display_results(choice, computer_choice)

  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing, goodbye!"
