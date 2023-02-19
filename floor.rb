require_relative "player"
require_relative "spider"
require_relative "treasure"
require_relative "room"
require_relative "charlotte"

class Floor

    def initialize()
        @player = Player.new("Urist McDwarf")
        room1 = Room.new("Cavern",  nil, Treasure.new())
        room2 = Room.new("Spider's Nest",  Charlotte.new(), nil)
        room3 = Room.new("Spider's Hoard",  Spider.new(), nil)
        room4 = Room.new("Shrine",  nil, Treasure.new())

        room1.setNorth(room2)
        room2.setSouth(room1)
        room2.setEast(room3)
        room3.setWest(room2)
        room3.setNorth(room4)
        room4.setSouth(room3)

        @current_room = room1
        @current_room.display()
        @current_room.describe()

    end

    def get_player()
        return @player
    end
    
    def get_current_room()
        return @current_room
    end

    def go(direction)
        if direction == "north" && (@current_room.getNorth != nil)
            @current_room = @current_room.getNorth
        elsif direction == "south" && (@current_room.getSouth != nil)
            @current_room = @current_room.getSouth
        elsif direction == "east" && (@current_room.getEast != nil)
            @current_room = @current_room.getEast
        elsif direction == "west" && (@current_room.getWest != nil)
            @current_room = @current_room.getWest
        else
            puts("No passage!\n")
            return
        end
        @current_room.describe()
        @current_room.display()
            
    end

end