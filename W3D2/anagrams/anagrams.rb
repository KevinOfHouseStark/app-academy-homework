def first_anagram?(str_1, str_2)
    anagrams = str_1.split("").permutation(str_1.length).to_a.map(&:join)

    anagrams.include?(str_2)
end
# Time Complexity: O(n!)

def second_anagram?(str_1, str_2)
    arr_2 = str_2.split("")
    str_1.each_char do |char|
        idx = arr_2.find_index(char)
        if idx.nil?
            return false
        else
            arr_2.delete_at(idx)
        end
    end

    arr_2.empty?
end
# Time Complexity: O(n^2)

# p second_anagram?("hellohellohello", "elhloelhloelhlx")

def third_anagram?(str_1, str_2)
    str_1.split("").sort == str_2.split("").sort
end
# Assuming the sort method is n log n, the method overall's
# time complexity is O(2n log(n)) -> O(n log(n))

# p third_anagram?("hello", "lohel")
# p third_anagram?("hello", "xlhol")

def fourth_anagram?(str_1, str_2)
    hash = Hash.new(0)

    str_1.each_char {|char| hash[char] += 1}
    str_2.each_char {|char| hash[char] -= 1}

    hash.all? {|k,v| v == 0}
end
# Time Complexity: O(n)

# p fourth_anagram?("hello", "lohel")
# p fourth_anagram?("hello", "xlhol")
