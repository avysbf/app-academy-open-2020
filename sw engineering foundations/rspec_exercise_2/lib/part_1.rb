def partition (arr, n)
    smaller = []
    bigger = []

    arr.each do |i|
        if i >= n
            bigger << i
        else
            smaller << i
        end
    end

    return [smaller, bigger]
end

def merge (hash1, hash2)
    hash1.merge(hash2)
end


def censor(sentence, curses)
    vowels = "aeiou"
    words = sentence.split(" ")
    newsent = words.map do |w|
        if curses.include?(w.downcase)
            star(w)
        else
            w
        end
    end
    
    newsent.join(" ")
end


def star(str)
    vowels = "aeou"
    newstr = ""
    str.each_char do |c|
        if vowels.include?(c.downcase)
            newstr += "*"
        else
            newstr += c
        end
    end
    newstr
end


def power_of_two?(number)
    if number == 1 
        return true
    end

    while number > 1
        number = number/2
        if number % 2 != 0 && number != 1
            return false
        end
    end

    true
end