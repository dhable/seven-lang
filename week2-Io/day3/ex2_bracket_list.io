// Week 2 - Io
// Day 3
//
// Create a list syntax that uses brackets.

squareBrackets := method(
	new_list := list()
	call message arguments foreach(arg,
		new_list push(doMessage(arg))
	)
	new_list
)

f := File with("ex2_list.txt") openForReading contents
ex2_list := doString(f)
ex2_list println