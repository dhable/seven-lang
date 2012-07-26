=begin
	Week 1 - Ruby
	Day 1

	Bonus Problem: If you're feeling the need for a little more, write a program
	that picks a random number. Let a player guess the number, telling the player
	whether the guess is too low or too high.
=end

selected_number = rand(10)
player_guess = -1

until player_guess == selected_number
    puts "Guess what the number is: "
    player_guess = gets.to_i

    if player_guess < selected_number
        puts "higher"
    else
        puts "lower"
    end

end

puts "you guessed it"
