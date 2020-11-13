def all_words_capitalized?(arr)
    arr.all? {|word| word == word.capitalize}
end

def no_valid_url?(arr)
    valid = [".com", ".net", ".io", ".org"]
    arr.none? {|url| valid.include?(url[-4..-1])}
end

def any_passing_students?(students)
    students.any? {|student| student[:grades].sum / student[:grades].size >= 75}
end