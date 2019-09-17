def bad_two_sum?(arr, target)
    (0...arr.length - 1).each do |i|
        (i + 1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target
        end
    end

    false
end
#Time Complexity: O(n^2)

def okay_two_sum?(arr, target)
    arr = arr.sort
    i, j = 0, arr.length - 1

    while i < j
        sum = arr[i] + arr[j]
        return true if sum == target
        i += 1 if sum < target
        j -= 1 if sum > target
    end

    false
end
#Time Complexity: O(n log n + n) -> O(n log n)

def two_sum?(arr, target)
    hash = Hash.new(0)

    arr.each do |el|
        hash[el] = true
        return true if hash[target - el]
    end

    false
end
#Time Complexity: O(n)