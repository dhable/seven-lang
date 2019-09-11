module Day1 where

	-- Write a function that builds two-tuples with all the possible 
	-- combinations of two of the colors black, white, blue, yellow,
	-- and red. Note that you should include only one of (black, blue)
	-- and (blue, black)

	colorCombos :: [String] -> [(String, String)]
	colorCombos colors = [(x,y) | x <- colors, y <- colors, x < y]

