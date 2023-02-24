require_relative "encounter"

class Empty < Encounter

    def initialize()
        @description = "This room lies empty..."
        @short_display = "."
        @display = " "
    end

    def encounter(player)
        puts @description
    end
end
