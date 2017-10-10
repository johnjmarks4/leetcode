public

def substring(s)
  return "" if s == ""
  return s if s.size == 1
  solutions = []
  temp = []
  subs = []
  ary = s.split('')
  ary.each_with_index do |char, i|
    temp << char
    if temp.uniq.length != temp.length
      subs << temp.slice(temp.index(char), i + 1)
    end
  end
  return "" if subs.empty?
  subs.select! { |s| palindromic?(s) }
  subs.max_by { |s| s.length }.join
end

def palindromic?(subs)
  if subs.length <= 1
    return subs
  else
    palindromic?(subs[1..-1]) == palindromic?(subs.reverse[1..-1])
  end
end

def solution_test(char_length, test_size)
  alpha = ("a".."z").to_a
  all_pals = []
  test_size.times do
    z_num = rand(1..char_length - 2)
    sub_size = char_length - z_num
    pal1 = make_pal(sub_size, alpha)
    pal2 = make_pal(sub_size, alpha)
    all_pals << (pal1 + "z" + pal2)
  end
  all_pals.each do |s|
    puts substring(s)
  end
end

def make_pal(sub_size, alpha)
  string = ""
  string = ""
  sub_size.times do
    letter = alpha[rand(0..25)]
    string << letter
  end
  string + string.reverse
end

solution_test(6, 4)