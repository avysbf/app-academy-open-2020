class Room

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        @occupants.size == capacity ? true : false
    end
    
    def available_space
        @capacity - @occupants.size
    end

    def add_occupant (person)
        if self.full?
            false
        else
            @occupants << person
            true
        end
    end
    
end
