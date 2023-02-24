require_relative "player"
require_relative "spider"
require_relative "treasure"
require_relative "room"
require_relative "charlotte"
require_relative "empty"
require_relative "merchant"
require_relative "end"
require_relative "cavelizard"
require_relative "heal"
require_relative "bandit"
require_relative "skeleton"
require_relative "lore"

class Floor

    def initialize()
        @player = Player.new("Urist McDwarf")
        @desc_array = ["A damp cavern", "A spider's nest", "A small home carved into a cave mushroom", "An ancient hoard", "A beautiful crystal cave", "An old dwarven shrine", "A looted granary", "A humming cave"]
        @enemy_array = [Spider, Charlotte, CaveLizard, Bandit, Skeleton]
        @encounter_array = [Treasure, Empty, Merchant, Heal, Lore]
        @MAX = 15
        @current_room = Room.new("A staircase down...", nil, End.new())
        recursive_generate(@current_room, @MAX)
        @current_room.set_encounter(Empty.new())
    end

    def get_player()
        return @player
    end
    
    def get_current_room()
        return @current_room
    end

    def go(direction)
        system "clear"
        system "cls"
        if (direction.downcase == "north" || direction.downcase == "n") && (@current_room.getNorth != nil)
            @current_room = @current_room.getNorth
        elsif (direction.downcase == "south" || direction.downcase == "s") && (@current_room.getSouth != nil)
            @current_room = @current_room.getSouth
        elsif (direction.downcase == "east" || direction.downcase == "e") && (@current_room.getEast != nil)
            @current_room = @current_room.getEast
        elsif (direction.downcase == "west" || direction.downcase == "w") && (@current_room.getWest != nil)
            @current_room = @current_room.getWest
        else
            puts("No passage!\n")
            return
        end
        @current_room.describe()
        @current_room.display()
            
    end

    def recursive_generate(room, value)
        if(value == 0)
            room.set_encounter(Empty.new())
            @current_room = room
            return
        end

        roll1 = rand(0..3)
        roll2 = rand(0..3)
        roll3 = rand(0..@enemy_array.length()-1)
        roll4 = rand(0..@desc_array.length()-1)
        roll5 = rand(0..@encounter_array.length()-1)

        

        if(roll1 == 0)
            if(room.getNorth == nil)
                nextRoom = Room.new(@desc_array[roll4], @enemy_array[roll3].new, nil)
                room.setNorth(nextRoom)
                nextRoom.setSouth(room)
                self.recursive_generate(nextRoom, value-1)
            end
        elsif(roll1 == 1)
            if(room.getSouth == nil)
                nextRoom = Room.new(@desc_array[roll4], @enemy_array[roll3].new, nil)
                room.setSouth(nextRoom)
                nextRoom.setNorth(room)
                self.recursive_generate(nextRoom, value-1)
            end
        elsif(roll1 == 2)
            if(room.getEast == nil)
                nextRoom = Room.new(@desc_array[roll4], @enemy_array[roll3].new, nil)
                room.setEast(nextRoom)
                nextRoom.setWest(room)
                self.recursive_generate(nextRoom, value-1)
            end
        elsif(roll1 == 3)
            if(room.getWest == nil)
                nextRoom = Room.new(@desc_array[roll4], @enemy_array[roll3].new, nil)
                room.setWest(nextRoom)
                nextRoom.setEast(room)
                self.recursive_generate(nextRoom, value-1)
            end
        end
    
        if(roll2 == 0)
            if(room.getNorth == nil)
                nextRoom = Room.new(@desc_array[roll4], @enemy_array[roll3].new, nil)
                room.setNorth(nextRoom)
                nextRoom.setSouth(room)
                self.recursive_generate(nextRoom, value-1)
            end
        elsif(roll2 == 1)
            if(room.getSouth == nil)
                nextRoom = Room.new(@desc_array[roll4], nil, @encounter_array[roll5].new)
                room.setSouth(nextRoom)
                nextRoom.setNorth(room)
                self.recursive_generate(nextRoom, value-1)
            end
        elsif(roll2 == 2)
            if(room.getEast == nil)
                nextRoom = Room.new(@desc_array[roll4], nil, @encounter_array[roll5].new)
                room.setEast(nextRoom)
                nextRoom.setWest(room)
                self.recursive_generate(nextRoom, value-1)
            end
        elsif(roll2 == 3)
            if(room.getWest == nil)
                nextRoom = Room.new(@desc_array[roll4], @enemy_array[roll3].new, nil)
                room.setWest(nextRoom)
                nextRoom.setEast(room)
                self.recursive_generate(nextRoom, value-1)
            end
        end
    end

        

end