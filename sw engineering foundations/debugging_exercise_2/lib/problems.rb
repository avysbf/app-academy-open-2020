# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def prime?(n)
    return false if n < 2
    (2...n).none? { |i| n % i == 0}
end

def largest_prime_factor(num)
    (num).downto(2) do  |factor|
        return factor if num % factor == 0 && prime?(factor)
    end
end

def unique_chars?(word)
    already_seen = []

    word.each_char do |c|
        return false if already_seen.include?(c)      
        already_seen << c
    end
    true
end


def dupe_indices(array)
    indices = Hash.new { |h, k| h[k] = [] }
    array.each_with_index do |ele, i|
        indices[ele] << i
    end
    indices.select {|k, v| v.length > 1}
end

def elecount(arr)
    count = Hash.new(0)
    arr.each { |ele| count[ele] += 1}
    count
end

def ana_array(arr1, arr2)
    count1 = elecount(arr1)
    count2 = elecount(arr2)
    count1 == count2
end
