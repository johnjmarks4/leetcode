def max_sub(ary)
  sols = []
  ary.each_with_index do |_, num1|
    ary.reverse.each_with_index do |_, num2|
      searched = ary[num1..num2]
      sols << searched if !searched.empty?
    end
  end
  sols.max_by { |e| e.inject(:+) }
end

print max_sub([-2,1,-3,4,-1,2,1,-5,4])