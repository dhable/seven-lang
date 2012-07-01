// Week 2 - Io
// Day 2
// 
// Problem: Write the matrix to a file, and read a matrix from a file.

save_matrix := method(filename, matrix,
	matrix_file := File clone openForUpdating(filename)
	matrix foreach(row,
		row foreach(value,
			matrix_file write(value asString)
			matrix_file write(" ")			
		)
		matrix_file write("\n")
	)
)

read_matrix := method(filename,
	matrix := list()
	matrix_file := File clone openForReading(filename)
	line := matrix_file readLine
	while(line != nil,
		matrix push(line splitNoEmpties(" "))
		line := matrix_file readLine
	)
	matrix
)

// Testing the functions
my_matrix := list(
	list(1, 2, 3),
	list(4, 5, 6)
)

"Saving Matrix" println
save_matrix("myMatrix", my_matrix)

"Reading Matrix" println
read_matrix("myMatrix") println