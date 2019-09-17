require "byebug"

def max_windowed_range(arr, w)
    current_max_range = 0

    (0..arr.length - w).each do |i|
        range = arr[i...i+w].max - arr[i...i+w].min
        current_max_range = range if range > current_max_range
    end

    return current_max_range
end
#Time Complexity: O(n^3)

# p max_windowed_range([1, 0, 2, 5, 4, 8], 2) # == 4 # 4, 8
# p max_windowed_range([1, 0, 2, 5, 4, 8], 3) # == 5 # 0, 2, 5
# p max_windowed_range([1, 0, 2, 5, 4, 8], 4) # == 6 # 2, 5, 4, 8
# p max_windowed_range([1, 3, 2, 5, 4, 8], 5) # == 6 # 3, 2, 5, 4, 8

class MyQueue
    def initialize
        @store = []
    end

    def peek
        @store.first
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def enqueue(el)
        @store.push(el)
    end

    def dequeue
        @store.unshift
    end
end

class MyStack
    def initialize
        @store = []
    end

    def peek
        @store.last
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def pop
        @store.pop
    end

    def push
        @store.push
    end
end