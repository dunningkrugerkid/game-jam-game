class Room:

    def initialize(name, north, south, east, west, hasEnemy):
        @name = name
        @north = north
        @south = south
        @east = east
        @west = west
        @enemy = enemy
        @description = "An empty room."
    end

    def display():
        puts ". . .\n. " + (enemy != nil ? enemy.getDisplay() : ".") + " .\n. . ."
    end

    def setDescription(description):
        @description = description
    end

    def describe():
        puts @description
    end

end