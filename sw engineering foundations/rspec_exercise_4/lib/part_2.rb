def proper_factors(num)
    halfway = (num/2) + 1
    (1..halfway).select {|i| num % i == 0 }
end

def aliquot_sum(n)
    proper_factors(n).sum
end

def perfect_number?(i)
    aliquot_sum(i) == i
end

def ideal_numbers(n)
    ideals_found = 0
    cur_num = 6
    ideals_arr = []
    while n != ideals_found
        if perfect_number?(cur_num)
            ideals_arr << cur_num 
            ideals_found += 1
        end

        cur_num += 1
    end
    ideals_arr 
end