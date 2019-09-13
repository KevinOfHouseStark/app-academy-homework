require "byebug"
class Array
    def my_uniq
        counts = Hash.new(0)
        unique = []

        self.each {|el| counts[el] += 1}

        counts.keys
    end

    def two_sum
        pairs = []

        (0...self.length - 1).each do |i|
            (i + 1...self.length).each do |j|
                pairs << [i, j] if self[i] + self[j] == 0
            end
        end

        pairs
    end

    def my_transpose
        transposed = Array.new(self.length) {Array.new}

        (0...self.length).each do |i|
            self.each do |array|
                transposed[i] << array[i]
            end
        end

        transposed
    end
end

def stock_picker(prices)
    min = prices.max
    max = 0

    (0...prices.length - 1).each do |i|
        if prices[i] < min
            min = prices[i]
        end
    end

    (1...prices.length).each do |j|
        if prices[j] > max && prices[j] > min && prices.index(min) < j
            max = prices[j]
        end
    end
    
    if max == 0
        return nil
    else
        return [prices.index(min), prices.index(max)]
    end
end