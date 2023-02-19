class Room

    def initialize(name, enemy, encounter)
        @name = name
        @north = nil
        @south = nil
        @east = nil
        @west = nil
        @enemy = enemy
        @encounter = encounter
    end

    def setNorth(room)
        @north = room
    end

    def setSouth(room)
        @south = room
    end

    def setEast(room)
        @east = room
    end

    def setWest(room)
        @west = room
    end

    def getNorth()
        return @north
    end

    def getSouth()
        return @south
    end

    def getEast()
        return @east
    end

    def getWest()
        return @west
    end
    
    def get_enemy()
        return @enemy
    end

    def set_enemy(enemy)
        @enemy = enemy
    end

    def get_encounter()
        return @encounter
    end

    def set_encounter(encounter)
        @encounter = encounter
    end

    def display()
        puts(@name)
        offset = false
        if(@west != nil) 
            offset = true
        end

        if(@north != nil)
            if(offset)
                puts("   .  ")
            else
                puts("  .  ")
            end
        end

        if(offset)
            puts " . . ."
        else
            puts ". . ."
        end

        if(@west != nil)
            print(".")
        end

        print(". " + (@enemy != nil ? @enemy.get_short_display : @encounter.get_short_display) + " .")

        if(@east != nil)
            print(" .")
        end

        puts("")

        if(offset)
            print(" . . .")
        else
            print(". . .")
        end

        puts("")
        if(@south != nil)
            if(offset)
                puts("   .  ")
            else
                puts("  .  ")
            end
        end
    end

    def get_name()
        return @name
    end

    def describe()
        puts ""
        puts "Exits:"
        if @north != nil
            puts("North:")
            puts @north.get_name
        end
        if @south != nil
            puts("South:")
            puts @south.get_name
        end
        if @east != nil
            puts("East:")
            puts @east.get_name
        end
        if @west != nil
            puts("West:")
            puts @west.get_name
        end
        puts("")
    end
end