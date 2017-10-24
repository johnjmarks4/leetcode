require 'benchmark'

# Finds the fibonacci sequence up to n numbers using memoization

def fib(n, memo)
  if n <= 0
    return n
  elsif n <= 1
    return n
  elsif n <= memo.length
    return [memo[n-1], memo]
  else
    temp_fib = (fib(n-1, memo)[0] + fib(n-2, memo)[0])
    memo << temp_fib
    [temp_fib, memo]
  end
end

memo = [1]

print fib(35, memo)
#print Benchmark.measure { fib(35, memo) }

=begin
loop do
  number = gets.chomp!.to_i
  result = fib(number, memo)
  memo = result[1] if result[1] != 0
  puts "The fibonacci sequence up to #{number} numbers:"
  puts memo[0..number-1].inspect
end

=end