def two_sum(nums, target)
  nums.each_with_index do |e, x|
    y = x + 1
    return [x, y] if e + nums[y] == target
    while y <= nums.length - 1
      return [x, y] if e + nums[y] == target
      y += 1
    end
  end
end

print two_sum([-3,4,3,90], 0)