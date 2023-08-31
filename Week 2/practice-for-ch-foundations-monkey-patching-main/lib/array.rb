# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if !self.empty?
            self.max - self.min
        else
            return nil
        end
    end

    def average
        if !self.empty?
            (1.0 * self.sum / self.length)
        else
            return nil
        end
    end

    def median
        if !self.empty?
            sorted = self.sort
            if self.length.even?
                return ((sorted[(self.length / 2) - 1] + sorted[(self.length / 2)]) / 2.0)
            else
                return sorted[(self.length / 2)]
            end
        else
            return nil
        end
    end

    def counts
        count = Hash.new(0)
        self.each do |ele|
            count[ele] += 1
        end

        count
    end

    def my_count(num)
        count = 0
        self.each do |ele|
            if num == ele
                count += 1
            end
        end

        count
    end

    def my_index(num)
        self.each_with_index do |ele, i|
            if num == ele
                return i
            elsif i == self.length-1
                return nil
            end
        end
    end

    def my_uniq
        new_arr = []
        self.each do |ele|
            if !new_arr.include?(ele)
                new_arr << ele
            end
        end

        new_arr
    end

    def my_transpose
        new_arr = []

        (0...self.length).each do |row|
            new_row = []
            (0...self.length).each do |col|
                new_row << self[col][row]
            end
            new_arr << new_row
        end

        new_arr
    end
end
