
class Entity

    def initialize(name)
        @name = name
        @health = 100
        @mana = 0
        @room = nil
        @description = ""
        @display = " "
        @short_display = " "
    end

    def get_name()
        return @name
    end

    def overall_status()
        display()
        describe()
        display_stats()
    end
        
    def set_display(display)
        @display = display
    end

    def set_short_display(display)
        @short_display = display
    end

    def get_short_display()
        return @short_display
    end

    def display_stats()
        puts "\n" + @name
        puts "HP: " + @health.to_s
    end

    def display()
        puts @display
    end

    def set_description(description)
        @description = description
    end

    def describe()
        puts @description
    end

    def heal(amt)
        @health+=amt
    end

    def add_mana(amt)
        @mana+=amt
    end

    def get_mana()
        return @mana
    end

    def damage(amt)
        @health-=amt
    end

    def remove_mana(amt)
        @mana-=amt
    end

    def get_health()
        return @health
    end
end