def length_of_longest_substring(s)
  return 0 if s == ""
  solutions = []
  temp = []
  ary = s.split('')
  chars = 0
  x = 0
  while x < ary.length
    chars += 1
    temp << ary[x]
    x += 1
    if temp.uniq.length != temp.length
      chars -= 1
      temp.shift
      solutions << chars
    end
  end
  solutions << chars if chars != 0
  solutions.max
end

print length_of_longest_substring("abba")