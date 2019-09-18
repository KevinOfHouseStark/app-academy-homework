require 'byebug'

class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise 'Out of bounds' if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    raise 'Out of bounds' if !is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    raise 'Out of bounds' if !is_valid?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, store.length - 1)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % @store.length] << num
  end

  def remove(num)
    @store[num % @store.length].delete(num)
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if self.include?(num)
    self[num] << num
    @count += 1
    resize! if @count > num_buckets
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    else
      return false
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) {Array.new}
    @count = 0
    @store.flatten.each do |num|
      new_store[num] << num
      @count += 1
    end

    @store = new_store
  end
end
