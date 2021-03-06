class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash = 0
    self.each_with_index do |el, i|
      if el.is_a?(Integer) || el.is_a?(String)
        hash += (el.hash + (i + el).hash)
      end
    end

    hash
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash = 0
    self.each do |k,v|
      hash += k.hash + v.hash
    end

    hash
  end
end
