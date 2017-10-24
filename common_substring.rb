def substring(str1, str2)
  ary1 = str1.split('')
  ary2 = str2.split('')
  i = 0
  longest = ""

  ary1.each_with_index do |char1, i|
    ary2.each_with_index do |char2, f|
      x, y = i + 2, f + 2
      if ary1[i..i+1] == ary2[f..f+1]
        subs = ary1[i..i+1]
        until ary1[x] != ary2[y]
          subs << ary1[x]
          x += 1
          y += 1
        end
        longest = subs if subs.length > longest.length
      end
    end
  end
  longest
end

print substring("ABABC", "BABCA")