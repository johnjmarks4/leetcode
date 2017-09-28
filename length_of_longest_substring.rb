def length_of_longest_substring(s)
  return 0 if s == ""
  ary = s.split('')
  subs = []
  dups = []
  i = 0
  x = 0
  ary.each do |e|
    next if dups.include?(e)
    if ary.count(e) > 1
      dups << e
      x += 1
      until dups.include?(ary[i+=1]) || i > ary.length - 1
        dups << e if ary.count(ary[i]) > 1
        x += 1
      end
      subs << x
      x = 0
    else
      x += 1
      i += 1
    end
  end
  subs << x if x != 0
  subs = [1] if subs.empty?
  subs.max
end

print length_of_longest_substring("abba")

#alph = ("a".."z").to_a

=begin
900.times do
  s = ""
  rand(1..50).times do
    s += alph[rand(0..25)]
  end
  puts length_of_longest_substring(s)
end
=end