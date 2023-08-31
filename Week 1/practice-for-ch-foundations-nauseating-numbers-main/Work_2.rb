'Write a method `anti_prime?` that accepts a number as an argument. The method
should return true if the given number has more divisors than all positive
numbers less than the given number. For example, 24 is an anti-prime because it
has more divisors than any positive number less than 24. Math Fact: Numbers that
meet this criteria are also known as [highly composite
numbers][highly-composite-wiki].'

def anti_prime?(num)
    max_array = (1...num).select { |n| num % n == 0 }
    num.downto(1) do |m|
        array = the_rest(m)
        if array.length > max_array.length
            return false
        end
    end

    return true
end

def the_rest(num)
    array = (1...num).select { |n| num % n == 0 }
    array
end

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false

'Let a 2-dimensional array be known as a "matrix". Write a method
`matrix_addition` that accepts two matrices as arguments. The two matrices are
guaranteed to have the same "height" and "width". The method should return a new
matrix representing the sum of the two arguments. To add matrices, you simply
add the values at the same positions:

plaintext
# programmatically
[[2, 5], [4, 7]] + [[9, 1], [3, 0]] => [[11, 6], [7, 7]]

# structurally
2 5  +  9 1  =>  11 6
4 7     3 0      7 7'

def matrix_addition(mat_1, mat_2)
    new_mat = mat_1
    (0...mat_1.length).each do |idx_1|
        (0...mat_1[0].length).each do |idx_2|
            new_mat[idx_1][idx_2] = mat_1[idx_1][idx_2] + mat_2[idx_1][idx_2]
        end
    end

    new_mat
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

'Write a method `mutual_factors` that accepts any amount of numbers as arguments.
The method should return an array containing all of the common divisors shared
among the arguments. For example, the common divisors of 50 and 30 are \[1, 2,
5, 10\]. You can assume that all of the arguments are positive integers.'

def mutual_factors(*num)
    array = num.to_a

    array.each do |number|
        divisors = (1..number).select { |n| number % n == 0}
        HASH_DIVISORS = Hash.new(0)

        divisors.each do |i|
            HASH_DIVISORS[i] += 1
        end
    end

    HASH_DIVISORS.key(array.length)
end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]
