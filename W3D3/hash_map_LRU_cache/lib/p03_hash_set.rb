class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    self[key.hash] << key
    @count += 1
    resize! if @count > num_buckets
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    return false if !self.include?(key)
    self[key.hash].delete(key)
    @count -= 1
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
