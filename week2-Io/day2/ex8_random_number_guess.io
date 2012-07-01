// Week 2 - Io
// Day 2
// 
// Problem: Write a program that gives you ten tries to guess a random number
// from 1-100. If you would like, give a hint of "hotter" or "colder" after
// the first guess.

stdio := File standardInput()

random_number := Random value(1, 100) floor
random_number hotter_or_colder := method(previous, current,
	pDist := ((call target) - previous) abs
	cDist := ((call target) - current) abs
	if(pDist < cDist) then(return "colder") else(return "hotter")
)

guess := nil
previous_guess := nil
10 repeat(

	"Guess a number: " println
	guess := stdio readLine asNumber

	if(guess == random_number) then(break)

	if(previous_guess != nil) then(random_number hotter_or_colder(previous_guess, guess) println)
	previous_guess = guess
)

if(guess == random_number,
	"Yay! You guessed the number" println,
	"Sorry, try again" println
)