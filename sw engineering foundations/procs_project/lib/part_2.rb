def reverser (str, &prc)
    prc.call(str.reverse)
end

def word_changer (sentence, &prc)
    arr = sentence.split
    newarr = arr.map { |ele| prc.call(ele)}
    newarr.join(" ")
end

def greater_proc_value (num, prc1, prc2)
    a = prc1.call(num)
    b = prc2.call(num)
    a > b ? a : b
end

def and_selector (arr, prc1, prc2)
    newarr = []
    arr.each { |ele| newarr << ele if prc1.call(ele) && prc2.call(ele) }
    newarr
end

def alternating_mapper (arr, prc_even, prc_odd)
    newarr = []
    arr.each_with_index do |ele, i|
        if i.even?
            newarr << prc_even.call(ele)
        else
            newarr << prc_odd.call(ele)
        end
    end
    newarr
end