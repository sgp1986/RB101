# REQUIREMENTS
require 'yaml'
require 'pry'

# CONSTANT VARIABLES
MESSAGES = YAML.load_file('rps_prompts.yml')

CHOICES = {
  'rock' => { shorthand: 'r', beats: ['scissors', 'lizard'] },
  'paper' => { shorthand: 'p', beats: ['rock', 'spock'] },
  'scissors' => { shorthand: 'sc', beats: ['paper', 'lizard'] },
  'spock' => { shorthand: 'sp', beats: ['scissors', 'rock'] },
  'lizard' => { shorthand: 'l', beats: ['spock', 'paper'] }
}

WINNING_SCORE = 3

VALID_CHOICES = CHOICES.keys

VALID_YES = ['yes', 'y']
VALID_NO = ['no', 'n']

# LOCAL VARIABLES
score = {
  'player' => 0,
  'computer' => 0,
  'no one' => 0
}

# METHOD DEFINITIONS
def clear_screen
  system "clear"
end

def prompt(message)
  puts "=> #{message}"
end

#   PLAY AGAIN DEFINITIONS
def yes?(input)
  VALID_YES.include?(input)
end

def no?(input)
  VALID_NO.include?(input)
end

def again
  input = nil
  loop do
    input = gets.chomp.downcase
    break if yes?(input) || no?(input)
    prompt MESSAGES['invalid']
  end
  input
end

# START OF PROGRAM DEFINITIONS
def greet
  clear_screen
  prompt MESSAGES['welcome']
  sleep(0.5)
  MESSAGES['rules'].split('').each do |c|
    print c
    sleep(0.03)
  end
  sleep(0.75)
end

def s_or_s(input)
  prompt MESSAGES['s_s']
  loop do
    input = gets.chomp.downcase
    if input.start_with?('sc')
      input = 'scissors'
      break
    elsif input.start_with?('sp')
      input = 'spock'
      break
    else
      prompt MESSAGES['s_invalid']
    end
  end
  input
end

def expand(input)
  if CHOICES.find { |_, hash| hash[:shorthand] == input }
    input = CHOICES.find { |_, hash| hash[:shorthand] == input }.first
  else
    input = ''
  end
end

def need_expand?(input)
  CHOICES.find { |_, hash| hash[:shorthand] == input }
end

def valid_choice?(input)
  CHOICES.keys.include?(input) || CHOICES.keys.include?(expand(input))
end

def get_user_move
  input = ''
  prompt MESSAGES['choose'] + CHOICES.keys.join(', ').to_s
  loop do
    input = gets.chomp.downcase
    if input == 's'
      input = s_or_s(input)
    end
    input = expand(input) if need_expand?(input)
    if valid_choice?(input)
      break
    else
      prompt MESSAGES['invalid']
    end
  end
  input
end

def who_won(player, computer)
  if CHOICES[player][:beats].include?(computer)
    'player'
  elsif CHOICES[computer][:beats].include?(player)
    'computer'
  else
    'no one'
  end
end

greet()

loop do # MAIN LOOP
  loop do # GAME LOOP
    prompt <<~SCORE
    The score is:
      Player: #{score['player']}
      Computer: #{score['computer']}
      Ties: #{score['no one']}
    SCORE
    choice = get_user_move

    computer_choice = CHOICES.keys.sample

    winner = who_won(choice, computer_choice)

    score[winner] += 1
    sleep(0.5)
    prompt "You chose #{choice} and the computer chose #{computer_choice}\n\n"
    sleep(0.5)
    prompt winner.upcase.to_s + MESSAGES['winner'] + "\n\n"

    if WINNING_SCORE == score['player'] || WINNING_SCORE == score['computer']
      prompt MESSAGES['game_over'] + winner.to_s.capitalize + "\n\n"
      break
    else
      sleep(1.75)
      clear_screen
    end
  end

  sleep(0.75)
  prompt MESSAGES['again']
  answer = again
  if yes?(answer)
    score['player'] = 0
    score['computer'] = 0
    score['no one'] = 0
    clear_screen
  else
    break
  end
end

prompt MESSAGES['bye']
