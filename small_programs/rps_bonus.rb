require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('rps_prompts.yml')

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

VALID_YES = ['yes', 'y']
VALID_NO = ['no', 'n']

def clear_screen
  system "clear"
end

def yes?(input)
  VALID_YES.include?(input)
end

def no?(input)
  VALID_NO.include?(input)
end

def again?
  input = nil
  loop do
    input = gets.chomp.downcase
    break if yes?(input) || no?(input)
    prompt MESSAGES['invalid'] + "option."
  end
  input
end

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
  prompt MESSAGES['s_s']
  loop do
    move = gets.chomp.downcase
    if move.start_with?('sc')
      move = 'scissors'
      break
    elsif move.start_with?('sp')
      move = 'spock'
      break
    else
      prompt MESSAGES['invalid']
    end
  end
  move
end

def valid_choice?(choice)
  loop do
    if VALID_CHOICES.each do |selection|
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

winner = ''
clear_screen
prompt MESSAGES['welcome']
sleep(0.5)
prompt MESSAGES['rules']
sleep(0.75)
loop do
  loop do
    prompt MESSAGES['choose'] + "#{WINNING_CHOICE.keys.join(', ')}"
    choice = gets.chomp.downcase

    if choice == 's'
      choice = s_or_s(choice)
    end

    choice = valid_choice?(choice)

    computer_choice = WINNING_CHOICE.keys.sample

    winner = who_won?(choice, computer_choice, WINNING_CHOICE)

    score[winner] += 1
    sleep(0.5)
    prompt "You chose #{choice} and the computer chose #{computer_choice}\n\n"
    sleep(0.5)
    prompt "#{winner.upcase}" + MESSAGES['winner']
    prompt MESSAGES['user_score'] + "#{score['player']}"
    prompt MESSAGES['comp_score'] + "#{score['computer']}"

    break if score.value?(3)
    end
  prompt MESSAGES['game_over'] + "#{winner}"
  sleep(0.75)
  prompt MESSAGES['again']
  answer = again?
  if yes?(answer)
    score['player'] = 0
    score['computer'] = 0
    score['no one'] = 0
  else
    break
  end
end


prompt MESSAGES['bye']
