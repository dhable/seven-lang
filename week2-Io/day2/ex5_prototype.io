// Week 2 - Io
// Day 2
// 
// Problem: Write a prototype for a two-dimensional list. The dim(x,y) method should
// allocate a list of y lists that are x elements long. set(x, y, value) should set
// a value and get(x, y) should return that value.

dim := method(x, y,
	array := list()
	for( x_i, 1, x, 
		array push(list())
		for( y_i, 1, y, array at(x_i - 1) push(nil))
	)

	array set := method(x, y, value, call target at(x - 1) atPut(y - 1, value))
	array get := method(x, y, call target at(x - 1) at(y - 1))
	array
)


// Use the 2 dimensional array to build a multiplication table
myList := dim(3, 4)
for(x, 1, 3,
	for(y, 1, 4, myList set(x, y, x * y))
)


// Print said table
for(x, 1, 3,
	for(y, 1, 4, 
		myList get(x, y) print
		" " print
	)
	"\n" print
)