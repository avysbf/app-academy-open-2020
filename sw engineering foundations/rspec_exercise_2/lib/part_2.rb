def palindrome?(word)
    i = 0
  
    rev = ""
    
    while i < word.length
      char = word[i]
      rev = char + rev
      i+=1
    end
    
    return rev == word
    
end

def substrings (str)
    output = []
    (0...str.length).each do |i|
      (i...str.length).each do |j|
        output << str[i..j]
      end
    end
    output
end


def palindrome_substrings(str)

    subs = substrings(str)
    
    subs.select {|ele| palindrome?(ele) && ele.size > 1}


end