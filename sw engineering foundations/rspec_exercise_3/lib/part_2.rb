def element_count(array)
    counter = Hash.new(0)
    array.each {|ele| counter[ele] += 1}
    counter
end

def char_replace!(str, hash)
    hash.each do |k, v|
        if str.include?(k)
            str.each_char.with_index {|c, i| str[i] = v if c == k }
        end
    end
    str
end

def product_inject(arr)
    arr.inject {|acc, n| acc * n}
end