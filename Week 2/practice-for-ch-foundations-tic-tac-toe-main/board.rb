class Board

    def initialize
        @grid = Array.new(3) {Array.new(3, '_')}
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def valid?(position)
        row, col = position
        if row < 3 and col < 3 and row > -1 and col > -1
            return true
        else
            return false
        end
    end

    def empty?(position)
        self[position] == '_'
    end

    def place_mark(position, mark)
        if self.empty?(position) and self.valid?(position)
            row, col = position
            self[position] = mark
        else
            raise 'Error'
        end
    end

    def print
        @grid.each do |row|
            puts row.join(' ')
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark) }
    end

    def win_diagonal?(mark)
        left_to_right = (0...@grid.length).all? do |i|
            position = [i, i]
            self[position] == mark
        end
        right_to_left = (0...@grid.length).all? do |i|
            row = i
            col = @grid.length - 1 - i
            position = [row, col]
            self[position] == mark
        end
    end

    def win?(mark)
        win_row?(mark) or win_col?(mark) or win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any? { |row| row.any?('_') }
    end
end
