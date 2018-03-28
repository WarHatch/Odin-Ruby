module Enumerable
    def my_each
        for index in 0..self.length-1 do
            yield(self[index])
        end
        self
    end

    def my_each_with_index
        for index in 0..self.length-1 do
            yield(self[index], index)
        end
        self
    end

    # def my_select
    #     return_collection = Array.new

    #     for index in 0..self.length-1 do
    #         return_collection.push(self[index]) if yield(self[index])
    #     end
    #     return_collection
    # end

    def my_select
        return_collection = Array.new

        self.my_each {|element| return_collection.push(element) if yield(element)}
        return_collection
    end

    def my_all?
        result = true

        self.my_each {|element| return result = false if yield(element) == false}
        result
    end

    def my_any?
        result = false

        self.my_each {|element| return result = true if yield(element) == true}
        result
    end

    def my_none?
        result = true

        self.my_each {|element| return result = false if yield(element) == true}
        result
    end

    def my_count (*obj)
        count = 0

        if obj.size == 1
            self.my_each {|element| count+=1 if element == obj[0] }
            # puts "element #{element} =? object #{obj}"}
        elsif !block_given?
            self.my_each {|element| count+=1 }
        else
            self.my_each {|element| count+=1 if yield(element) == true}
        end
        count
    end

    def my_map (proc = nil)
        return_collection = Array.new

        if proc != nil
            self.my_each do |element|
                return_collection.push(proc.call(element))
            end
        else
            self.my_each do |element|
                return_collection.push(yield(element))
            end
        end
        return_collection
    end

    #TODO operator passed
    #TODO initial value passed
    def my_inject 
        memo = 0
        self.my_each do |element|
            memo = yield(memo, element)
            puts "memo, element: #{memo}, #{element}"
        end
        memo
    end
end

randomarray = [3,2,1, :John]
numberarray = [1, 4 ,65 ,4 ,2]
evennumberarray = [0,2,4,6,8,10]
oddnumberarray = [1, 5, 99]
wordsarray = ["I'm", "Afraid", "I", "Cannot", "let", "you", "do", "that", "John"]

puts "*** Each ***"
randomarray.my_each do |elem|
    print "#{elem} "
end
puts

puts "*** Each with index ***"
randomarray.my_each_with_index do |elem, index|
    print "#{index}. #{elem} | "
end
puts

puts "*** Select ***"
result = numberarray.my_select do |elem|
    elem % 2 == 0
end
print result.join(',')
puts

puts "*** All? ***"
result = numberarray.my_all? do |elem|
    elem % 2 == 0
end
print result
puts

result = evennumberarray.my_all? do |elem|
    elem % 2 == 0
end
print result
puts

puts "*** Any? ***"
result = numberarray.my_any? do |elem|
    elem % 2 == 0
end
print result
puts

result = oddnumberarray.my_any? do |elem|
    elem % 2 == 0
end
print result
puts

puts "*** None? ***"
result = numberarray.my_none? do |elem|
    elem % 2 == 0
end
print result
puts

result = oddnumberarray.my_none? do |elem|
    elem % 2 == 0
end
print result
puts

puts "*** Count ***"
puts "data: #{numberarray.to_s}"
result = numberarray.my_count do |elem|
    elem % 2 == 0
end
puts "elem % 2 == 0"
puts "my_count = #{result}"

puts "count number of elements"
result = numberarray.my_count
puts "my_count = #{result}"

puts "count the fours"
result = numberarray.my_count(4)
puts "my_count = #{result}"

puts "*** Map ***"
puts "b l o c k"
result = numberarray.my_map do |elem|
    elem - 100
end
print result
puts

puts "p r o c"
my_proc = Proc.new { |elem| elem - 100 }
result = numberarray.my_map(&my_proc)
print result
puts

puts "*** Inject ***"
fivetoten = [5,6,7,8,9,10]
result = fivetoten.my_inject do |sum, n|
    sum + n
end
print result
puts

my_wordarray = %w{ cat sheep bear cow dogs}
result = my_wordarray.inject do |memo, word|
    memo.length > word.length ? memo : word
end
print result
puts