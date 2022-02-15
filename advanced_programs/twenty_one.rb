require 'pry'
require 'yaml'
PROMPTS = YAML.load_file('twentyone_prompts.yml')

VALID_HIT = ['hit', 'h']
VALID_STAY = ['stay', 's']
VALID_YES = ['yes', 'y']
VALID_NO = ['no', 'n']
VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

suits = ["♠", "♣", "♦", "♥"]

deck = []

scoreboard = { 'User' => 0, 'Dealer' => 0, 'Pushes' => 0, 'Total Chips' => 0 }

current_bet = 0

def display_score(scoreboard, current_bet)
  prompt <<~SCORE
  Total hands won:
  User: #{scoreboard['User']}
  Dealer: #{scoreboard['Dealer']}
  Pushes: #{scoreboard['Pushes']}
  Total Chips: $#{scoreboard['Total Chips']}
  Current Bet: $#{current_bet}

  SCORE
end

# GAME INITIALIZATION
def initialize_deck!(deck, suits)
  suits.each do |suit|
    VALUES.each do |card|
      deck << [card, suit]
    end
  end
end

def prompt(msg)
  puts ">> #{msg}"
  sleep(0.8)
end

def welcome(buy_in)
  system 'clear'
  prompt PROMPTS['welcome']
  sleep(0.8)
  buy_in = 100

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

# DEALING METHODS
def deal_cards(deck, dealt_hands)
  add_card(deck, dealt_hands)
  remove_cards!(deck, dealt_hands)
end

def add_card(deck, hands)
  hands.keys.map do |hand, _|
    hands[hand] << deck.sample
  end
end

def remove_cards!(deck, dealt_hands)
  dealt_hands.each do |_user, hand|
    hand.each do |hand_card|
      deck.delete_if do |deck_card|
        deck_card == hand_card
      end
    end
  end
end

def convert_hands(dhand, nhand)
  nhand.map do |user, _hand|
    dhand.each do |duser, d_hand|
      d_hand.each do |card|
        if user == duser
          nhand[user][:hand] << { card: { value: card[0], suit: card[1] } }
        end
      end
    end
  end
end

def initial_deal(deck, dealt_hands, hands)
  2.times { deal_cards(deck, dealt_hands) }

  convert_hands(dealt_hands, hands)
  find_score(hands)
end

def hit_deal(deck, hit_cards, hands)
  add_card(deck, hit_cards)
  remove_cards!(deck, hit_cards)
  convert_hands(hit_cards, hands)
  find_score(hands)
end

# SCORING METHODS
def find_score(hands)
  values = get_player_values(hands)

  card_scores = values.values.map do |hand|
    hand.map do |card|
      if card == "A"
        11
      elsif card.to_i == 0
        10
      else
        card.to_i
      end
    end
  end

  hands[:user][:score] = card_scores[0].sum
  hands[:dealer][:score] = card_scores[1].sum

  count_aces(values, hands)
end

def count_aces(values, hands)
  ace_count = values[:user].count("A")
  ace_count.times do
    hands[:user][:score] -= 10 if hands[:user][:score] > 21
  end

  ace_count = values[:dealer].count("A")
  ace_count.times do
    hands[:dealer][:score] -= 10 if hands[:dealer][:score] > 21
  end
end

def get_player_values(hands)
  values = { user: [], dealer: [] }

  hands.each do |h_user, hand|
    hand.values[0].each do |card|
      values.map do |v_user, score|
        score << card.values[0][:value] if v_user == h_user
      end
    end
  end
  values
end

# GAME MOVES
def bust?(score)
  score > 21
end

def push?(user1, user2)
  user1 == user2
end

def hit_or_stay(move)
  loop do # HIT/STAY LOOP
    move = gets.chomp.downcase
    break if hit?(move) || stay?(move)
    prompt PROMPTS['hs_error']
    move = ''
  end
  move
end

def users_turn(deck, hands)
  loop do
    user_hit_cards = { user: [] }
    score = hands[:user][:score]
    prompt PROMPTS['hit_stay']
    move = hit_or_stay(move)
    break prompt PROMPTS['chose_stay'] + score.to_s if stay?(move)

    hit_deal(deck, user_hit_cards, hands)

    prompt PROMPTS['chose_hit']
    prompt "You received: " + user_hit_cards[:user][-1].join +
           " for a total score of #{hands[:user][:score]}."
    break prompt PROMPTS['user_bust'] + score.to_s if bust?(score)
  end
end

