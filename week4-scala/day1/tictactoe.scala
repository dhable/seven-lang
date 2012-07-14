/*
	Week 4 - Scala
	Day 1

	Problem: Write a game that will take a tic-tac-toe board with X, O, and blank
	characters and detect the winner or whether there is a tie or no winner yet.
	Use classes where appropriate.
*/
class Board(current: Array[Array[String]]) {
	val currentBoard = current

	def freeTiles = {
		var numFreeTiles = 0
		for(row <- 0 to 2)
			for(col <- 0 to 2)
				if(currentBoard(row)(col) == "")
					numFreeTiles += 1
		numFreeTiles 
	}

	def winner = {
		var winningToken = ""

		for(row <- 0 to 2) {
			if( currentBoard(row)(0) == currentBoard(row)(1) && currentBoard(row)(0) == currentBoard(row)(2))
				winningToken = currentBoard(row)(0)
		}

		for(col <- 0 to 2) {
			if(currentBoard(0)(col) == currentBoard(1)(col) && currentBoard(0)(col) == currentBoard(2)(col))
				winningToken = currentBoard(0)(col)
		}

		if(currentBoard(0)(0) == currentBoard(1)(1) && currentBoard(0)(0) == currentBoard(2)(2))
			winningToken = currentBoard(0)(0)

		if(currentBoard(0)(2) == currentBoard(1)(1) && currentBoard(0)(2) == currentBoard(2)(0))
			winningToken = currentBoard(0)(2)

		winningToken
	}

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