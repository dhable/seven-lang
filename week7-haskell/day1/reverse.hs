module Day1 where

	-- Write a function that takes a list and returns the same list
	-- in reverse.

	reverseList :: [a] -> [a]
	reverseList [] = []
	reverseList [x] = [x]
	reverseList (h:t) = reverseList t ++ [h]
