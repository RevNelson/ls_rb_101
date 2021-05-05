MATCH_GOAL = 5

MOVES = {
  "rock" => {
    "alt_entries": %w[r 1],
    "wins_against": %w[scissors lizard],
    "loses_against": %w[paper spock]
  },
  "paper" => {
    "alt_entries": %w[p 2],
    "wins_against": %w[rock spock],
    "loses_against": %w[scissors lizard]
  },
  "scissors" => {
    "alt_entries": %w[sc 3],
    "wins_against": %w[paper lizard],
    "loses_against": %w[rock spock]
  },
  "lizard" => {
    "alt_entries": %w[l 4 z],
    "wins_against": %w[paper spock],
    "loses_against": %w[rock scissors]
  },
  "spock" => {
    "alt_entries": %w[sp 5],
    "wins_against": %w[rock scissors],
    "loses_against": %w[paper lizard]
  }
}

def prompt(message, prefix = "=> ")
  p("#{prefix}#{message}")
end

def display_choices
  prompt("Choose one:")
  MOVES.each do |move, info|
    prompt("#{move} (#{info[:alt_entries].join(" or ")})", "")
  end
end

def validated_choice(choice)
  valid_choice = nil
  MOVES.each do |move, info|
    valid_entries = info[:alt_entries] + [move]
    valid_choice = move if valid_entries.include?(choice)
  end
  valid_choice
end

def win?(first, second)
  MOVES[first][:wins_against].include?(second)
end

def get_winner(player, computer)
  if win?(player, computer)
    "player"
  elsif win?(computer, player)
    "computer"
  else
    "tie"
  end
end

score_board = [0, 0]

loop do
  choice = ""

  loop do
    display_choices
    choice = validated_choice(gets.chomp)
    if choice
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = MOVES.keys.sample

  prompt("You chose: #{choice}. Computer chose: #{computer_choice}")

  winner = get_winner(choice, computer_choice)

  # Display and increment wins
  if winner == "player"
    score_board[0] += 1
    prompt("You won!")
  elsif winner == "computer"
    score_board[1] += 1
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end

  # Show scorebord
  prompt("SCOREBOARD: Player: #{score_board[0]} || Computer: #{score_board[1]}")

  # Reset match if MATCH_GOAL is reached
  if score_board[0] == MATCH_GOAL
    prompt("You are the GRAND WINNER!")
    score_board = [0, 0]
  elsif score_board[1] == MATCH_GOAL
    prompt("Computer is the GRAND WINNER!")
    score_board = [0, 0]
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end
