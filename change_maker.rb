def change_maker(amount, coins, memo, total)
  if coins.length < 1
    memo
  else
    until total >= amount
      total += coins[-1]
      memo[coins.length - 1] += 1
    end
    memo[coins.length - 1] -= 1
    total -= coins[-1]
    change_maker(amount, coins[0..-2], memo, total)
  end
end

coins = [1, 2, 5]
memo = Array.new(coins.length).map! { |e| e = 0 }
memo[0] = 1
total = 0
print change_maker(12, coins, memo, total)