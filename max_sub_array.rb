require 'test/unit'

class ArrayOperation
	def self.max_subarray(array)
		temp_max_ending_here = max_ending_here = max_so_far = start_index = end_index = 0
		array.each_with_index do |item, index|
			max_ending_here = [0, max_ending_here + item].max

	  		start_index = index  if temp_max_ending_here.eql?(0) && !max_ending_here.eql?(0)
	  		temp_max_so_far = max_so_far
	        max_so_far = [max_so_far, max_ending_here].max
	        end_index = index if max_so_far > temp_max_so_far
	        temp_max_ending_here = max_ending_here
		end
		puts 'Largest SubArray'
		puts "Start Index: #{start_index}"
		puts "Length: #{array[start_index..end_index].length}"
		puts "Sum: #{max_so_far}"
		puts "Elements: #{array[start_index..end_index].join(' ')}"
		return [start_index,end_index,max_so_far]
	end
end


def get_array
	print 'Enter the array : '
	array = gets.chomp.split.map(&:to_i)
	ArrayOperation.max_subarray(array)
end

class ArrayOperationTest < Test::Unit::TestCase
  	def self.test_max_sub_array
		array = [-2, 1, -3, -4, -1, 2, 1, -5, -4]
		start_index,end_index,max_sum = ArrayOperation.max_subarray(array)
		assert(start_index == 3)
	  	assert(end_index == 6)
	  	assert(max_sum == 6)
	end
end

get_array