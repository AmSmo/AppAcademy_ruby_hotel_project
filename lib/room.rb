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
        @occupants.length>=@capacity
    end

    def available_space
        capacity - occupants.length
    end

    def add_occupant(person)
       if self.full?
            return false    
       else
            occupants << person
            return true
       end

    end
    


end
