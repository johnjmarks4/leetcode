require 'benchmark'

def longest_palindrome(string)
  right = expanding_center(string)
  left = expanding_center(string.reverse)
  return string[0] if right.nil? && left.nil?
  return right if left.nil?
  return left if right.nil?
  right > left ? right : left
end

def expanding_center(string)
  return "" if string == ""
  ary = string.split('')
  pals = []
  pointer = ary.length / 2

  ary[pointer..-1].each_with_index do |_, i|

    last = (ary.length - pointer) + i

    if ary[pointer] == ary[last]
      palin = ""
      drome = string[pointer+1..last-1]
      l, po = last, pointer

      until ary[po] != ary[l]
        palin << ary[po]
        drome << ary[l]
        po -= 1
        l += 1
      end

      pals << palin.reverse + drome #if !palin.nil? && !drome.nil?
    end
  end
  middle = string[(string.length / 2) - 2..(string.length / 2) + 2]
  pals << middle if middle[0] == middle[-1]

  pals.max_by(&:length)
end

def benchmark(run, string)
  value = Benchmark.measure { run.times { longest_palindrome(string) } }
  avg_run_time = value / run
end

str = "ba" * 500
str[rand(0..str.length - 1)] = "zql"
#str = "babadada"
#print benchmark(1, str)
print longest_palindrome(str)