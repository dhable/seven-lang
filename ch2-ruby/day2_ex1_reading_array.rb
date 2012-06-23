numbers = (1..16)


# Print the contents of the array, four numbers at a time
# only using the each method.
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

# Print the same contents using the Enumerable#each_slice
# method instead
puts "outputting numbers in blocks of 4 using each_slice"
numbers.each_slice(4) { |s| p s }