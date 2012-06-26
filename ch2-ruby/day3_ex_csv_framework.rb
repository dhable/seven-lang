# Week 1 - Ruby
# Day 3
#
# Problem: Modify the CSV application to support an each method to return a CsvRow
# object. Use method_missing on that CsvRow to return the value for the column for
# a given heading.

module ActsAsCsv
	def self.included(base)
		base.extend ClassMethod
	end

	module ClassMethod
		def acts_as_csv
			include InstanceMethods
		end
	end

	module InstanceMethods
		def read
			@csv_contents = []
			filename = self.class.to_s.downcase + ".txt"
			file = File.new(filename)
			@headers = file.gets.chomp.split(", ")

			file.each do |row|
				@csv_contents << CsvRow.new( @headers, row.chomp.split(", "))
			end
		end

		attr_accessor :headers, :csv_contents
		def initialize
			read
		end

		def each &block
			@csv_contents.each do |row| 
				block.call row
			end
		end
	end

	class CsvRow
		def initialize(headers=[], data=[])
			@row_data = Hash.new
			headers.each_index { |i| @row_data[headers[i]] = data[i] }
		end

		def method_missing name, *args
			# name at this point is of type symbol, not string. Need to
			# convert this to a string since the hash we have only holds
			# strings
			@row_data[name.to_s]
		end
	end
end

class Day3Csv
	include ActsAsCsv
	acts_as_csv
end

csv = Day3Csv.new
csv.each { |row| puts row.one }