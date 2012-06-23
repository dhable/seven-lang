# Week 1 - Ruby
# Day 2
#
# Problem: Print the contents of an array of sixteen numbers, four
# numbers at a time, using just each. Now, do the same with each_slice
# in Enumerable.

numbers = (1..16)
puts "outputting numbers in blocks of 4 using only each"
tmp = []
numbers.each do |v|
	tmp.push v
	if tmp.count > 3
		p tmp
		tmp = []
	end
end

puts
puts

puts "outputting numbers in blocks of 4 using each_slice"
numbers.each_slice(4) { |s| p s }