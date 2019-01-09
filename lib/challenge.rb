class Challenges
  # Given an array of integers, return indices of the two numbers such that they add up to a
  # specific target.You may assume that each input would have exactly one solution, and you
  # may not use the same element twice.
  # Example:
  # Given nums = [2, 7, 11, 15], target = 9, because nums[0] + nums[1] = 2 + 7 = 9
  # Return [0, 1].
  def indices(nums, target)
    puts "Starting indices method..."
    puts "Params: array -> #{nums}, target -> #{target}"

    catch :sum_indices do
      nums.each do |num1|
        (nums - [num1]).each do |num2|
          next unless num1 + num2 == target

          puts "Index of target sum are [#{nums.index(num1)}, #{nums.index(num2)}]"
          throw :sum_indices
        end
      end
    end
  end

  # Write a function that will flatten an array of arbitrarily nested arrays of integers into a flat
  # array of integers. e.g. [[1,2,[3]],4] → [1,2,3,4].
  # If the language you're using has a function to flatten arrays, you should pretend it doesn't
  # exist.
  def flatten(arr)
    puts "Starting flatten method..."
    puts "Params: array -> #{arr}"
    result = flat(arr).join(', ')
    puts "[#{result}]"
  end

  def flat(arr, results = [])
    arr.each do |v|
      if v.class == Array
        flat(v, results)
      else
        results << v
      end
    end
  end
end

chalenge = Challenges.new
chalenge.indices([2, 7, 11, 15], 9)
chalenge.flatten([3, [7, 6, [5, 4], 1], 2, 8, [9, 0]])