def dealers_turn(deck, hands)
  loop do
    dealer_hit_cards = { dealer: [] }
    break if hands[:dealer][:score] >= 17

    hit_deal(deck, dealer_hit_cards, hands)

    prompt PROMPTS['dealer_hit']
    prompt "Dealer receives: " + dealer_hit_cards[:dealer][-1].join +
           " for a score of #{hands[:dealer][:score]}."
  end
end

# END OF GAME METHODS
def determine_winner?(user1, user2)
  bust?(user2) || user1 > user2 && user1 <= 21
end

def display_winner(user, dealer, scoreboard, current_bet)
  if determine_winner?(user, dealer)
    prompt PROMPTS['won']
    scoreboard['User'] += 1
    scoreboard['Total Chips'] += current_bet * 2
  elsif determine_winner?(dealer, user)
    prompt PROMPTS['loss']
    scoreboard['Dealer'] += 1
  end
end

def end_of_hand?(user, dealer)
  bust?(dealer) || push?(user, dealer) ||
    determine_winner?(user, dealer) ||
    determine_winner?(dealer, user)
end

def play_again?(answer)
  prompt PROMPTS['again']
  loop do # PLAY AGAIN LOOP
    answer << gets.chomp.downcase
    break if yes?(answer) || no?(answer)
    prompt PROMPTS['yes_no']
    answer = ''
  end
end

# BETTING MECHANICS
# need
  # track bets and total money
  # input bet
  # winning - calculate odds
  # losing - remove bet
  # remove bet amount from total "buy in"
  # track buy-ins if multiple
  # betting limits
  # insurance?

# Add later on
  # playing multiple seats?
  # playing with 2 decks that don't get shuffled after every round
  # showing card faces (maybe)

# start game with $100 buy in
# add $100 to players total money (money = 100)
# ask user for bet amount for first hand
# remove bet amount from total money, store as current bet
# let hand play out
# if player wins, calculate payout based on odds
  # blackjack pays original bet back play 1.5 amount again
  # win pays your original bet back plus the same amount again
  # push returns bet
# if player loses, reset current bet to 0 and ask for next bet
# game ends when players money reaches 0
  # ask if player wants another $100 buy in. if so, track how many times they've bought in
# minimum bet is $5, max is $50




# START OF GAME
scoreboard['Total Chips'] = welcome(scoreboard['Total Chips'])

loop do # MAIN LOOP
  system 'clear'
  prompt PROMPTS['loop_title']
  loop do # BETTING LOOP
    current_bet = gets.chomp.to_i
    if current_bet > scoreboard['Total Chips']
      prompt "You cannot bet more than you've got."
    elsif current_bet < 5 || current_bet > 25
      prompt "must be between 5 and 25"
    else
      scoreboard['Total Chips'] -= current_bet
      break
    end
  end
  
  display_score(scoreboard, current_bet)

  dealt_hands = { user: [], dealer: [] }
  hands = { user: { hand: [], score: 0 }, dealer: { hand: [], score: 0 } }
  loop do # ONE HAND LOOP
    initialize_deck!(deck, suits)

    initial_deal(deck, dealt_hands, hands)

    prompt PROMPTS['deal'] + dealt_hands[:user][0].join +
           " & " + dealt_hands[:user][1].join +
           " for a score of #{hands[:user][:score]}."
    prompt PROMPTS['showing'] + "#{dealt_hands[:dealer][1].join}..."

    if hands[:user][:score] == 21
      prompt PROMPTS['bj'] 
      scoreboard['Total Chips'] += current_bet * 2.5
      break
    end

    users_turn(deck, hands)
    break if bust?(hands[:user][:score])

    prompt PROMPTS['reveal'] + dealt_hands[:dealer][0].join +
           " & " + dealt_hands[:dealer][1].join +
           " for a total score of #{hands[:dealer][:score]}."
    dealers_turn(deck, hands)

    break if end_of_hand?(hands[:user][:score], hands[:dealer][:score])
  end

  if bust?(hands[:dealer][:score])
    determine_winner?(hands[:user][:score], hands[:dealer][:score])
    prompt PROMPTS['dealer_bust'] + "#{hands[:dealer][:score]}!"
  elsif push?(hands[:user][:score], hands[:dealer][:score])
    prompt PROMPTS['push']
    scoreboard['Pushes'] += 1
    scoreboard['Total Chips'] += current_bet
  end

  display_winner(hands[:user][:score], hands[:dealer][:score], scoreboard, current_bet)

  answer = ''
  break if scoreboard['Total Chips'] == 0
  play_again?(answer)
  break if no?(answer) 
  prompt PROMPTS['continue']
end

prompt PROMPTS['bye']
