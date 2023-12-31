class Room

    def initialize(num)
        @capacity = num
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        if @capacity > @occupants.length
            return false
        else
            return true
        end
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(name)
        if !self.full?
            @occupants << name
            return true
        else
            return false
        end
    end
end
