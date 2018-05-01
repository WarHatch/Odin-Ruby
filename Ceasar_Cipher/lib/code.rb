class CeasarCypher  
    attr_reader :Max_shift
    
    def initialize
        @Alphabet_lowercase = "abcdefghijklmnopqrstuvwxyz"
        @Alphabet_uppercase = @Alphabet_lowercase.upcase
        @Max_shift = @Alphabet_lowercase.size
        @Numerals = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].freeze

        lowercase_loop = @Alphabet_lowercase.split('') * 2
        uppercase_loop = @Alphabet_uppercase.split('') * 2
        numeral_loop = @Numerals * (@Max_shift / 10 + 1)

        @Full_loop = lowercase_loop + uppercase_loop + numeral_loop;
    end

    def launch
        puts "Welcome to Ceaser Cipher! Please write a  s e c r e t  message:\n"
        message = get_text gets

        puts "How many letters should we SHIFT?\n"
        unchecked_shift = gets.chomp.to_i
        checked_shift = check_cypher(unchecked_shift)
        cyphered_message = cypher message, checked_shift
    end

    def get_text(input)
        message = input.chomp
        message = message.split('')
        # puts "message array:\n#{message}\n"
    end

    # Makes sure shift number is in bounds of our alphabet
    def check_cypher(shift)
        while shift < 0
            shift = @Max_shift + shift
        end
        while shift > @Max_shift
            shift = shift - @Max_shift
        end

        puts "Shifting by " + shift.to_s
        shift
    end

    # returns an encrypted string
    def cypher(message, shift)
        message.map! do |symbol|
            alphabet_index = @Full_loop.index(symbol)

            if (alphabet_index != nil)
                symbol = @Full_loop[alphabet_index+shift]
            end

            symbol
        end

        message = message.join('')
        puts message
        message
    end
end

# launch code:
# thing = CeasarCypher.new
# thing.launch