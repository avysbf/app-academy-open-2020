

def select_even_nums(arr)
    arr.select(&:even?)
end


def reject_puppies(dogs)
    dogs.reject {|dog| dog["age"] <= 2}
end

def count_positive_subarrays(array)
    array.count { |arr| arr.sum > 0 }
end

def aba_translate(word)
    vowels = "aeiou"
    translated = []
    word.each_char do |char|
        translated << char
        if vowels.include?(char)
            translated << "b"
            translated << char
        end
    end
    translated.join("")
end


def aba_array(arr)
    arr.map{|word| aba_translate(word)}
end