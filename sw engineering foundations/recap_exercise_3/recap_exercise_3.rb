require 'set'

def no_dupes?(arr)
    arr.to_set.to_a
end


def no_consecutive_repeats?(arr)
    arr.each_cons(2) do |e|
        if e[0] == e[1]
            return false
        end
    end
    true
end

def char_indices(str)
    indices = Hash.new {|k, v| k[v] = []}
    str.each_char.with_index do |c, i|
        indices[c] << i
    end
    indices
end

def longest_streak(str)
    occurs = Hash.new(0)
    str.each_char do |c|
        occurs[c] += 1
    end
    array = occurs.reverse_each.to_h.max_by {|k, v| v}
    newstr = array[0] * array[1]
end

def prime?(n)
    return false if n < 2
    (2...n).none? { |i| n % i == 0}
end    



def bi_prime?(num)
    prime_factors = []
    (2..num).each do |i|
        if prime?(i) && num % i == 0
            prime_factors << i
        end
    end
    
    prime_factors.any? do |j| 
        prime_factors.include?(num/j)
    end
end


def vigenere_cipher(message, keys)
    alphabet = ('a'..'z').to_a
    cypher = ""
    i = 0
    turns = keys.size

    message.each_char do |char|
        new_alpha_idx = alphabet.index(char) + keys[i % turns]
        newchar = alphabet[new_alpha_idx % 26]
        cypher += newchar
        i += 1
    end

    cypher
end


def vowel_rotate(str)
    vowels = 'aeiou'
    vowels_indices = []
    str.each_char.with_index do |c, i|
        if vowels.include?(c)
            vowels_indices << i
        end
    end
    newstr = str[0..str.length]
    new_vow_idx = vowels_indices.rotate(-1)
    vowels_indices.each_with_index do |idx, i|
        newvow = str[new_vow_idx[i]]
        newstr[idx] = newvow
    end
    newstr    
end


## Proc Problems

class String
    def select(&prc)
        return "" if prc.nil?
        newstr = ""
        self.each_char do |c|
            if prc.call(c)
                newstr += c
            end
        end
        newstr
    end

    def map!(&prc)
        self.each_char.with_index do |c,i|
            self[i] = prc.call(c)
        end
        self
    end
end

## Recursion Problems

def multiply(a, b)
    if a < b 
        return multiply(b, a)
    elsif b > 0
        return a + multiply(a, b-1)
    elsif b < 0
        return -a + multiply(a, b+1)
    else 
        return 0
    end
end

def lucas_sequence(len)
    return [] if len == 0
    return [2] if len == 1
    return [2, 1] if len === 2

    x = lucas_sequence(len - 1)
    return x.push(x[-1] + x[-2])
end

def recursive_prime?(n, i = 2)
    return true if n == 2
    return false if n < 2
    return true if i * i > n

    if n % i === 0
        return false
    else
        recursive_prime?(n, i + 1)
    end
end


def prime_factorization(n)
    (2...n).each do |fact|
        if num % fact == 0
            other_fact = n / fact
            return [*prime_factorization(fact), *prime_factorization(other_fact)]
        end
    end

    return [ n ]
end