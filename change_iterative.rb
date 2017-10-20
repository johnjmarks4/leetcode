# Solutions to the coin change problem using memoization

def iteration(amount, coins, combos)
  coins.each_with_index do |coin, i|
    total = 0
    c = coin
    until total == amount
      if total < amount
        total += c
      elsif total > amount
        total -= c
        c = coins[i-=1]
      end
    end
    combos += 1
  end
  combos + 1
end

coins = [1, 2, 5]
#memo = Array.new(coins.length + 1).map! { |e| e = 0 }
#memo[0] = 1
print iteration(12, coins, 0)