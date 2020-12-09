def my_reject (arr, &prc)
    arr.select {|ele| !prc.call(ele)}
end


def my_one? (arr, &prc)
    flag = 0
    arr.each do |ele|
        flag += 1 if prc.call(ele)
        return false if flag > 1
    end
    flag == 0 ? false : true
end


def hash_select (h, &prc)
    new_h = Hash.new
    h.each do |k, v|
        new_h[k] = v if prc.call(k, v)
    end
    new_h
end


def xor_select (arr, prc1, prc2)
    arr.select {|ele| prc1.call(ele) ^ prc2.call(ele)}
end

def proc_count (val, prc_arr)
    ctr = 0
    prc_arr.each do |prc|
        ctr += 1 if prc.call(val)
    end
    ctr
end