module Main where
	-- How many different ways can you find to write allEven?

	-- The base case from the text
	allEven :: [Integer] -> [Integer]
	allEven [] = []
	allEven (h:t) = if even h then h:allEven t else allEven t


	-- Using the list appending operation
	allEven2 :: [Integer] -> [Integer]
	allEven2 [] = []
	allEven2 (h:t) = if even h then [h] ++ allEven t else allEven t


	-- Using filters
	allEven3 :: [Integer] -> [Integer]
	allEven3 l = filter even l


	-- List comprehension
	allEven4 :: [Integer] -> [Integer]
	allEven4 l = [x | x <- l, even x]

