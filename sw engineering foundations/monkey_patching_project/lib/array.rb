# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.empty?
        mm = self.minmax
        return mm[-1] - mm[0]
    end

    def average
        return nil if self.empty?
        return self.sum.to_f / self.size
    end

    def median
        size = self.size
        array = self.sort
        return nil if self.empty?
        if size.odd?
            index = size / 2 
            return array[index]
        else
            index1 = size / 2 - 1
            index2 = size / 2 
            return (array[index2].to_f + array[index1].to_f) / 2
        end
    end

    def counts
        ctr = Hash.new(0)
        self.each { |ele| ctr[ele] += 1 }
        return ctr
    end

    def my_count(i)
        counter = 0
        self.each do |e| 
            if e == i
                 counter += 1
            end
        end
        counter
    end

    def my_index(ele)
        self.each_with_index do |e, i|
            if e == ele
                return i
            end
        end
        nil
    end

    def my_uniq
        Set.new(self).to_a
    end

    def my_transpose
        transposed = []
        self.size.times do |rows|
            newrow = []
            self.size.times do |cols|
                newrow << self[cols][rows]
            end    
            transposed << newrow
        end
        transposed
    end
end
