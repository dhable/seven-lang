=begin
	Week 1 - Ruby
	Day 2

	Problem: Write a simple grep that will print the lines of a file having any
	occurrences of a phrase anywhere in that line. You will need to do a simple
	regular expression match and read lines from a file. (This is surprisingly
	simple in Ruby.) If you want, include the line numbers.
=end

if ARGV.count != 2 then
	puts "Usage: ruby day2_ex3_grep.rb <file> <regex>"
else
	grep_file = File.open(ARGV[0])
	exp = Regexp.new(ARGV[1])

	grep_file.each_line do |line|
		if exp =~ line then
			puts "#{grep_file.lineno}: #{line}"
		end
	end
end