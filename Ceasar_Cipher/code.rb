Alphabet_lowercase = "abcdefghijklmnopqrstuvwxyz";
Alphabet_uppercase = Alphabet_lowercase.upcase

Max_shift = (Alphabet_lowercase.size)

Numerals = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

lowercase_loop = Alphabet_lowercase.split('') * 2
uppercase_loop = Alphabet_uppercase.split('') * 2
numeral_loop = Numerals * (Max_shift / 10 + 1)

Full_loop = lowercase_loop + uppercase_loop + numeral_loop;
puts Full_loop.to_s

puts "Welcome to Ceaser Cipher! Please write a  s e c r e t  message:\n"
message = gets.chomp
message = message.split('')
# puts "message array:\n#{message}\n"

shift = 0;
loop do
    puts "How many letters should we SHIFT?\n"
    shift =  gets.chomp.to_i

    if shift < 0
        shift = Max_shift + shift
    end

    break if shift < Max_shift

    puts "The shift is larger than the alphabet"
end

# puts "Shifting by " + shift.to_s

# message.map! do |symbol|
#     Full_loop.each do |alphabet_symbol| 
#         if symbol == alphabet_symbol
#             symbol = (symbol.ord + shift).chr
#             break
#         end
#     end
#     symbol
# end

message.map! do |symbol|
    alphabet_index = Full_loop.index(symbol)

    if (alphabet_index != nil)
        symbol = Full_loop[alphabet_index+shift]
    end

    symbol
end

puts message.join('')