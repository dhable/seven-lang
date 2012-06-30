// Week 2 - Io
// Day 2
// 
// Problem: Write a program to add up all the numbers in a two-dimensional array.

sumList := method(twoDimList,
	sum := 0
	twoDimList foreach(row, row foreach(value, sum = sum + value))
	sum
)

phone_pad := list( list(1,2,3), list(4,5,6), list(7,8,9) )
sumList(phone_pad) println