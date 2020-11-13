def average(i, n)
    (i + n)/2.0
end


def average_array(arr)
    arr.inject{ |sum, el| sum + el }.to_f / arr.size
end


def repeat(str, n)

    str * n

end


def yell(string)
    string.upcase + "!"

end


def alternating_case(sentence)
    words = sentence.split(" ")
    newarr = []
    words.each_with_index do |w, i|
    if i % 2 != 0
        newarr << w.downcase
    else
        newarr << w.upcase
    end

    end
    alt = newarr.join(" ")
    return alt
end

puts alternating_case("code never lies, comments sometimes do.")
