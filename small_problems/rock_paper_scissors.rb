# rock paper scissors game
GAMEHANDS = %w(rock paper scissors spock lizard)
GAMEHANDS_ABBREVIATED = %w(r p s sp l)

WINCONDITIONS = {
  scissors_win: %w(paper lizard),
  rock_win: %w(scissors lizard),
  paper_win: %w(rock spock),
  spock_win: %w(rock scissors),
  lizard_win: %w(paper spock)
}
puts WINCONDITIONS

def win?(first, second)
  (first == 'rock' && WINCONDITIONS[:rock_win].include?(second)) ||
    (first == 'paper' && WINCONDITIONS[:paper_win].include?(second)) ||
    (first == 'scissors' && WINCONDITIONS[:scissors_win].include?(second)) ||
    (first == 'spock' && WINCONDITIONS[:spock_win].include?(second)) ||
    (first == 'lizard' && WINCONDITIONS[:lizard_win].include?(second))
end

def display_result(choice, computer_choice)
  if win?(choice, computer_choice)
    prompt("You won!")
  elsif win?(computer_choice, choice)
    prompt("The computer wins!")
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  puts("=> #{message}")
end

loop do
  gets_choice = ''
  prompt('Welcome to rock paper scissors spock lizard! First to three wins.')
  prompt('The score is Player 0 Computer 0.')
  player_score = 0
  computer_score = 0
  loop do
    prompt("The score is player: #{player_score}, Computer: #{computer_score}")
    prompt("Choose one, #{GAMEHANDS.join(', ')}")

    loop do
      gets_choice = gets.chomp

      if GAMEHANDS.include?(gets_choice)
        break
      elsif GAMEHANDS_ABBREVIATED.include?(gets_choice)
        gets_choice = GAMEHANDS[GAMEHANDS_ABBREVIATED.index(gets_choice)]
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice_sample = GAMEHANDS.sample

    puts("You chose: #{gets_choice}, computer chose #{computer_choice_sample}")

    display_result(gets_choice, computer_choice_sample)

    if win?(gets_choice, computer_choice_sample)
      player_score += 1
    end

    if win?(computer_choice_sample, gets_choice)
      computer_score += 1
    end

    if computer_score == 3
      prompt('The computer won 3 games and is the winner')
      break
    end

    if player_score == 3
      prompt('The Player won 3 games and is the winner. Congrats!')
      break
    end
  end

  prompt('Do you want to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing. Good Bye!')
