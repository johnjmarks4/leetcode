# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  ary = s.split('')
  subs = []
  ary.each_with_index do |e, i|
    ary[i+1..-1].each_with_index do |f, j|
      j += i + 1
      if s[i..j].split('').uniq.length == s[i..j].split('').length
        subs << s[i..j]
      end
    end
  end
  return 0 if ary[0].nil?
  subs << ary[0] if subs.empty?
  subs.max_by(&:length).length
end

alph = ("a".."z").to_a

900.times do
  s = ""
  rand(1..50).times do
    s += alph[rand(0..25)]
  end
  puts length_of_longest_substring(s)
end