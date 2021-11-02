require 'yaml'
PROMPTS = YAML.load_file('twentyone_prompts.yml')

VALID_HIT = ['hit', 'h']
VALID_STAY = ['stay', 's']
VALID_YES = ['yes', 'y']
VALID_NO = ['no', 'n']
NUMBER_CARDS = ["2", "3", "4", "5", "6", "7", "8", "9", "10"]
FACE_CARDS = ["J", "Q", "K"]
ACE = "A"

suits = ["s", "c", "d", "h"]

deck = []

def initialize_deck(deck, suits, numcrds, fcecrds, ace)
  suits.map do |suit|
    [numcrds, fcecrds, ace].flatten.map do |card|
      deck << card + suit
    end
  end
end

def welcome
  system 'clear'
  prompt PROMPTS['welcome']
end

# INPUT VALIDATORS
def hit?(input)
  VALID_HIT.include?(input)
end

def stay?(input)
  VALID_STAY.include?(input)
end

def yes?(input)
  VALID_YES.include?(input)
end

def no?(input)
  VALID_NO.include?(input)
end

def prompt(msg)
  puts ">> #{msg}"
  sleep(0.8)
end

def deal_cards(deck, hand)
  2.times { hand << deck.sample }
end

def add_card(deck, hand)
  hand << deck.sample
  evaluate_hand(hand)
end

def remove_cards!(deck, hand)
  hand.each do |hand_card|
    deck.delete_if do |deck_card|
      deck_card == hand_card
    end
  end
end

def card_value(hand)
  hand.map do |card|
    if card.size == 3
      10
    else
      card[0]
    end
  end
end

def find_score(values)
  score = 0
  values.each do |value|
    if value == "A"
      score += 11
    elsif value.to_i == 0 # J, Q, K
      score += 10
    else
      score += value.to_i
    end
  end
  score
end

def evaluate_hand(hand)
  values = card_value(hand)

  score = find_score(values)

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    score -= 10 if score > 21
  end

  score
end

def bust?(score)
  score > 21
end

def push?(player1, player2)
  player1 == player2
end

def hit_or_stay(move)
  loop do # HIT/STAY LOOP
    move << gets.chomp.downcase
    break if hit?(move) || stay?(move)
    prompt PROMPTS['hs_error']
    move = ''
  end
  move
end

def players_turn(deck, hand, score)
  loop do
    prompt PROMPTS['hit_stay']

    move = ''
    hit_or_stay(move)

    break prompt PROMPTS['chose_stay'] + "#{score}." if stay?(move)

    prompt PROMPTS['chose_hit']
    score = add_card(deck, hand)
    prompt "You now hold #{hand.join(', ')}, for a score of #{score}."
    break prompt PROMPTS['player_bust'] + "#{score}." if bust?(score)
  end
  score
end

def dealers_turn(deck, hand, score)
  loop do
    break if score >= 17
    score = add_card(deck, hand)
    prompt PROMPTS['dealer_hit'] + "#{hand[-1]}."
    prompt "Dealer now shows #{hand.join(', ')} for a score of #{score}."
  end
  score
end

def determine_winner?(player1, player2)
  bust?(player2) || push?(player1, player2) ||
    player1 > player2 && player1 <= 21
end

def display_winner(player, dealer)
  if determine_winner?(player, dealer)
    prompt PROMPTS['won']
  elsif determine_winner?(dealer, player)
    prompt PROMPTS['loss']
  end
end

# START OF GAME

loop do # MAIN LOOP
  player_score = 0
  dealer_score = 0
  loop do # ONE HAND LOOP
    welcome

    initialize_deck(deck, suits, NUMBER_CARDS, FACE_CARDS, ACE)

    player_hand = []
    dealer_hand = []

    deal_cards(deck, player_hand)
    remove_cards!(deck, player_hand)
    deal_cards(deck, dealer_hand)
    remove_cards!(deck, dealer_hand)

    player_score = evaluate_hand(player_hand)
    dealer_score = evaluate_hand(dealer_hand)
    prompt PROMPTS['deal'] + "#{player_hand[0]}, #{player_hand[1]} " \
           "for a score of #{player_score}"
    prompt PROMPTS['showing'] + "#{dealer_hand[1]}..."

    break prompt PROMPTS['bj'] if player_score == 21

    player_score = players_turn(deck, player_hand, player_score)
    break if bust?(player_score)

    prompt PROMPTS['reveal'] + "#{dealer_hand[0]}, #{dealer_hand[1]} " \
           "for a score of #{dealer_score}"
    dealer_score = dealers_turn(deck, dealer_hand, dealer_score)

    break if bust?(dealer_score) ||
             determine_winner?(player_score, dealer_score) ||
             determine_winner?(dealer_score, player_score)
  end

  if bust?(dealer_score)
    determine_winner?(player_score, dealer_score)
    prompt PROMPTS['dealer_bust'] + "#{dealer_score}!"
  elsif push?(player_score, dealer_score)
    prompt PROMPTS['push']
  end

  display_winner(player_score, dealer_score)

  answer = ''
  loop do # PLAY AGAIN LOOP
    prompt PROMPTS['again']
    answer << gets.chomp.downcase
    break if yes?(answer) || no?(answer)
    prompt PROMPTS['yes_no']
    answer = ''
  end
  break if no?(answer)
  prompt PROMPTS['continue']
end

prompt PROMPTS['bye']
