def max_sub_array(ary)
  sols = []
  ary.each_with_index do |_, num1|
    ary.reverse.each_with_index do |_, num2|
      searched = ary[num1..num2].inject(:+)
      sols << searched if !searched.nil?
    end
  end
  sols.max
end

print max_sub_array([-2,1,-3,4,-1,2,1,-5,4])