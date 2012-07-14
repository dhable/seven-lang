/*
	Week 4 - Scala
	Day 2

	Problem: Use foldLeft to compute the total size of a list of strings.
*/
val strings = List("a", "quick", "brown", "fox", "jumped", "over", "the", "lazy", "dog")
val strings_sum = strings.foldLeft(0) {
	(sum, s) => sum + s.size
}

println("Length of all strings in the list = " + strings_sum)