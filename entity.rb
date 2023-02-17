
class entity:

    def initialize(room):
        @health = 100
        @mana = 0
        @room = room
        @description = description
    end

    def set_description(description):
        @description = description
    end

    def heal(amt):
        @health+=amt
    end

    def add_mana(amt):
        @mana+=amt
    end

    def damage(amt):
        @health-=amt
    end

    def remove_mana(amt):
        @mana-=amt
    end

end