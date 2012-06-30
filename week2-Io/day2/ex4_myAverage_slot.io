// Week 2 - Io
// Day 2
// 
// Problem: Add a slot called myAverage to a list that computes the average of all the
// numbers in a list. What happens if there are no numbers in a list? (Bonus: Raise an
// Io exception if any item in the list is not a number.)

first_digits := list(1, 2, 3, 4, 5, 6, 7, 8, 9)
first_digits myAverage := method((call target reduce(+)) / (call target size))
"Calculating the average of the digits 1-9 using myAverage" println
first_digits myAverage println

// Now with an empty list, this will cause my divide operation to fail. This is
// caused by `call target reduce(+)` evaluating to nil and nil doesn't implement
// the slot /.

// Bonus: Fix the implementation to handle both empty list and any item
// that isn't a number.
List myAverage := method(
	if(call target size == 0) then (return nil)
	sum := 0
	call target foreach(value, if(value type == "Number", sum = sum + value, Exception raise("can only average list of numbers")))
	sum / (call target size)
)

simple_number := list(1,2,3)
"Calculating the average of digits 1-3 with improved myAverage" println
simple_number myAverage println

nil_list := list()
"Calculating the average of an empty list with improved myAverage" println
nil_list myAverage println

mixed_list := list(1, "two", 3)
"Calculating the average of a mixed data type list with improved myAverage" println
mixed_list myAverage println