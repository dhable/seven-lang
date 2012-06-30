// Week 2 - Io
// Day 2
// 
// Problem: A Fibonacci sequence starts with two 1s. Each subsequent number
// is the sum of the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21,
// and so on. Write a program to find the nth Fibonacci number. fib(1) is 1
// and fib(4) is 3. As a bonus, solve the problem with recursion and with
// loops.


// Using recursion
rFib := method(nth, 
	if(nth == 1 or nth == 2,
	   return 1,
	   return (rFib(nth - 2) + rFib(nth - 1))
	)
)

// Check the answers for the first 8
"Checking first 8 digits using rFib" println
for(i, 1, 8, rFib(i) print " " print)
"\n" println


// Using loops
lFib := method(nth,
	nth_minus_two := 1
	nth_minus_one := 1
	i := 3
	while( i <= nth,
		   (new := nth_minus_two + nth_minus_one)
		   (nth_minus_two = nth_minus_one)
		   (nth_minus_one = new)
		   (i = i + 1)
	)
	return nth_minus_one
)

// Check the answers for the first 8
"Checking first 8 digits using lFib" println
for(i, 1, 8, lFib(i) print " " print)
"\n" println