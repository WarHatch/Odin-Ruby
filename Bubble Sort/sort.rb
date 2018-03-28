def bubble_sort (data)
    switched_elements = true

    while switched_elements
        switched_elements = false
        for index in 0..(data.length-1-1) do
            if data[index] > data[index+1]
                data[index], data[index+1]  = data[index+1], data[index] 
                switched_elements = true
            end
        end
    end
    data
end

def bubble_sort_by(data)
    switched_elements = true

    while switched_elements
        switched_elements = false
        for index in 0..(data.length-1-1) do
            if yield(data[index], data[index+1]) > 0
                data[index], data[index+1]  = data[index+1], data[index] 
                switched_elements = true
            end
        end
    end
    data
end

puts "*** bubble_sort test run ***"
puts bubble_sort([4,3,78,2,0,2]).to_s
puts bubble_sort([16, 0 ,39, 100, 5, -1]).to_s
puts bubble_sort([2, 4]).to_s
puts bubble_sort([33]).to_s
puts bubble_sort([]).to_s

puts "*** bubble_sort_by test run***"
puts (bubble_sort_by(["hi","hello","hey"]) do |left,right|
    left.length - right.length
end.to_s)
puts (bubble_sort_by([4,3,78,2,0,2]) do |left, right|
    left - right
end.to_s)
puts (bubble_sort_by([66]) do |left, right|
    left - right
end.to_s)
puts (bubble_sort_by([]) do |left, right|
    left - right
end.to_s)