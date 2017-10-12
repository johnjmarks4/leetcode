public

# optimize with dynamic programming 

def longest_palindrome(s)
  return "" if s == ""
  ary = s.split('')
  subs = []
  ary.each_with_index do |e, start|
    if ary.count(e) > 1
      finish = -1
      until start + finish.abs >= ary.length
        if e == ary[finish]
          subs << ary[start..finish]
        end
        finish -= 1
      end
    end
  end
  subs.select! { |e| palindrome?(e) }
  longest = subs.max_by(&:length)
  return s[0] if longest.nil?
  longest.join
end

def palindrome?(e)
  e == e.reverse
end

print longest_palindrome("bb")