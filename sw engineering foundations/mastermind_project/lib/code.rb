class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? {|color| POSSIBLE_PEGS.key?(color.upcase)}
  end

  def self.random(len)
    ary = POSSIBLE_PEGS.keys
    return Code.new(Array.new(len) {ary.sample})
  end

  def self.from_string(str)
    return Code.new(str.split(""))
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "Error."
    end
  end

  def [](i)
    @pegs[i]  
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    ctr = 0
    guess.pegs.each_with_index do |ele, i|
      if ele == self[i]
        ctr += 1
      end      
    end
    ctr
  end

  def num_near_matches(guess)
    ctr = 0
    guess.pegs.each_with_index do |ele, i|
      if ele != self[i] && @pegs.include?(ele)
        ctr += 1        
      end
    end
    ctr
  end

  def ==(other_pegs)
    self.pegs == other_pegs.pegs
  end

end
