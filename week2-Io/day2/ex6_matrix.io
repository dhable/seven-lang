// Week 2 - Io
// Day 2
// 
// Problem: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y)
// from the original list.

transpose := method(matrix,
	transposed_matrix := list()
	for(i, 0, matrix at(0) size - 1,
		new_row := list()
		matrix foreach(old_row, new_row push(old_row at(i)))
		transposed_matrix push(new_row)
	)
	transposed_matrix
)

print_matrix := method(matrix,
	matrix foreach(row,
		row foreach(value,
			value print
			" " print
		)
		"\n" print
	)
)

"This is the original matrix" println
org_matrix := list( list(1, 2, 3), list(4, 5, 6) )
print_matrix(org_matrix)

"\nThis is the transposed matrix" println
new_matrix := transpose(org_matrix)
print_matrix(new_matrix)
