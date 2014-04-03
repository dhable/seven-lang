module Main where

	-- Write a list comprehension to build a childhood multiplication
	-- table. The table would be a list of three-tuples where the first
	-- two are integers from 1-12 and the third is the product of the
	-- first two.

	makeTable :: [(Integer, Integer, Integer)]
	makeTable = [(x, y, x * y) | x <- [1..12], y <- [1..12]]
