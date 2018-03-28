# NOTICE: A different issue has been solved than the one requested.

def substrings (sentence, dictionary)
    #Prefilled hash lets us search for words(keys) in hash
    dictionary_hash = Hash[dictionary.product([0])]
    puts dictionary_hash.to_s
      
    words = sentence.split(' ')
    words.each do |word|
        query_word = word
        for deleted_characters in 0..(word.length - 1) do
            puts "Remaining word: #{query_word}"
            if dictionary_hash.key?(query_word)
                dictionary_hash[query_word] += 1
                puts dictionary_hash[query_word].to_s
            end

            #Removes last letter from string by poping it from array
            word_array = query_word.split('')
            word_array.pop
            query_word = word_array.join
        end
    end

    #Cleans up all the unfound words
    dictionary_hash.each do |word, count|
        if count < 1 
            dictionary_hash.delete(word)
        end
    end
    puts dictionary_hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("going below the bridge", dictionary)