def my_map(arr, &prc)
    newarr = []
    arr.each { |ele| newarr << prc.call(ele) }
    newarr
end

def my_select(arr, &prc)
    newarr = []
    arr.each { |ele| newarr << ele if prc.call(ele) }
    newarr
end

def my_count(arr, &prc)
    ctr = 0
    arr.each { |ele| ctr += 1 if prc.call(ele)}
    ctr
end

def my_any?(arr, &prc)
    arr.each {|ele| return true if prc.call(ele)}
    false
end

def my_all?(arr, &prc)
    arr.each {|ele| return false if prc.call(ele) == false}
    true
end

def my_none?(arr, &prc)
    arr.each {|ele| return false if prc.call(ele) == true}
    true
end