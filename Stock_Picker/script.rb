def stock_picker (prices)
    puts "Input: #{prices.to_s}"
    buy_day = -1
    sell_day = -1
    profit = 0

    iterations = prices.length - 1
    for days_passed in 0..iterations do
        buy_price = prices[0]

        #Before we check the remaining prices
        highest_price = buy_price 
        highest_day = days_passed

        # puts "#{days_passed}. prices: #{prices.join(',')}"

        prices.each_with_index do |sell_price, remaining_day|
            if sell_price > highest_price
                highest_price = sell_price
                highest_day = remaining_day + days_passed
            end
        end

        # puts "#{days_passed}. #{highest_price} - #{buy_price}"
        if (highest_price - buy_price > profit)
            profit = highest_price - buy_price
            buy_day = days_passed
            sell_day = highest_day

    #         puts "#{days_passed}. So far the best option is:
    # buy_day = #{buy_day}
    # sell_day = #{sell_day}
    # profit = #{profit}"
        end

        prices.shift(1)
    end #Next day
    [buy_day, sell_day]
end

puts "*** Stock Picker test-run: ***\n"
@Stock_data = [17,3,6,9,15,8,6,1,10]
buy_and_sell_days = stock_picker(@Stock_data)
puts buy_and_sell_days.to_s

test_data = []
buy_and_sell_days = stock_picker(test_data)
puts buy_and_sell_days.to_s

test_data = [1]
buy_and_sell_days = stock_picker(test_data)
puts buy_and_sell_days.to_s

test_data = [10, 10]
buy_and_sell_days = stock_picker(test_data)
puts buy_and_sell_days.to_s

test_data = [15, 14 , 13, 12]
buy_and_sell_days = stock_picker(test_data)
puts buy_and_sell_days.to_s

test_data = [16, 9 ,8 ,1, 15, 20 ,2]
buy_and_sell_days = stock_picker(test_data)
puts buy_and_sell_days.to_s