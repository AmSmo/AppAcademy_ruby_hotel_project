require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = rooms.each do |name, capacity|
            rooms[name] = Room.new(capacity)
        end
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
       @rooms 
    end

    def room_exists?(room)
        @rooms.keys.include?(room)
    end

    def check_in(name, room)
        if room_exists?(room)
            if !rooms[room].full?
                rooms[room].add_occupant(name)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end


    def has_vacancy?
        rooms.each_key do |room|
            if !rooms[room].full?
                return true
            end
        end
        return false
    end

    def list_rooms
        rooms.each_key do |room|
            puts "#{room}: #{rooms[room].available_space}"
        end
    end




end
