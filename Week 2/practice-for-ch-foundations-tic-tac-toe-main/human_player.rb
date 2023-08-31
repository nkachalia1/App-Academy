class HumanPlayer

    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "Enter the position as two numers with a space between them"
        position = gets.chomp.split(" ").map(&:to_i)
        if position.length != 2
            raise "Invalid"
        end
        position
    end
end
