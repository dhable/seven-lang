/*
	Week 4 - Scala
	Day 1

	Problem: Write a game that will take a tic-tac-toe board with X, O, and blank
	characters and detect the winner or whether there is a tie or no winner yet.
	Use classes where appropriate.
*/
class Board(current: Array[Array[String]]) {
	/*
		Constructs a new game board from an array of array's of strings. The string
		tokens can be anything but the empty string is used to denote a tile has not
		been used.
	*/
	val currentBoard = current

	/*
		This method computes the number of free tiles remaining in the board
		by looping though the array of arrays and looking for an empty string.
	*/
	def freeTiles = {
		var numFreeTiles = 0
		for(row <- 0 to 2)
			for(col <- 0 to 2)
				if(currentBoard(row)(col) == "")
					numFreeTiles += 1
		numFreeTiles 
	}

	/*
		The winner method will return the token that won or an empty string if
		there is no winner.
	*/
	def winner = {
		var winningToken = ""

		// Case 1: A player has three token aligned in a single row across the board.
		for(row <- 0 to 2) {
			if( currentBoard(row)(0) == currentBoard(row)(1) && currentBoard(row)(0) == currentBoard(row)(2))
				winningToken = currentBoard(row)(0)
		}

		// Case 2: A player has three tokens aligned in a single column in the board.
		for(col <- 0 to 2) {
			if(currentBoard(0)(col) == currentBoard(1)(col) && currentBoard(0)(col) == currentBoard(2)(col))
				winningToken = currentBoard(0)(col)
		}

		// Case 3: The player has created the top left to bottom right diagonal.
		if(currentBoard(0)(0) == currentBoard(1)(1) && currentBoard(0)(0) == currentBoard(2)(2))
			winningToken = currentBoard(0)(0)

		// Case 4: The player has created the bottom left to top right diagonal.
		if(currentBoard(0)(2) == currentBoard(1)(1) && currentBoard(0)(2) == currentBoard(2)(0))
			winningToken = currentBoard(0)(2)

		winningToken
	}

	/*
		Prints out the game status. This can be that either a player has won, nobody won or
		the game is still in progress.
	*/
	def printStatus {
		if(winner == "")
			if(freeTiles > 1)
				println("No winner yet, keep playing.")
			else
				println("Looks like nobody won.")
		else
			println("The winner is " + winner)		
	}
}


// The main logic behind the game
val gameBoard = new Board( Array(Array("", "O", "X"), Array("X", "X", "O"), Array("O", "", "O")))
gameBoard.printStatus