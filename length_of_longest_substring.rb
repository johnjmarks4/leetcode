def length_of_longest_substring(s)
  return 0 if s == ""
  ary = s.split('')
  n = 0
  subs = []
  con = []
  ary.each_with_index do |e, i|
    (ary.length).times do
      break if i > ary.length - 1
      if con.uniq.length != con.length
        n -= 1
        subs << n
        n = 0
        con = []
        break
      else
        con << ary[i]
        i += 1
        n += 1
      end
    end
  end
  if subs.empty?
    subs << ary.length
  end
  if subs.max == 1 && subs[-2..-1].uniq.length == subs[-2..-1].length
    subs << 2
  end
  subs.max
end

length_of_longest_substring("adfdafq")

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