require_relative "entity"

class Player < Entity

    def initialize(name)
        super(name)
        @potions = 3
        @attack_bonus = 0
        @gold = 0
        @mana = 15
    end

    def get_potions()
        return @potions
    end

    def change_potions(num)
        @potions += num
    end

    def change_attack_bonus(num)
        @attack_bonus += num
    end

    def get_attack_bonus(num)
        return @attack_bonus
    end

    def get_gold()
        return @gold
    end

    def change_gold(num)
        @gold += num
    end
end

