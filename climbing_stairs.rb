def climb_stairs(n)
  fib(n + 1, [1])[0]
end

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

print climb_stairs(35)