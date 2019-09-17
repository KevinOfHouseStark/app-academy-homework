def my_min(list)
    min = list[0]

    (1..list.length - 1).each do |i|
        min = list[i] if list[i] < min
    end

    min
end

# Time Complexity: O(n - 1) -> O(n)

def largest_contiguous_subsum_1(list)
    subarrays = []
    (0...list.length).each do |i|
        (i...list.length).each do |j|
            subarrays << list[i..j] unless subarrays.include?(list[i..j])
        end
    end

    subarrays.map(&:sum).max
end

# Time Complexity: O(n^3)

def largest_contigious_subsum_2(list)
    return list.max if list.all?{|el| el < 0}
    
    max = list[0]
    current = list[0]

    list[1..-1].each do |el|
        current = 0 if current < 0
        current += el
        max = current if current > max
    end

    max
end

# Time Complexity: O(n), Space Complexity: O(1)
