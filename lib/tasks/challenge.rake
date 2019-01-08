namespace :challenge do
  # Given an array of integers, return indices of the two numbers such that they add up to a
  # specific target.You may assume that each input would have exactly one solution, and you
  # may not use the same element twice.
  # Example:
  # Given nums = [2, 7, 11, 15], target = 9, because nums[0] + nums[1] = 2 + 7 = 9
  # Return [0, 1].
  desc "rake challenge:sum_indices['2 7 11 15',9]"
  task :sum_indices, [:nums, :target] => :environment do |_, args|
    nums = args[:nums].split(' ').map(&:to_i)
    target = args[:target].to_i

    nums.each do |num1|
      (nums - [num1]).each do |num2|
        next unless num1 + num2 == target

        puts "Index of target sum are [#{nums.index(num1)}, #{nums.index(num2)}]"
      end
    end
  end
end
