selected_number = rand(10)
player_guess = -1

until player_guess == selected_number
    puts "Guess what the number is: "
    player_guess = gets().to_i

    if player_guess < selected_number
        puts "higher"
    else
        puts "lower"
    end

end

puts "you guessed it"
