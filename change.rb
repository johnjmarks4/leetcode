# Solutions to the coin change problem using both dynamic programming and recursive strategies

def dynamic(total_amount, coins)
  combinations = Array.new(total_amount + 1).map! { |e| e = 0 }
  combinations[0] = 1

  coins.each do |coin|
    combinations.each_with_index do |_, amount|
      if amount >= coin
        combinations[amount] += combinations[amount - coin]
      end
    end
  end
  combinations
end

def recursive(amount, coins)
  if amount == 0
    return 1
  elsif amount < 0
    return 0
  else
    combos = 0
    coins.each do |coin|
      if !coins[coin].nil?
        combos += recursive(amount - coins[coin], coins)
      else
        combos += recursive(amount - coin, coins)
      end
    end
    combos
  end
end

puts "\nDynamic solution:\n"
print dynamic(12, [1, 2, 5])

puts "\n\nRecursive solution:\n"
print recursive(12, [1, 2, 5])