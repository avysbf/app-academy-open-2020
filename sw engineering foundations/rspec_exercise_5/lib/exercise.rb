def zip(*arrays)
    arrays.transpose
end

def prizz_proc(arr, prc1, prc2)
    arr.select {|ele| prc1.call(ele) ^ prc2.call(ele)}
end

def nillify(arr, i)
    i.times do 
        arr.push(nil)
    end
end

def zany_zip(*arrs)
    biggest_arr_size = arrs.max{|a, b| a.size <=> b.size}.size
    arrs.each do |sbary|
        cur_size = sbary.size
        if cur_size  < biggest_arr_size
            nillify(sbary, biggest_arr_size - cur_size)
        end
    end
    arrs.transpose
end

def maximum(arr, &prc)
    return nil if arr.empty?
    largest = arr[0]
    arr.each do |ele|
        largest = ele if prc.call(ele) >= prc.call(largest)
    end
    largest
end

def my_group_by(ary, &prc)
    hash = Hash.new{|k, v| k[v] = []}
    ary.each {|e| hash[prc.call(e)] << e}
    hash
end


def max_tie_breaker(arr, proc, &blk)
    #Not the best implementation... :(
    #Would appreciate help on alternatives

    #return nil if empty array
    return nil if arr.empty?
    #avaliate if there is tie
    block_calls = arr.map {|e| blk.call(e)}
    largest = block_calls[0]
    tied = [largest]    
    block_calls.each do |val|
        if val > largest
            largest = val
            tied = [val]
        elsif val == largest
            tied << val
        end      
    end

    #if not tied, return largest. 
    if tied.size == 1
        largest_idx = block_calls.index(largest)
        return arr[largest_idx]
    else
        #if tied, call proc and avaliate if tied
        indexes = tied.map {|e| block_calls.index(e)}
        proc_calls = indexes.map {|i| proc.call(arr[i])}
        largest = proc_calls[0]
        tied = [largest]
        proc_calls.each do |val|
            if val > largest
                largest = val
                tied = [val]
            elsif val == largest
                tied << val
            end
        end
        largest_idx = proc_calls.index(tied[0]) + 1
        return arr[largest_idx]
    end
 end

 def remove_vow(word)
    vowels = 'aeiou'
    first_vow_idx = 0
    last_vow_idx = 0
    word.each_char.with_index do |c, i|
        isvow = vowels.include?(c)
        if first_vow_idx == 0 && isvow
            first_vow_idx = i
        elsif isvow
            last_vow_idx = i
        end
    end
    word[first_vow_idx..last_vow_idx]
 end

 def silly_syllables(sentence)
    vowels = 'aeiou'
    array = sentence.split(" ")

    newary = array.map do |word|
        if word.count(vowels) < 2
            word
        else
            remove_vow(word)
        end
    end

    newary.join(" ")
 end