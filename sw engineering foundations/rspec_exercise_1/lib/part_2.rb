def hipsterfy(str)
    vowels = "aeiou"
    i = str.size - 1

    while i >= 0
        if vowels.include?(str[i])
            str = str[0...i] + str[i+1..-1]
            break
        end
        i -= 1
    end

    str
end


def vowel_counts(string)
    hash = Hash.new(0)
    vowels = "aeiou"
    str = string.downcase

    str.each_char do |c|
        if vowels.include?(c)
            hash[c] += 1
        end
    end

    return hash
end


def caesar_cipher (msg, n)

    alpha = "abcdefghijklmnopqrstuvwxyz"

    cryp = msg.chars.map.with_index do |c, i|
        if alpha.include?(c)
            oldidx = alpha.index(c)
            newidx = (oldidx + n) % 26
            alpha[newidx]
        else
            c
        end
    end
    return cryp.join
end